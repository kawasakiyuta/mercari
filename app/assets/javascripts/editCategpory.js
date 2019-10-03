$(document).on('turbolinks:load', function(){
  console.log("hello");
  $("#parent_category").change(function(){

    // id取ってくる
    let id = $(this).val()
    // ajaxでデータ送信する
    $.ajax({
      type: "get",
      url: "/products/get_category_children",
      data: { parent_id : id},
      dataType: "json"
    }).done(function(category){
      console.log(category);
      $("#product_child_category").empty().append("<option>@category_children</option>")
    }).fail(function(){
      alert("category fail");
    })
    // セットし直す
  })
});
