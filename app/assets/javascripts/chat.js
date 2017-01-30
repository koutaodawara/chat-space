$(function() {
  function buildHTML(chat) {
    var html = $('<p class="chat-message__body">').append(chat.content);
    return html;
  }

  $('.chat-footer__body').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.chat-footer__body');
    var chat = textField.val();
    $.ajax({
      type: 'POST',
      url: '/chats.json',
      data: 'chat',
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-message__body').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
