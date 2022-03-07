param sbuxtts_name string = 'sbuxtts'
param location string 
param groupID string  = resourceGroup().id
resource sbuxtts 'Microsoft.CognitiveServices/accounts@2021-10-01' = {
  name: sbuxtts_name
  location: location
  sku: {
    name: 'F0'
  }
  kind: 'SpeechServices'
  properties: {
    publicNetworkAccess: 'Enabled'
  }
}

resource private_endpoint 'Microsoft.CognitiveServices/accounts/privateEndpointConnections@2021-10-01'={
  name: '${sbuxtts.name}endpoint'
  location: location
  parent: sbuxtts
  properties: {
    groupIds: [
      groupID
    ]
    privateEndpoint: {}
    privateLinkServiceConnectionState: {
      actionsRequired: 'string'
      description: 'string'
      status: 'Pending'
    }
  }
}
