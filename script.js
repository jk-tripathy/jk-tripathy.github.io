$(document).ready(function(){
    // toggle menu/navbar script
    $('.menu-btn').click(function(){
        $('.navbar ul').toggleClass("active");
    });
    $('.navbar ul li a').click(function(){
        $('.navbar ul').removeClass("active");
    });

    // typing anim
    var typed = new Typed(".typing-anim", {
        strings: ["Researcher^500", "NLP Enthusiast^500", "Developer^500", "Freelancer^500"],
        typeSpeed: 100,
        backSpeed: 60,
        loop: true,
    });
});

