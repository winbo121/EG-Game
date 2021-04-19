
$(document).ready(function() {
	
	$("#m_nav_btn").click(function() {
		$('#m_nav_wrap').fadeIn(200);
	});

	$("#m_nav_btn_close").click(function() {
		$('#m_nav_wrap').fadeOut(200);
	});
});

$(".over").hover(function() {

	$(".list_sub").css("display", "block");

}, function() {
	
	$(".list_sub").css("display", "none");
});


//pc(768px 이상)일 때 실행하는 부분
var pc_swiper = new Swiper('.swiper-container-pc', {
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
      delay: 2500,
      disableOnInteraction: false,
    },
    pagination: {
      el: '.swiper-pagination-pc',
      clickable: true,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });

// 모바일일 때 실행하는 부분
var mobile_swiper = new Swiper('.swiper-container-mobile', {
    effect: 'cube',
    grabCursor: true,
    cubeEffect: {
      shadow: true,
      slideShadows: true,
      shadowOffset: 20,
      shadowScale: 0.94,
    },
    pagination: {
      el: '.swiper-pagination',
    },
});