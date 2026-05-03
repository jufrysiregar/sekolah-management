<?php
passthru('php artisan migrate --force 2>&1', $return_var);
echo "\nExit code: " . $return_var;
?>
