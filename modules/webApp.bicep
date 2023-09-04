param namePrefix string
param location string = resourceGroup().location
param aspId string

resource webApplication 'Microsoft.Web/sites@2022-09-01' = {
  name: namePrefix
  location: location
  tags: {
    environment:'dev-${resourceGroup().name}'
    source: 'deployment with modules'
  }
  properties: {
    serverFarmId: aspId
  }
}

output siteUrl string = webApplication.properties.hostNames[0]
