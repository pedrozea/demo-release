param namePrefix string
param location string = resourceGroup().location
param sku string = 'F1'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: namePrefix
  location: location
  sku: {
    name: sku
  }
}

output aspID string = appServicePlan.id
