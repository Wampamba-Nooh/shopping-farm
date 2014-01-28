class QualityProductPlus.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    content: null

class QualityProductPlus.Collections.PostsCollection extends Backbone.Collection
  model: QualityProductPlus.Models.Post
  url: '/posts'
