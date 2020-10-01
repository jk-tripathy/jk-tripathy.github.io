$(document).ready(function(){
    // toggle menu/navbar script
    $('.menu-btn').click(function(){
        console.log("sojfhg")
        $('.navbar ul').addClass("active");
    });
    $('.navbar ul li a').click(function(){
        console.log("asd")
        $('.navbar ul').removeClass("active");
    });
});
