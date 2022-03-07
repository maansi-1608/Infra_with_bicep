param sbuxCognitiveServiceName string = 'sbuxcognitiveservice'
param loaction string 
param groupID string = resourceGroup().id
resource sbuxcognitiveservice 'Microsoft.CognitiveServices/accounts@2021-10-01' = {
  name: sbuxCognitiveServiceName
  location: loaction
  sku: {
    name: 'S0'
  }
  kind: 'CognitiveServices'
  identity: {
    type: 'None'
    userAssignedIdentities: {}
  }
  properties: {
    customSubDomainName: sbuxCognitiveServiceName
    publicNetworkAccess: 'Enabled'
  }
}

resource private_endpoint 'Microsoft.CognitiveServices/accounts/privateEndpointConnections@2021-10-01'={
  name: '${sbuxcognitiveservice.name}endpoint'
  parent: sbuxcognitiveservice
  properties: {
    groupIds: [
      groupID
    ]
    privateEndpoint: {}
    privateLinkServiceConnectionState: {
      actionsRequired: 'string'
      description: 'string'
      status: 'string'
    }
  }
}
