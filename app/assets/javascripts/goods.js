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
  $('.category_group a').on('click', function() {
    $('.category_group a').removeClass("active")
    $('.goods_list div').removeClass("active").css('display','none')
    console.log("test")
    var list_num = $(this).attr("class")
    console.log(list_num)
    $(this).addClass("active")
    $('.goods_list' + ' .' + list_num).addClass("active").css('display','block');
  });
});
