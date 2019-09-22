
$(document).on("turbolinks:load", ()=>{
  function feeCalculation(inputPrice){
    var saleFee = Math.floor(inputPrice*0.1);
    var saleProfit = inputPrice - saleFee;

    $('.fee-right').text(`¥${saleFee.toLocaleString()}`);
    $('.profit-right').text(`¥${saleProfit.toLocaleString()}`)
  }

  $('#selling-item-price').on('keyup', function() {
    var inputPrice = $('#selling-item-price').val();
    if ( 300 <= inputPrice && inputPrice <= 9999999) {
      feeCalculation(inputPrice) 
    } else {
      $('.fee-right').text('-');
      $('.profit-right').text('-');
    }
  });
});