# https://adventofcode.com/2015/day/3

#$inputdata = (Get-Content .\inputs\2015\03.txt).ToCharArray()
$inputdata = ("^>").ToCharArray()
[int]$X = 0
[int]$Y = 0
$locationlist = New-Object Collections.Generic.List[object]

foreach ($move in $inputdata) {
    $null = $location
    switch ($move) {
        ('>') { $X++ ;break }
        ('<') { $X-- ;break }
        ('^') { $Y++ ;break }
        ('v') { $Y-- ;break }
    }
    
    [hashtable]$location = [ordered]@{X = $X; Y = $Y}

    [void]$locationlist.Add($location)


}

$locationlist | Select-Object -Property X, Y
