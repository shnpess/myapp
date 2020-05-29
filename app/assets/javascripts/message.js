$(function(){ 
  function buildHTML(message){
    if ( message.id === message.current_user_id ) {
      var html =
      `<div class="chat__message__content" data-message-id=${message.message_id}>
        <div class="chat__message__right">
          <img src=${message.picture} id="message__right__user__image" >
          <div class="chat__message__right__content">
          ${message.content}
          </div>
        </div>
        <div class="message__right__created">
        ${message.created_at}
        </div>
      </div>`
     return html;
    } else {
      var html =
      `<div class="chat__message__content" data-message-id=${message.message_id}>
        <div class="chat__message__right">
          <img src=${message.picture} id="message__left__user__image" >
          <div class="chat__message__left__content">
          ${message.content}
          </div>
        </div>
        <div class="message__left__created">
        ${message.created_at}
        </div>
     </div>`
     return html;
    };   
  }
  




     $('#new__message').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
       .done(function(data){
         var html = buildHTML(data);
         $('.chat__content').append(html);
         $('.right__contents ').animate({ scrollTop: $('.right__contents ')[0].scrollHeight});
         $('form')[0].reset();
         $('.comment__send__btn').prop('disabled', false);
      })
  });

  var reloadMessages = function() {
    
    var last_message_id = $('.chat__message__content:last').data("message-id");
    
    $.ajax({
      url: "api/messages",
      type: 'get',
      dataType: 'json',
     
      data: {id: last_message_id}
    })
    .done(function(messages) {
      if (messages.length !== 0) {

        var insertHTML = '';
      
        $.each(messages, function(i, message) {
          insertHTML += buildHTML(message)
        });
   
        $('.chat__content').append(insertHTML);
        $('.right__contents').animate({ scrollTop: $('.right__contents')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('error');
    });
  };

  if (document.location.href.match(/\/posts\/\d+\/groups\/\d+\/messages/)) {
    setInterval(reloadMessages, 7000);
  }
});
  