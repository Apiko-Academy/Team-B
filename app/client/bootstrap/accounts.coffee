AccountsTemplates.addField
  _id: 'username'
  type: 'text'
  required: true
#  TODO: Uncomment after server-side checker implement
#  func: (value) ->
#    if (Meteor.isClient) {
#      self = this
#      Meteor.call"userExists", value, (err, userExists) ->
#        unless userExists
#          self.setSuccess()
#        else
#          self.setError userExists
#        self.setValidating false
#    else if Meteor.isServer
#      Meteor.call "userExists", value

AccountsTemplates.addFiles
  _id: 'fullname'
  type: 'text'
  displayname: 'Fullname'
  required: true