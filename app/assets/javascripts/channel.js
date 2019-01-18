jQuery(document).on('turbolinks:load', function() {
  $('#chat_client').each(function(){
    var that = this;
    var cable_id = $(that).attr('value');
    var prueba = 0
    console.log(cable_id);
    App.room = App.cable.subscriptions.create("ChatChannel", {
      connected: function() {
              prueba = 1
              console.log("connected")
            },
      disconnected: function() {
          console.log("disconnected de nuevo")
      },
      received: function(data) {
        if (cable_id == "mozo" && prueba ==1) {
          if (data['message'].slice(0,4) == "mozo") {
            return $('#kitchen').prepend(data['message'].slice(4));
          }

        } else if(cable_id == "chef" && prueba ==1){
          if (data['message'].slice(0,4) == "chef") {
            return $('#kitchen').prepend(data['message'].slice(4));
          }
        }


      }
    });
  });
});
