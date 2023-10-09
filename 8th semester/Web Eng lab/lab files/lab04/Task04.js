$(document).ready(function(){

    $('.btn1').click(function(){
        $('.box').toggleClass('toggle');
    })

    $('.btn2').click(function(){
        $('.box').toggleClass('border');
    })

    $('.btn3').click(function(){
        $('.container').append('<div class=\'box3 box\'></div>');
    })
})