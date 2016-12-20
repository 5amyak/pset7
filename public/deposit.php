<?php

    // configuration
    require("../includes/config.php"); 

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // else render form
        render("deposit_form.php", ["title" => "Deposit Money"]);
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        // validate submission
        if (empty($_POST["money"]))
        {
            apologize("You must provide Money to be deposited.");
        }
        
        if (!is_numeric($_POST["money"]))
        {
            apologize("You must input Money Correctly");
        }
        
        $money = floatval($_POST["money"]);
        if ($money < 0)
        {
            apologize("You must input Money Correctly");
        }
        
        else {
            CS50::query("UPDATE users SET cash = cash + ? WHERE id = ?", $money, $_SESSION["id"]);
            redirect("index.php");
        }
    }
?>
