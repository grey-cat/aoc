# https://adventofcode.com/2015/day/2
$inputdata = Get-Content .\inputs\2015\02.txt

$totalpaperrequired = 0
$totalrequiredribbon = 0

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
    
    # Calculate paper required
    $requiredpaper = $surfacearea + $smallestside[0]


    $totalpaperrequired += $requiredpaper

    # Part 2
    # The ribbon required to wrap a present is the shortest distance around its sides,
    # or the smallest perimeter of any one face. 
    # Each present also requires a bow made out of ribbon as well;
    # the feet of ribbon required for the perfect bow is equal to the cubic feet of volume of the present.

    # A present with dimensions 2x3x4 requires 2+2+3+3 = 10 feet of ribbon to wrap the present plus 2*3*4 = 24 feet of ribbon for the bow, for a total of 34 feet.
    # sort sides by shorest side

    $sortedsides = $length, $width, $height | Sort-Object 
    $ribbon = $sortedsides[0] + $sortedsides[0] + $sortedsides[1] + $sortedsides[1]
    $bow = $sortedsides[0] * $sortedsides[1] * $sortedsides[2]
    $requiredribbon = $ribbon + $bow
    $totalrequiredribbon += $requiredribbon
}

$totalpaperrequired
$totalrequiredribbon
