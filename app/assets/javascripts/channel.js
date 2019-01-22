jQuery(document).on('turbolinks:load', function() {
  $('#chat_client').each(function(){
    var that = this;
    var cable_id = $(that).attr('value');
    var prueba = 0
    console.log(cable_id);
    App.room = App.cable.subscriptions.create("ChatRoomsChannel", {
      connected: function() {
              console.log("connected")
            },
      disconnected: function() {
          console.log("disconnected")
      },
      received: function(data) {
        console.log("Entreeeeee");
        console.log(data);
        $('#chat_messages').append(data['message']);
        $('#chat_messages').scrollTop($('#chat_messages')[0].scrollHeight);
      }
    });
  });
});
