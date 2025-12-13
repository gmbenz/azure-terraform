# ================================
# Create Service Principal for Terraform
# ================================

param(
    [Parameter(Mandatory = $false)]
    [string]$SubscriptionId = "",

    [Parameter(Mandatory = $false)]
    [string]$SpName = "terraform-sp",

    [Parameter(Mandatory = $false)]
    [string]$Role = "Contributor",

    [Parameter(Mandatory = $false)]
    [string]$Scope = ""
)

# If no scope is provided, default to subscription-level
if (-not $Scope) {
    $Scope = "/subscriptions/$SubscriptionId"
}

Write-Host "Creating service principal '$SpName' with role '$Role' at scope '$Scope'..."

# Create the service principal and capture JSON output
$sp = az ad sp create-for-rbac `
    --name $SpName `
    --role $Role `
    --scopes $Scope `
    | ConvertFrom-Json

Write-Host "Service principal created successfully."
Write-Host ""

# ================================
# Map values to Terraform environment variables
# ================================

$env:ARM_CLIENT_ID        = if ($sp.appId) { $sp.appId } else { $sp.clientId }
$env:ARM_CLIENT_SECRET    = if ($sp.password) { $sp.password } else { $sp.clientSecret }
$env:ARM_TENANT_ID        = if ($sp.tenant) { $sp.tenant } else { $sp.tenantId }
$env:ARM_SUBSCRIPTION_ID  = $SubscriptionId

Write-Host "Terraform environment variables have been set:"
Write-Host "  ARM_CLIENT_ID        = $($env:ARM_CLIENT_ID)"
Write-Host "  ARM_TENANT_ID        = $($env:ARM_TENANT_ID)"
Write-Host "  ARM_SUBSCRIPTION_ID  = $($env:ARM_SUBSCRIPTION_ID)"
Write-Host ""
Write-Host "ARM_CLIENT_SECRET has been set but is hidden for security."
Write-Host ""
Write-Host "You can now run Terraform commands in this session."
