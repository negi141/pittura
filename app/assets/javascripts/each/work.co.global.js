// スクロール位置も考慮したcanvas要素の座標
var getElementPosition = function (elem){
    var position = elem.getBoundingClientRect();
    return {
        left: window.scrollX + position.left,
        top: window.scrollY + position.top
    }
}

var toast = new Toast();
