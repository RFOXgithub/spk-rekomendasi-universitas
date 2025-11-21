<div class="container">
    <h2>Data Kriteria</h2>

    <?php
    $indicator_map = [
        1 => "Sangat Rendah",
        2 => "Rendah",
        3 => "Cukup",
        4 => "Tinggi",
        5 => "Sangat Tinggi"
    ];
    ?>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>No</th>
                <th>Kriteria</th>
                <th>Nilai</th>
                <th>Penjelasan</th>
                <th>Indicator</th>
            </tr>
        </thead>
        <tbody>
            <?php $i = 1; ?>

            <?php foreach ($grouped_kriteria as $kriteria => $rows): ?>
                <?php foreach ($rows as $rowIndex => $row): ?>
                    <tr>
                        <?php if ($rowIndex == 0): ?>
                            <td rowspan="<?php echo count($rows); ?>"><?php echo $i++; ?></td>
                            <td rowspan="<?php echo count($rows); ?>"><?php echo $kriteria; ?></td>
                        <?php endif; ?>

                        <td><?php echo $row['nilai_sub_kriteria']; ?></td>
                        <td><?php echo $row['nama_sub_kriteria']; ?></td>

                        <td style="text-align: left;">
                            <?php echo $indicator_map[$row['nilai_sub_kriteria']] ?? 'Tidak Ada'; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
            <?php endforeach; ?>
        </tbody>
    </table>

    <a href="<?php echo site_url('kriteria/perbandinganKriteria/'); ?>" class="btn btn-lanjut" style="margin-left: auto;">Lanjut</a>
</div>