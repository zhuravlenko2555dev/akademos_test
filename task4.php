<?php
function carry($arr)
{
    $carries = [];
    $lengths = array_map('strlen', $arr);
    $maxLength = max($lengths);

    for ($i = 0; $i < $maxLength; $i++) {
        $s = 0;

        if ($i !== 0) {
            $s += end($carries);
        }

        for ($y = 0; $y < count($arr); $y++) {
            if (strlen($arr[$y]) > $i) {
                $s += substr($arr[$y], 0 - ($i + 1), 1);
            }
        }

        if ($s > 9) {
            array_push($carries, 1);
        }
    }

    return array_sum($carries);
}

echo carry([123, 456]).PHP_EOL; // 0
echo carry([555, 555]).PHP_EOL; // 3
echo carry([123, 594]).PHP_EOL; // 1
echo carry([123, 123, 804]).PHP_EOL; // 2
