$(function() {
  function buildHTML(chat) {
    var image_url = chat.image.image.url

    if (!image_url) {
     var image = ""
    } else {
     var image = '<img src=' + image_url + ' width="300" height="300" >'
    }

    var html =
      '<li>'                                         +
      '<div class= "chat-message">'                  +
      '<div class= "chat-message__header clearfix">' +
      '<div class="chat-message__name">'             +
      chat.user_name                                 +
      '</div>'                                       +
      '<div class= "chat-message__time">'            +
      chat.created_at                                +
      '</div>'                                       +
      '</div>'                                       +
      '<p class= "message__body">'                   +
      chat.text                                      +
      '</p>'                                         +
      image                                          +
      '</div>'                                       +
      '</li>';
    return html;
  };

  $('.chat-footer__submit').on('click', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    var fileField = $('#message_image');


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
      fileField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });

// ここにchatのurlしか動かないように設定してあげる.もしくは、stubを使用し特定のjsファイルしか読めないようにする。またはlengthメソッドで実装できる
  setInterval(function(){
    $.ajax({
      type: 'GET',
      url: location.href + '.json',
      dataType: 'json'
    })
    .done(function(data){
      console.log(data);
      data.forEach(function(chat){
        buildHTML(chat);
      })
    })

  }, 4000)
});
