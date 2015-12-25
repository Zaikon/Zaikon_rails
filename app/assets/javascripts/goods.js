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
    $('.goods_list').removeClass("active").fadeOut(0);
    var list_num = $(this).attr("class")
    $(this).addClass("active")
    $('.goods_list_background' + ' .' + list_num).fadeIn(500);
  });
});

// モーダル機能
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

// インクリメントサーチ機能
$(window).on('page:load page:change', function() {
  var timer;
  var preInput = "";

  var ajaxSearch = function(input) {
    $.ajax({
      url: "/goods/new",
      type: "GET",
      dataType: 'script',                          // jsファイルを指定したいので、dataTypeをscriptに指定
      data: ("keyword=" + input)
    });
  };

  var triggerAjax = function(input) {
    if(preInput !== input){                        //文字列が変更ときのみメソッド実行する
      clearTimeout(timer);
      timer = setTimeout(ajaxSearch, 300, input);
      // 処理を200ms毎に実行
    };
  };


  $('#api_good_search').on('keyup', function() {
    input = $.trim($(this).val());                // 文字列の先頭と末尾の空白を削除
    triggerAjax(input);
    preInput = input;
  });
});

// apiモーダル機能
$(function(){
    // 「.modal-api-open」をクリック
    $('.modal-api-open').click(function(){
        // オーバーレイ用の要素を追加
        $('body').append('<div class="modal-overlay"></div>');
        // オーバーレイをフェードイン
        $('.modal-overlay').fadeIn('fast');

        // モーダルコンテンツのIDを取得
        modal = '#' + $(this).attr('data-target');
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
            var y = 50;

            // モーダルコンテンツの表示位置を設定
            $(modal).css({'left': x + 'px','top': y + 'px'});
        }
    });
});

// モーダル画面の情報取得
$(function() {
    $('.modal-content').delegate('.api-return-list', 'click', function(){
        content = $(this)
        $('.api-return-list').removeClass("list-border")
        $(this).addClass("list-border")
        var image_url = content.find('a img').attr('src')
        var amazon_url = content.find('a').attr('href')
        var goods_name = $(content.find('span')[1]).text()

        $('#good_name').val(goods_name);
        $('#good_image').val(image_url);
        $('#good_amazon_url').val(amazon_url);
    });
    // 「.modal-overlay」あるいは「.modal-close」をクリック
    $('.modal-content').delegate('.api-return-list', 'dblclick', function(){
        // モーダルコンテンツとオーバーレイをフェードアウト
        $(modal).fadeOut('fast');
        $('.modal-overlay').fadeOut('fast',function(){
            // オーバーレイを削除
            $('.modal-overlay').remove();
        });
    });
});
