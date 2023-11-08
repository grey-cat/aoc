# https://adventofcode.com/2015/day/1
$inputdata = (Get-Content .\inputs\2015\01.txt).ToCharArray()
#$inputdata = "(()(()("

# Starts on the ground floor
$floor = 0

# Calculate question 2
$sequencenumber = 0
$firstbasementvisit = $false 

foreach($input in $inputdata){
# What floor do the instructions take Santa
    switch ($input) {
        # Go up 1 floor
        {$input -eq '('} { $floor++ }

        # Go down one floor
        {$input -eq ')'} { $floor--}
    }# end switch

# What is the position of the character that causes Santa to first enter the basement?
$sequencenumber ++

if ($floor -eq -1 -and $firstbasementvisit -eq $false){
    Write-Host  "Part two answer: $sequencenumber"
    $firstbasementvisit = $true    
}
}

Write-Host  "Part one answer: $floor"