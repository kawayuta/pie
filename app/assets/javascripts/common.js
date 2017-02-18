$(document).ready(function(){

    /******************************************
    事前準備
    *******************************************/

    //タブボタンの数を取得
    var tabQuantity = $('.tab__button').length;

    //タブの長さとボディの長さの差分を取得
    var tabExtraDistance = $('.tab').width() - $('.tabContainer').width();


    /******************************************
    スライダー発動
    *******************************************/

    var slider = $('.contents').bxSlider({
        pager:false,
        controls:false,
        onSlideBefore: function($slideElement, oldIndex, newIndex){
            //スライドする時に関数を呼び出す。newIndexはスライダーの現在地。
            slideChange(newIndex);
        }
    });


    /******************************************
    スライドする時に発動する関数。タブの表示調整を行う。
    *******************************************/

    function slideChange(newIndex){

        //クラスを調整
        $('.tab__button').removeClass('active');
        $('.tab > div:nth-child(' + ( newIndex + 1 ) + ')').addClass('active');

        //スクロールするべき距離を取得。タブ全体の長さ / ( タブの個数 - 1 ) * スライドの現在地
        var scrollDestination = ( tabExtraDistance / (tabQuantity - 1) ) * ( newIndex );

        //スクロール位置を調整
        $('.tabContainer').animate({ scrollLeft: scrollDestination }, 'slow');

    }

    /******************************************
    タブボタンクリックで発動する関数
    *******************************************/

    $('.tab__button').on('click',function(e){

        //何番目の要素かを取ってスライドを移動する
        var nth = $('.tab__button').index(this);
        slider.goToSlide(nth);

        //クリックイベントを無効化
        e.preventDefault();

    })

});