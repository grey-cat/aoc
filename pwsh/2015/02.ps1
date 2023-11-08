# https://adventofcode.com/2015/day/2
$inputdata = Get-Content .\inputs\2015\02.txt

$totalpaperrequired = 0
# find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l

foreach ($entry in $inputdata) {
    
    $entry = $entry -split "x"

    [int]$length = $entry[0];
    [int]$width = $entry[1];
    [int]$height = $entry[2]


    # Calculate surface area
    [int]$side1 = ($length * $width)
    [int]$side2 = ($width * $height)
    [int]$side3 = ($height * $length)
    
    [int]$surfacearea = ( 2 * $side1  ) + (2 * $side2 ) + (2 * $side3 )

    # Calculate smallest side
    $smallestside = $side1, $side2, $side3 | Sort-Object
    $requiredpaper = $surfacearea + $smallestside[0]
    $totalpaperrequired += $requiredpaper
}

$totalpaperrequired