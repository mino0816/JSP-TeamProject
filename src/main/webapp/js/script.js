$(document).ready(function(){

    //관리자페이지_메뉴
    $('#content .admin_menu .menu ul li').click(function(){
        $(this).children('.menu_dep').stop().slideToggle();
    })

    //관리자페이지 메뉴 스크롤시 좌측고정스크립트 작성하기

    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 4,
        pagination: {
            el: ".swiper-pagination",
            type: "fraction",
            
        }
    });

});