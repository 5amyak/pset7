<?php

    // configuration
    require("../includes/config.php");
    
    // symbols of shares owned by user
    $symbols = CS50::query("SELECT symbol FROM portfolios WHERE user_id = ?", $_SESSION["id"]);

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // render sell form
        if ($symbols)
        render("sell_form.php", ["title" => "Sell", "symbols" => $symbols]);
        
        else {
            apologize("You have no shares to sell.");
        }
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        
        foreach ($symbols as $symbol):
            if (isset($_POST[$symbol["symbol"]])) {
            $price = lookup($symbol["symbol"])["price"];
            $shares = CS50::query("SELECT shares FROM portfolios WHERE user_id = ? AND symbol = ?", $_SESSION["id"], $symbol["symbol"]);
            $cash = $price * $shares[0]["shares"];
            
            date_default_timezone_set("Asia/Kolkata");
                $date = date("d-M-Y l H:i:s");
                
            CS50::query("INSERT INTO history (user_id, date_time, symbol, transaction_type, shares, price, cash_involved) VALUES(?, ?, ?, ?, ?, ?, ?)",
                         $_SESSION["id"], $date, $symbol["symbol"], "Sell", $shares[0]["shares"], $price, $cash);
            CS50::query("DELETE FROM portfolios WHERE user_id = ? AND symbol = ?", $_SESSION["id"], $symbol["symbol"]);
            CS50::query("UPDATE users SET cash = cash + ? WHERE id = ?", $cash, $_SESSION["id"]);
            }
        endforeach;
        // redirect to home page
        redirect("index.php");
    }
    
?>