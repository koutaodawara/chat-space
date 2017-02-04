$(function() {
  function buildHTML(chat) {
    var html = (
      '<li>'+
      '<div class= "chat-message">' +
      '<div class= "chat-message__header clearfix">' +
      '<div class="chat-message__name">' +
      chat.user_name +
      '</div>'+
      '<div class= "chat-message__time">' +
      chat.created_at +
      '</div>' +
      '</div>' +
      '<p class= "message__body">' +
      chat.text +
      '</p>' +
      '</div>' +
      '</li>'
      );
    return html;
  }

  $('.chat-footer__submit').on('click', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    var chat = textField.val();

    $.ajax({
      type: 'POST',
      url: location.href + '.json',
      data: { chat: {
        text: chat
      }},
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-messages').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
