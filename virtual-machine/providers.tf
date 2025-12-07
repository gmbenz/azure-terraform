#data "azurerm_subscriptions" "all" {}

provider "azurerm" {
  features {}
  subscription_id = "81fb6f8e-e791-4ef5-ac89-8b3259d4b23e"
#  subscription_id = one([
#    for s in data.azurerm_subscriptions.all.subscriptions : s.subscription_id
#    if s.display_name == var.subscription_name
#  ])
}
