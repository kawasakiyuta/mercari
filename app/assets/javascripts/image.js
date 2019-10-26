$(document).on('turbolinks:load', function(){
  var dropzone = $('.main-section__form-image-box-upload--drop_box');

  var images = [];
  var inputs  =[];
  var preview = $('#preview');
  
  $('.main-section__form-image-box-upload').on('change', 'input[type= "file"].upload-image',function(event) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);

    $.each(images, function(index, image) {
      image.attr('data-image', index);
      preview.append(image);
    })
    if(images.length == 4) {
      dropzone.find('pre').replaceWith('<i class="fa fa-camera"></i>')
    }
    if(images.length == 5) {
      dropzone.css({
        'display': 'none'
      })
    }
    
  });

});