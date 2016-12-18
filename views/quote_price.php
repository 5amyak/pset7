<?php 
        extract($values);
        $format_price = number_format($price, 2);
?>

<h4>The Price of a Share of <?= $name?> (<?= $symbol ?>) is <strong>$<?= $format_price ?></strong></h4>