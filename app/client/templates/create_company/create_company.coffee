AutoForm.addHooks 'insertCompanyForm',
  onSuccess: () ->
    Router.go 'userProfile'
  onError: (action, error) ->
    Winston.warn """
      User '#{Meteor.userId()}' got an error
      '#{error.message}' on 'InsertCompanyForm'
    """
    sAlert.error error.message