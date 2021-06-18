<?php
function getNumOfUniqueCharacters($str, $n)
{
    $countUC = 0;
    $lcStr = mb_strtolower($str);
    $countByChar = count_chars($lcStr,0);

    foreach ($countByChar as $v) {
        if ($v >= $n) {
            $countUC++;
        }
    }

    return $countUC;
}

echo getNumOfUniqueCharacters('A1B2C3', 2).PHP_EOL; // 0
echo getNumOfUniqueCharacters('A1a1C1', 2).PHP_EOL; // 2, because A and 1 both occur 2 or more times.
echo getNumOfUniqueCharacters('Alabama', 3).PHP_EOL; // 1