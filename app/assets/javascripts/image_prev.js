$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
$('#img_prev').attr('src', e.target.result).css('display', 'block');
    }
    reader.readAsDataURL(input.files[0]);
    }
}
$("#post_image").change(function(){
    readURL(this);
});
});




$(function() {
    function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
  $('#img_prev').attr('src', e.target.result).css('display', 'block');
      }
      reader.readAsDataURL(input.files[0]);
      }
  }
  $("#user_image").change(function(){
      readURL(this);
  });
  });
  