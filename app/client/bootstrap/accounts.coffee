AccountsTemplates.addField
  _id: 'username'
  type: 'text'
  required: true
  minLength: 3
  maxLength: 32
  re: /^[\w]{3,32}$/
  errStr: 'Invalid username'
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

AccountsTemplates.addField
  _id: 'fullname'
  type: 'text'
  displayname: 'Fullname'
  required: true
  re: /^[\w]{2,140}$/
  errStr: 'Invalid fullname'