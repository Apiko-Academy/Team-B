@Activities = new Mongo.Collection 'activities'

Activities.allow
  insert: -> true
  update: -> true
  remove: -> true

denyChecker = (userId) ->
  deny = not Meteor.userId()
  if deny
    Winston.warn '''
      non-autorized user tries to get access to the "Activity" collection
    '''
  deny

Activities.deny
  insert:
    denyChecker
  update:
    denyChecker
  remove:
    denyChecker

Activities.attachSchema schemas.Activity
