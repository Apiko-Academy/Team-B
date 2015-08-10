Router.configure
  layoutTemplate: 'SimpleLayout'
  loadingTemplate: 'Loading'
  notFoundTemplate: 'NotFound'

AccountsTemplates.configureRoute 'signIn',
  layoutTemplate: 'Layout'
  redirect: () ->
    user = Meteor.user()
    unless user
      return
    if user.profile.companies.length
      Router.go 'userProfile'
    else
      Router.go 'createCompany'


AccountsTemplates.configureRoute 'signUp',
  layoutTemplate: 'Layout'
  redirect: () ->
    Router.go 'createCompany'

Router._scrollToHash = (hash) ->
  hash = 'body' unless hash.length
  $section = $ hash
  if $section.length
    $('html, body').animate
      scrollTop: $section.offset().top
    ,
      'slow'

Router.route '/',
  name: 'home'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'HomeMenu', to: 'layoutMenu'
    @render 'Home'

Router.route '/user/profile',
  name: 'userProfile'
  waitOn: () ->
    Meteor.subscribe 'fullUserInfo'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'DefaultMenu', to: 'layoutMenu'
    @render 'UserProfile'

Router.route '/access-forbidden',
  name: 'accessForbidden'

Router.goToAccessForbidden = () ->
  url = Iron.Location.get().path
  Winston.warn "Request to forbidden URL \"#{url}\""
  Router.go 'accessForbidden'

Router.route '/company/create',
  name: 'createCompany'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'DefaultMenu', to: 'layoutMenu'
    @render 'CreateCompany'

Router.route '/company/profile/:_id/:target?',
  name: 'companyProfile'
  layoutTemplate: 'Layout'
  waitOn: () ->
    Meteor.subscribe 'companyInfo', @params._id
  action: () ->
    company = Companies.findOne()
    tpls =
      customers: 'CompanyCustomers'
      projects: 'CompanyProjects'
      users: 'CompanyUsers'
      resources: 'CompanyResources'
    if not @params.target
      @params.target = 'projects'
    currTpl = tpls[@params.target]
    @render 'DefaultMenu', to: 'layoutMenu'
    @render currTpl, to: 'companySection'
    @render 'CompanyProfile', data:
      company: company
      target: @params.target


Router.onBeforeAction () ->
  if Meteor.userId()
    @next()
  else
    Router.goToAccessForbidden()
,
  only: ['createCompany', 'userProfile']