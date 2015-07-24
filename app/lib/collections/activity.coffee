@Activity = new Mongo.Collection 'activity'

Activity.allow
  insert: -> true
  update: -> true
  remove: -> true

Activity.deny
  insert: (userId, doc) ->
    not Meteor.userId()
  update: ->
    not Meteor.userId()
  remove: ->
    not Meteor.userId()

Activity.attachSchema schemas.Activity
