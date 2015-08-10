Template.registerHelper 'collection', () ->
  collectionList = Mongo.Collection.getAll()
  collections = {}
  _.each collectionList, (item) ->
    collections[item.name] = item.instance
  collections