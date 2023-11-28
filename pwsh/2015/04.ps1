# Compute the hash of a string
$sampledata1 = "abcdef"
$stringAsStream = [System.IO.MemoryStream]::new()
$writer = [System.IO.StreamWriter]::new($stringAsStream)
$writer.write("$sampledata1")
$writer.Flush()
$stringAsStream.Position = 0
Get-FileHash -InputStream $stringAsStream -Algorithm MD5 | Select-Object Hash



$utf8 = new-object -TypeName System.Text.UTF8Encoding
$stream = [System.IO.MemoryStream]::new($utf8.GetBytes($sampledata1))
$hash = Get-FileHash -Algorithm MD5 -InputStream $stream | Select-Object -ExpandProperty Hash
