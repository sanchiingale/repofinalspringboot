terraform {    
  required_providers {    
    azurerm = {    
      source = "hashicorp/azurerm" 
      version="3.5.0"
         
    }    
  }    
}    
provider "azurerm" { 
  skip_provider_registration=true 
  features {}    
} 
locals {
  resource_group = "learn-80816c8f-face-4329-b883-633b433932a0"
  location="Central US"
}
   
resource "azurerm_service_plan" "MyAppSanchi" {
  name                = "appli0802"
  resource_group_name = local.resource_group
  location            = local.location
  os_type             = "Linux"
  sku_name            = "F1"
}
resource "azurerm_app_service" "AppServiceSanchi" {
  name                = "sanchiin02"
  location            =  local.location
  resource_group_name = local.resource_group
  app_service_plan_id = azurerm_service_plan.MyAppSanchi.id

 
  }
  resource "azurerm_container_registry" "acr" {
  name                = "san0802containerregi08"
  resource_group_name = local.resource_group
  location            = local.location
  sku                 = "Basic"
  admin_enabled       = true
  
}
