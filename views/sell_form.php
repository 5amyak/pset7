<form action="sell.php" method="post">
    <fieldset>
        <div class="form-group">
            <?php extract($values);
            foreach ($symbols as $symbol): ?>
                <input type="checkbox" name="<?= $symbol["symbol"] ?>" value="<?= $symbol["symbol"] ?>"> <?= $symbol["symbol"] ?>  <br>
            <?php endforeach ?>
        </div>
        <div class="form-group">
            <button class="btn btn-default" type="submit">
                <span aria-hidden="true" class="glyphicon glyphicon-sell"></span>
                Sell
            </button>
        </div>
    </fieldset>
</form>