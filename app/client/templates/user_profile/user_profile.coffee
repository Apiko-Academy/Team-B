Template.UserProfile.helpers
  userEmail:() ->
    if Meteor.user()
      Meteor.user().emails[0].address
  userRole: () ->
    user = Meteor.user()
    if Roles.userIsInRole user._id, 'admin'
      role = 'Owner'
    else if user.profile.companies.length
      role = 'Invited user'
    else
      role = 'None'
  userInitials: () ->
    fullname = Meteor.user().profile.fullname
    [x[0].toUpperCase() for x in fullname.split(' ')].join('')