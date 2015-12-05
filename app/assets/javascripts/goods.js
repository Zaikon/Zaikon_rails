$(function() {
  // カウント機能の実装
  $('.count').on('click', function() {
    var get_id = $(this).attr("id");
    var id = "#good_" + get_id
    var id_num = id + "_num"
    $(id).on('ajax:success', function(e, data, status, xhr) {
    $(id_num).text(data.stock_num)
  }).on('ajax:error', function(err) {
    console.log(err)
  });
  });

console.log("読み込まれました")
  $('ul #list').on('click', function() {
    // 一度currentを全て外す→thisにcurrentをあてる
    $('ul #list').removeClass("active")
    console.log("クラス解除!")
    $(this).addClass("active")
  });


});
