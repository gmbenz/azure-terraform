data "azurerm_subscriptions" "all" {}

provider "azurerm" {
  features {}
  subscription_id = one([
    for s in data.azurerm_subscriptions.all.subscriptions : s.subscription_id
    if s.display_name == var.subscription_name
  ])
}
