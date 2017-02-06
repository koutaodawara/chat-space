$(document).on('turbolinks:load', function() {
  $(function() {

    function appendUserHTML(user) {
      var html =
        '<div class="chat-group-user clearfix">' +
        '<p class="chat-group-user__name">'      +
        user.name                                +
        '</p>'                                   +
        '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' +
        user.id                                  +
        '" data-user-name="'                     +
        user.name                                +
        '">追加'                                 +
        '</a>'                                   +
        '</div>'
        return html
      }

    function buildUserHTML(id, name){
      var html =
      '<div class="chat-group-user clearfix" id="chat-group-user-' +
       id                                                          +
       '"->'                                                       +
      '<input name="group[user_ids][]"" type="hidden" value="'     +
      id                                                           +
      '">'                                                         +
      '<p class="chat-group-user__name">'                          +
        name                                                       +
      '</p>'                                                       +
      '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id="' +
        id                                                         +
        '">削除'                                                    +
        '</a>'                                                     +
        '</div>';
      return html
    }

    function editElement(element) {
      var result = "^" + element;
      return result;
    }

    $("#user-search-field").on("keyup click", function() {
      var input = $("#user-search-field").val();
      var inputs = input.split(" ");
      var newInputs = inputs.map(editElement);
      var reg = RegExp(newInputs.join("|"));

      $.ajax({
        type: 'GET',
        url: '/users.json',
        data: { user: input
          },
        dataType: 'json'
        })
        .done(function(json) {
          var insertHTML = '';
          json.forEach(function(user){
            user_name = user.name
            if (user_name.match(reg)){
              insertHTML += appendUserHTML(user);
            }
          });
          $('#user-search-result').html(insertHTML);
        })
        .fail(function() {
          alert('エラーが発生しました');
        });
      });

    $('#user-search-result').on('click', '.user-search-add',function(){
      var $this = $(this);
      var id = $this.data('userId');
      var name = $this.data('userName');
      var insertHTML = buildUserHTML(id, name);

      $('#chat-group-users').append(insertHTML);

      $this.parent('.chat-group-user').remove();
    });

    $("#chat-group-users").on('click', '.user-search-remove', function(){
      var $this = $(this);
      var id = $this.data('userId');

      $('#chat-group-user-' + id).remove();
      });
    });
});
