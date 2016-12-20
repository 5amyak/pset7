<?php

    // configuration
    require("../includes/config.php"); 

    // rows regarding user logged in
    $rows = CS50::query("SELECT * FROM portfolios WHERE user_id = ?", $_SESSION["id"]);
    
    // iterate over each stock user owns
    // look for latest price
    // store it
    $positions = [];
    foreach ($rows as $row)
    {
        $stock = lookup($row["symbol"]);
        if ($stock !== false)
        {
            $positions[] = [
                "name" => $stock["name"],
                "price" => $stock["price"],
                "shares" => $row["shares"],
                "symbol" => $row["symbol"]
            ];
        }
    }
    
    // store the latest cash value the user owns
    $cash_balance = CS50::query("SELECT cash FROM users WHERE id = ?", $_SESSION["id"]);
    
    // render portfolio and pass the data
    render("portfolio.php", ["positions" => $positions, "title" => "Portfolio", "cash_balance" => $cash_balance[0]]);

?>
