Template.CompanyProfile.events
  "click [data-action='rm-company']": (e) ->
    e.preventDefault()
    currentId = Template.currentData().company._id
    Companies.remove currentId, (err) ->
      if (err)
        sAlert.error err.message
        Winstom.error err.message
      else
        Router.go 'userProfile'

Template.CompanyProfile.helpers
  companyInfo: () ->
    Companies.findOne()
  navigation: () ->
    navs = [
      title: 'PROJECTS'
      target: 'projects'
    ,
      title: 'CUSTOMERS'
      target: 'customers'
    ,
      title: 'USERS'
      target: 'users'
    ,
      title: 'RESOURCES'
      target: 'recources'
    ]

    for nav in navs
      if nav.target == Template.currentData().target
        nav.class = 'active'
      else
        nav.class = ''

    navs
