$(document).on("turbolinks:load", function() {

  $('#chat_client').each(function(){
    $("#new_message").on("keypress", function(e) {
      if (e && e.keyCode === 13) {
        e.preventDefault();
        return $(this).submit();
      }
    });

    $('#chat_messages').scrollTop($('#chat_messages')[0].scrollHeight);
  });



});
