$(function() {
  // Ajaxカウント機能
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

  // タブ切り替え機能
  $('.category a').on('click', function() {
    $('.category a').removeClass("active")
    $('.goods_list').removeClass("active").css('display','none')
    var list_num = $(this).attr("class")
    $(this).addClass("active")
    $('.goods_list' + ' .' + list_num).addClass("active").css('display','block')
  });
});
