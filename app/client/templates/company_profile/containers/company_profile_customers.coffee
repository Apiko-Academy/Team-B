Template.CompanyCustomers.helpers
  customersInfo: () ->
    customers = Template.currentData().company.customers
    _.map customers, (customer, index) ->
      index: index + 1
      customerName: customer.name
      fieldName: 'customers.' + index + '.name'
      updateCustomer: 'updateCustomer' + index