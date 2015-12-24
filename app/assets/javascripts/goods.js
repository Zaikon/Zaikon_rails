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
    $('.goods_list').removeClass("active").fadeOut(50);
    var list_num = $(this).attr("class")
    $(this).addClass("active")
    $('.goods_list_background' + ' .' + list_num).fadeIn(1000);
  });
});

$(function(){
    // 「.modal-open」をクリック
    $('.modal-open').click(function(){
        // オーバーレイ用の要素を追加
        $('body').append('<div class="modal-overlay"></div>');
        // オーバーレイをフェードイン
        $('.modal-overlay').fadeIn('fast');

        // モーダルコンテンツのIDを取得
        var modal = '#' + $(this).attr('data-target');
        // モーダルコンテンツの表示位置を設定
        modalResize();
         // モーダルコンテンツフェードイン
        $(modal).fadeIn('fast');

        // 「.modal-overlay」あるいは「.modal-close」をクリック
        $('.modal-overlay, .modal-close').off().click(function(){
            // モーダルコンテンツとオーバーレイをフェードアウト
            $(modal).fadeOut('fast');
            $('.modal-overlay').fadeOut('fast',function(){
                // オーバーレイを削除
                $('.modal-overlay').remove();
            });
        });

        // リサイズしたら表示位置を再取得
        $(window).on('resize', function(){
            modalResize();
        });

        // モーダルコンテンツの表示位置を設定する関数
        function modalResize(){
            // ウィンドウの横幅、高さを取得
            var w = $(window).width();
            var h = $(window).height();

            // モーダルコンテンツの表示位置を取得
            var x = (w - $(modal).outerWidth(true)) / 2;
            var y = (h) / 2 - (h) / 4;

            // モーダルコンテンツの表示位置を設定
            $(modal).css({'left': x + 'px','top': y + 'px'});
        }

    });
});
