Template.CompanyInfo.events
  "click [data-action='remove-company']": (e) ->
    e.preventDefault()
    # to get company id:
    # Template.currentData()._id
    # or
    # this._id (@_id)
    Companies.remove @_id, (err) ->
      if (err)
        sAlert.error err.message
        Winston.error err.message

Template.CompanyInfo.onRendered () ->
  @$('[data-toggle="tooltip"]').tooltip()