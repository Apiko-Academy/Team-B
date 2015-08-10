Template.CustomerItem.events
  'click [data-action="remove-customer"]': (e) ->
    e.preventDefault()
    customer = Template.currentData().customerName
    company = Template.parentData().company
    Companies.update {_id: company._id},
      $pull: customers: name: customer