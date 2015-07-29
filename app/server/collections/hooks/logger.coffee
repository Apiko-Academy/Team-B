collections = [
  collection: Activities
  itemName: 'Activity'
,
  collection: Meteor.users
  itemName: 'Users'
,
  collection: Invitations
  itemName: 'Invitation'
,
  collection: Companies
  itemName: 'Company'
]

opTypes = [
  hookName: 'insert'
  opName: 'inserted'
,
  hookName: 'update'
  opName: 'updated'
,
  hookName: 'remove'
  opName: 'removed'
]

generateMessage = (collectionInfo) ->
  _.each opTypes, (operation) ->
    collectionInfo.collection.after[operation.hookName] (userId, doc) ->
      if userId
        message = [
          "#{collection.itemName} '#{doc._id}'",
          "#{operation.opName} by '#{userId}'."
        ].join ' '
      else
        message = [
          "#{collectionInfo.itemName} '#{doc._id}'",
          "has been #{operation.opName}."
        ].join ' '
      Winston.info message


_.each collections, (collectionInfo) ->
  generateMessage collectionInfo
