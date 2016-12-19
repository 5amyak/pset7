<?php

    // configuration
    require("../includes/config.php");

    //rows regarding user logged in
    $rows = CS50::query("SELECT * FROM history WHERE user_id = ?", $_SESSION["id"]);
    
    // render portfolio
    render("history_view.php", ["rows" => $rows, "title" => "History"]);

?>
