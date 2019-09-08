//*トークン作成
document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
      Payjp.setPublicKey("pk_test_8c9bf832da690b7c0102c484"); //ここに公開鍵を直書き
      let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得されます
      btn.addEventListener("click", e => { //ボタンが押されたときに作動します
        e.preventDefault(); //ボタンを一旦無効化します
        let card = {
          number: document.getElementById("cardnumber").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        }; //入力されたデータを取得します。
        Payjp.createToken(card, (status, response) => {
          console.log(response)
          if (status === 200) { //成功した場合
            $("#cardnumber").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //取得したトークンを送信できる状態にします
            document.inputForm.submit();
            alert("登録が完了しました"); //確認用
          } else {
            alert("カード情報が正しくありません。"); //確認用
          }
        });
      });
    }
  },
  false
);



// var form = $("#card__form");
//   Payjp.setPublicKey("pk_test_8c9bf832da690b7c0102c484");
//   $("#submit_btn").on("click",function(e){
//     e.preventDefault();
//     var card = {
//       number: $("#card_number").val(),
//       cvc: $("#card_cvc").val(),
//       exp_month: $("#card_month").val(),
//       exp_year: $("#card_year").val()
//     };
//     Payjp.createToken(card,function(status,response){
//       form.find("input[type=submit]").prop("disabled", true);
//       if(status == 200){//←うまくいった場合200になるので
//         $("#card_number").removeAttr("name");
//         $("#card_cvc").removeAttr("name");
//         $("#card_month").removeAttr("name");
//         $("#card_year").removeAttr("name");
//         var payjphtml = `<input type="hidden" name="payjpToken" value=${response.id}>`
//         form.append(payjphtml);
//         document.inputForm.submit();
//         alert("登録が完了しました");
//       }else{
//         alert("カード情報が正しくありません。");
//       }
//     });
//   });
