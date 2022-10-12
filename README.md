Challenge 1:

Step 1:

Created Terraform Stroage Backend (For State and modules)

Step 2:

Created Terraform modules single stack and push it to storage container (modules)

Step 3:

Download Modules and then proceed with Terraform approach

Step 4: Terraform Build

Terraform Init
Terraform fmt
Terraform validate
Publish Artifact to CD process

Step 5: Terraform Deployment

Terraform init
Terraform plan
Terraform apply

There were some issues with the CI / CD Setup due to the modules approach so intergrated in the local machine itself.

Resources created:

AzureRG / AzureVNET / AzureNSG / Azure Application Gateway / Azure App service / Internal Load balancer / Azure SQL Database / Azure Storage Account / Azure Logic App




Future Advancements:

Integrate A new SP connection and use it for the creation of the resources or project wise
Enable Replace Tokens plugin to fetch the credentials and secrets and store it in the terraform tf files
Seperate Modules for each resource and construct a staged pipeline.
Migrate the code to (Pipeline as a code YAML)
Set onCOnditions=True to enable or skip the stage task running in the pipeline



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
