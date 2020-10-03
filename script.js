$(document).ready(function () {
    //toggle ml dl project tab
    $('.mldl').addClass("active");

    // toggle menu/navbar script
    $('.menu-btn').click(function () {
        $('.navbar ul').toggleClass("active");
    });
    $('.navbar ul li a').click(function () {
        $('.navbar ul').removeClass("active");
    });

    // typing anim
    var typed = new Typed(".typing-anim", {
        strings: ["Researcher^500", "NLP Enthusiast^500", "Developer^500", "Freelancer^500"],
        typeSpeed: 100,
        backSpeed: 60,
        loop: true,
    });

    // owl carousel script
    $('.research-carousel').owlCarousel({
        margin: 20,
        loop: true,
        autoplayTimeOut: 1000,
        autoplayHoverPause: true,
        dots: true,
        responsive: {
            0: {
                items: 1,
                nav: false,
            },
            600: {
                items: 1,
                nav: false
            },
            1000: {
                items: 2,
                nav: false,
            }
        }
    });

    //projects tab toggle
    var mldl = document.getElementById("mldlbody");
    var appdev = document.getElementById("appdevbody");
    var webdev = document.getElementById("webdevbody");
    var misc = document.getElementById("miscbody");
    $('.mldl').click(function () {
        mldl.style.display = "flex";
        appdev.style.display = "none";
        webdev.style.display = "none";
        misc.style.display = "none";

        $('.mldl').addClass("active");
        $('.appdev').removeClass("active");
        $('.webdev').removeClass("active");
        $('.miscprojects').removeClass("active");
    });
    $('.appdev').click(function () {
        appdev.style.display = "flex";
        mldl.style.display = "none";
        webdev.style.display = "none";
        misc.style.display = "none";

        $('.appdev').addClass("active");
        $('.mldl').removeClass("active");
        $('.webdev').removeClass("active");
        $('.miscprojects').removeClass("active");
    });
    $('.webdev').click(function () {
        webdev.style.display = "flex";
        appdev.style.display = "none";
        mldl.style.display = "none";
        misc.style.display = "none";

        $('.webdev').addClass("active");
        $('.appdev').removeClass("active");
        $('.mldl').removeClass("active");
        $('.miscprojects').removeClass("active");
    });
    $('.miscprojects').click(function () {
        misc.style.display = "flex";
        appdev.style.display = "none";
        webdev.style.display = "none";
        mldl.style.display = "none";

        $('.miscprojects').addClass("active");
        $('.appdev').removeClass("active");
        $('.webdev').removeClass("active");
        $('.mldl').removeClass("active");
    });
});
