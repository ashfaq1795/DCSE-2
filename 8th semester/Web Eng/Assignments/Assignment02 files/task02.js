$(document).ready(function(){
    $(window).on('resize',function(){
        const windowwidth=$(window).width();
        const fontsize=windowwidth/20;
        $('#size').css('font-size',fontsize +'px');
    });
})