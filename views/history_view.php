<table class="table table-striped">
    <tr>
        <td>  <b>Date & Time</b>   </td>
        <td>  <b>Symbol</b> </td>
        <td>  <b>Transaction Type</b> </td>
        <td>  <b>Shares</b> </td>
        <td>  <b>Cost</b>   </td>
        <td>  <b>Cash Involved</b>   </td>
    </tr>
    <?php extract($values);
    foreach ($rows as $row):
        //format output to improve readability
        $row["cash_involved"] = number_format($row["cash_involved"], 2);
        $row["price"] = number_format($row["price"], 2); ?>
    
            <tr>
                <td><?= $row["date_time"] ?></td>
                <td><?= $row["symbol"] ?></td>
                <td><?= $row["transaction_type"] ?></td>
                <td><?= $row["shares"] ?></td>
                <td>$<?= $row["price"] ?></td>
                <td>$<?= $row["cash_involved"] ?></td>
            </tr>
    
    <?php endforeach ?>
</table>