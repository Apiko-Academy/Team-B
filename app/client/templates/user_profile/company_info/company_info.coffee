Template.CompanyInfo.events
  "click [data-action='remove']": (e) ->
    e.preventDefault()
    # to get company id:
    # Template.currentData()._id
    # or
    # this._id (@_id)
    Companies.remove @_id, (err) ->
      if (err)
        sAlert.error err
        Winston.error err

Template.CompanyInfo.onRendered () ->
  @$('[data-toggle="tooltip"]').tooltip()