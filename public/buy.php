<?php

    // configuration
    require("../includes/config.php");

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // render buy form
        render("buy_form.php", ["title" => "Buy"]);
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        //form validating
        if (empty($_POST["symbol"]))
        {
            apologize("You must provide Symbol.");
        }
        
        if (empty($_POST["shares"]))
        {
            apologize("You must provide Shares.");
        }
        
        if (!preg_match("/^\d+$/", $_POST["shares"]))
        {
            apologize("You must provide Shares in Exact Amount.");
        }
        
        else {
            $data = lookup($_POST["symbol"]);
            if (!$data) {
                apologize("Invalid Symbol");
            }
            
            $cash = $data["price"] * $_POST["shares"];
            $current = CS50::query("SELECT cash FROM users WHERE id = ?", $_SESSION["id"]);
            if ($cash > $current[0]["cash"]) {
                apologize("You don't have enough money.");
            }
            
            else {
                date_default_timezone_set("Asia/Kolkata");
                $date = date("d-M-Y l H:i:s");
                
                CS50::query("INSERT INTO history (user_id, date_time, symbol, transaction_type, shares, price, cash_involved) VALUES(?, ?, ?, ?, ?, ?, ?)",
                             $_SESSION["id"], $date, $data["symbol"], "Buy", $_POST["shares"], $data["price"], $cash);
                CS50::query("INSERT INTO portfolios (user_id, symbol, shares) VALUES(?, ?, ?)
                             ON DUPLICATE KEY UPDATE shares = shares + ?", $_SESSION["id"], $data["symbol"], $_POST["shares"], $_POST["shares"]);
                CS50::query("UPDATE users SET cash = cash - ? WHERE id = ?", $cash, $_SESSION["id"]);
            }
        }
        
        // redirect to home page
        redirect("index.php");
    }
    
?>