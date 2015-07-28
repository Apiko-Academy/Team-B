schema = new SimpleSchema
  fullname:
    type: String
    label: 'Full name'
    min: 2
    max: 140
  photo:
    type: String
    regEx: SimpleSchema.regEx.Id
    label: 'Photo'
    optional: true
  companies:
    type: [Mongo.ObjectID]
    label: 'Companies'
    defaultValue: []
  'companies.$':
    regEx: SimpleSchema.RegEx.Id

Namespace 'schemas', UserProfile:schema
