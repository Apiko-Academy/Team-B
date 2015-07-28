@Companies = new Mongo.Collection 'companies'

Companies.allow
  insert: -> true
  update: -> true
  remove: -> true

denyChecker = (userId) ->
  deny = not Meteor.userId()
  if deny
    Winston.warn '''
      non-autorized user tries to get access to the "Invitations" collection
    '''
  deny

Companies.deny
  insert: (userId, doc) ->
    denyChecker
  update: ->
    denyChecker
  remove: ->
    denyChecker

Companies.attachSchema schemas.Company
