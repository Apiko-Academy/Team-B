Template.UserProfile.events
  'click [data-action="remove-user"]': ->
    Meteor.users.remove Meteor.userId(), (err) ->
      if (err)
        sAlert.error err.message
        Winstom.error err.message
      else
        Router.go 'home'

Template.UserProfile.helpers
  userEmail:() ->
    if Meteor.user()
      Meteor.user().emails[0].address
  userRole: () ->
    user = Meteor.user()
    if Roles.userIsInRole user._id, 'admin'
      'Admin'
    else if user.profile.companies.length
      'Owner'
    else
      'None'
  userInitials: () ->
    fullname = ''
    for word in Meteor.user().profile.fullname.split(' ')
      fullname += word[0].toUpperCase()
    fullname