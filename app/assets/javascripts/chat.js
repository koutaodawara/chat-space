$(function() {
  function buildHTML(chat) {

    if (chat.image) {
      var image = '<img src=' + chat.image.image.url + ' width="300" height="300" >'
    } else {
      var image = ""
    }

    var html =
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
      '</p>'+
      image +
      '</div>' +
      '</li>';
    return html;
  };

  $('.chat-footer__submit').on('click', function(e) {
    e.preventDefault();
    var textField = $('#message_body');


    $.ajax({
      type: 'POST',
      url: location.href + '.json',
      data: new FormData($(".new_chat")[0]),
      processData: false,
      contentType: false,
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
