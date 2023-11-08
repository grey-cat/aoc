# https://adventofcode.com/2015/day/1
$inputdata = (Get-Content .\inputs\2015\01.txt).ToCharArray()
#$inputdata = "(()(()("

# Starts on the ground floor
$floor = 0
$position = 0
$basementvisit = 0 

foreach($input in $inputdata){
    $position++
    switch ($input) {
        # Go up 1 floor
        {$input -eq '('} { $floor++ }

        # Go down one floor
        {$input -eq ')'} { $floor--}
    }
        if (($floor -eq -1) -and ($basementvisit -eq 0)){
        Write-Host  "Part two: $position"
    }
    $basementvisit++
}

Write-Host  "Part one: $floor"