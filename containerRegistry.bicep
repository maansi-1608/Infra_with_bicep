param sbuxregistry_name string = 'sbuxregistry'
param loaction string 

resource registries_sbuxregistry 'Microsoft.ContainerRegistry/registries@2021-12-01-preview' = {
  name: sbuxregistry_name
  location: loaction
  sku: {
    name: 'Standard'
    //tier: 'Standard'
  }
  properties: {
    adminUserEnabled: true
    policies: {
      quarantinePolicy: {
        status: 'disabled'
      }
      trustPolicy: {
        type: 'Notary'
        status: 'disabled'
      }
      retentionPolicy: {
        days: 7
        status: 'disabled'
      }
      exportPolicy: {
        status: 'enabled'
      }
    }
    encryption: {
      status: 'disabled'
    }
    dataEndpointEnabled: false
    publicNetworkAccess: 'Enabled'
    networkRuleBypassOptions: 'AzureServices'
    zoneRedundancy: 'Disabled'
    anonymousPullEnabled: false
  }
}
