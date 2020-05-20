$(function(){ 
  function buildHTML(message){
    if ( message.image ) {
     var html =
     `<div class="chat__message">
     ${message.content}
     ${message.user_name}
     ${message.created_at}
     
     
     </div>`
     return html;
    } else {
      var html =
      `<div class="chat__message">
     ${message.content}
     ${message.user_name}
     ${message.created_at}
    
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
  });
  










