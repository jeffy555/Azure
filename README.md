Challenge 2:

Metdatainstance can be executed only inside the Virtual Machine

VM INstance - WIndows / LInux

In Windows:

$app = Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -NoProxy -Uri "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | ConvertTo-Json -Depth 64
$app > details.json
$app = Get-Content "details.json" | ConvertFrom-Json 
$app.(fetch_remaining_details)


Challenge 3:

New-Object -TypeName System.Version -ArgumentList "1.2.3.4"
$app = New-Object -TypeName System.Version -ArgumentList "1.2.3.4"

Output:


PS C:\Users\User> $app                                                                                                  
Major  Minor  Build  Revision
-----  -----  -----  --------
1      2      3      4


Pull in the value using:

$app.Major
$app.Build
