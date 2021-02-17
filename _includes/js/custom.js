jtd.onReady(function () {
    const article = document.getElementsByClassName('dropdown')[0];
    article.onmouseover = function () {
        article.classList.add('active');
    }
    article.onmouseout = function () {
        article.classList.remove('active');
    }
    const header = document.getElementsByClassName("main-header")[0];
    const sticky = header.offsetTop;
    function setAttributes (){
        const coloredHeader= document.getElementById('colored-section');
        const examplesHeader= document.getElementById('examples-header');
        const heightOfColoredHeader = coloredHeader.offsetHeight;
        examplesHeader.style.height = heightOfColoredHeader + "px";
    }

    function stickHeader() {
        if (window.pageYOffset > sticky) {
            header.classList.add("sticky");
        } else {
            header.classList.remove("sticky");
        }
    }
    window.onscroll = function () {
        stickHeader();
    };
    window.onload = function() {
        setAttributes();
    };

});
