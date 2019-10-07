$(document).on('turbolinks:load', function(){
  var dropzone = $('.main-section__form-image-box-upload--drop_box');
  var dropzone2 = $('.main-section__form-image-box-upload--drop_box2');

  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview');
  var preview2 = $('#preview2');
  
  $(document).on('change', 'input[type= "file"].upload-image',function(event) {
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
    var container = $(".main-section__form-image-box-upload--container");
    switch( images.length ) {
        case 1:
            // var value1 = $('.main-section__form-image-box-upload--container').find('label').for
            // $('.main-section__form-image-box-upload--drop_boxmain-section__form-image-box-upload').eq(1).css({
              // 'display': 'none'
            // })
            container.append(`<input class="upload-image" data-image="0" type="file" name="product[images_attributes][1][image]" id="product_images_attributes_1_image">`)
            console.log('1');

            // console.log(value1);

          break;
    
        case 2:
            console.log('2');
            break;
  
    }
    if(images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      dropzone.css({
        'display': 'none'
        
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        if(index < 5){
          preview.append(image);
        }else{
          preview2.append(image); 
        }
      })
      if(images.length == 9) {
        dropzone2.find('pre').replaceWith('<i class="fa fa-camera"></i>')
      }
    } else {
      $('#preview').empty();
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
    }
    if(images.length == 4) {
      dropzone.find('pre').replaceWith('<i class="fa fa-camera"></i>')
    }
    if(images.length == 10) {
      dropzone2.css({
        'display': 'none'
      })
      return;
    }
    var new_image = $(`<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image);
  });

  $(document).on('click', '.delete', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
            'data-image': 0
          })
        }
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    if (images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image2.attr('data-image', index);
        if(index < 5){
          preview.append(image);
        }else{
          preview2.append(image); 
        }
      })

      if(images.length == 9) {
        dropzone2.find('pre').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 8) {
        dropzone2.find('i').replaceWith('<pre class="visible-pc">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</pre>')
      }
    } else {
      dropzone.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
    }
    if(images.length == 4) {
      dropzone2.css({
        'display': 'none'
      })
    }
    if(images.length == 3) {
      dropzone.find('i').replaceWith('<pre class="visible-pc">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</pre>')
    }
  })
});
