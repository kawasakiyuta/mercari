$(document).on('turbolinks:load', function(){
  var dropzone = $('.main-section__form-image-box-upload--container');
  var images = [];
  var preview = $('#preview');

  if($('.input-box').length == 6) {
    dropzone.css({
      'display': 'none'
    })
  }
  
  // 画像ファイルを変更したら発火
  $(document).on('change', 'input[type= "file"].upload-image',function(e) {
    console.log($(this).parent().data('image'))
    // 入力されたファイルを取得
    var file = e.target.files[0];
    // ファイルのブラウザ上でのURLを作成する
    var blobUrl = URL.createObjectURL(file);
    console.log(blobUrl);
    // プレビューが存在すれば、そのプレビューのsrcを書き換える
    console.log($('.js-preview'))
    if ($('.js-preview').length) {
      $('.js-preview').attr('src',(blobUrl)) ;
      // ここに編集で押したsrcを書き換えるコードをかく（ちょろっと）
      return;
    }
    // $('.js-preview')ここに編集を行いたいがなん書いてないから今return;がなっている
    // imgタグを生成し、srcに上で作ったURLを渡す
    var img = `<div class="img_view">
                  <img class='js-preview' src="${blobUrl}">
                  <div class="btn_wrapper">
                    <div class="btn edit">
                      <label for="product_images_attributes_0_image">編集</label>
                    </div>
                    <div class="btn delete">削除</div>
                  </div>
                </div>`
    // #preview に追加する
    $('#preview').append(img);
    console.log($(this).parent().data('image'))

    if($(this).parent().data('image') == 4) {
      dropzone.css({
        'display': 'none'
      })
    }

    // var reader = new FileReader();
    // var img = $(`<div class="img_view"><img></div>`);
    // reader.onload = function(e) {
    //   var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
    //   img.append(btn_wrapper);
    //   console.log(img)
    //   img.find('img').attr({
    //     src: e.target.result
    //   })
    // }
    // reader.readAsDataURL(file);
    // if(images.length >= 5) {
    //   dropzone2.css({
    //     'display': 'block'
    //   })
    //   dropzone.css({
    //     'display': 'none'
        
    //   })
    //   $.each(images, function(index, image) {
    //     image.attr('data-image', index);
    //     preview2.append(image);                     
    //     dropzone2.css({
    //       'width': `calc(100% - (128px * ${images.length - 5}))`
    //     })
    //   })
    //   if(images.length == 9) {
    //     dropzone2.find('pre').replaceWith('<i class="fa fa-camera"></i>')
    //   }
    // } else {
    //   $('#preview').empty();
    //   $.each(images, function(index, image) {
    //     image.attr('data-image', index);
    //     preview.append(image);
    //   })
    //   dropzone.css({
    //     'width': `calc(100% - (128px * ${images.length}))`
    //   })
    // }
    // if(images.length == 4) {
    //   dropzone.find('pre').replaceWith('<i class="fa fa-camera"></i>')
    // }
    // if(images.length == 10) {
    //   dropzone2.css({
    //     'display': 'none'
    //   })
    //   return;
    // }
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
        preview2.append(image);
      })
      dropzone2.css({
        'width': `calc(100% - (128px * ${images.length - 5}))`
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
      dropzone.css({
        'width': `calc(100% - (128px * ${images.length}))`
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
