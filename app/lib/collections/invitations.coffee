@Invitations = new Mongo.Collection 'invitations'

Invitations.allow
  insert: -> true
  update: -> true
  remove: -> true

Invitations.deny
  insert: (userId, doc) ->
    not Meteor.userId()
  update: ->
    not Meteor.userId()
  remove: ->
    not Meteor.userId()

Invitations.attachSchema schemas.Invitation
