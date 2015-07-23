AccountsTemplates.addField
  _id: 'username'
  type: 'text'
  required: true
  minLength: 3
  maxLength: 32
  re: /^[\w]{3,32}$/
  errStr: 'Invalid username'

AccountsTemplates.addField
  _id: 'fullname'
  type: 'text'
  displayname: 'Fullname'
  required: true
  re: /^[\w]{2,140}$/
  errStr: 'Invalid fullname'