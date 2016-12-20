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
        
        // value entered not a numeric string
        if (!is_numeric($_POST["money"]))
        {
            apologize("You must input Money Correctly");
        }
        
        // convert string value to float
        $money = floatval($_POST["money"]);
        // negative money
        if ($money < 0)
        {
            apologize("You must input Money Correctly");
        }
        
        else {
            // update amount of cash user owns
            CS50::query("UPDATE users SET cash = cash + ? WHERE id = ?", $money, $_SESSION["id"]);
            
            // redirect to home page
            redirect("index.php");
        }
    }
?>
