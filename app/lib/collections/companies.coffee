@Companies = new Mongo.Collection 'companies'

Companies.allow
  insert: -> true
  update: -> true
  remove: -> true

Companies.deny
  insert: (userId, doc) ->
    not Meteor.userId()
  update: ->
    not Meteor.userId()
  remove: ->
    not Meteor.userId()

Companies.attachSchema schemas.Company
