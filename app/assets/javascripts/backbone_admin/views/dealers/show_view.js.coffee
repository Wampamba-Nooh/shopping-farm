ShoppingFarm.Admin.Views.Dealers ||= {}

class ShoppingFarm.Admin.Views.Dealers.ShowView extends Backbone.View
  template: JST["backbone_admin/templates/dealers/show"]
  tagName: "div"

  events:
    "click #send-authorization" : "send_authorization"

  send_authorization: (e) =>
    $.ajax(
      type: 'GET'
      dataType: 'json'
      url: "/admin/dealer_profiles/#{@model.id}/send_authorization"
      success: (data) =>
        bootbox.alert("Доступы отправлены на #{@model.get('email')}");
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
