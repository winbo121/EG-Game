
$(document).ready(function() {
	
	$("#header").load("../views/layout/header.jsp");
	$(".chat_wrapper").load("./chatting.jsp");
	$(".btn_div").load("./footer_btn.jsp");
	$(".footer").load("../layout/footer.jsp");

	$(window).scroll(function() {
		if ($(this).scrollTop() > 40) {
			$('.flBtn-first li').fadeIn();
		} else {
			$('.flBtn-first li').fadeOut();
		}
	});
	
	// 게시판 탭메뉴
	$(".board_content .board_page").hide(); 
	$("#free_board").show();
	$("#sub_menu_li").addClass('selected');
	

	// click이벤트를 이용해서 실행되는 부분
	$("#sub_menu_li a").click(function(e) {
		e.preventDefault();
		$(".board_content .board_page").hide();
		$(".board_menu_nav>ul").children('li').removeClass();
		$(this).closest("li").addClass('selected');
		$('#' + $(this).attr('title')).fadeIn(); 
	});
});

$(".up").click(function() {
	$('html, body').animate({
		scrollTop : 0
	}, 400);
	return false;
});


var swiper = new Swiper( '.game_wrapper.two', {
	pagination: '.swiper-pagination',
	paginationClickable: true,
	effect: 'coverflow',
	loop: true,
	centeredSlides: true,
	slidesPerView: 'auto',
	coverflow: {
		rotate: 0,
		stretch: 100,
		depth: 150,
		modifier: 1.5,
		slideShadows : false,
	}
});

//반응형 자바스크립트 부분으로 최소 넓이가 769px일 때 실행되는 부분 
var mql = window.matchMedia("screen and (min-width: 769px)");

mql.addListener(function(e) {
	if (e.matches) {
		$("#m_nav_wrap").fadeOut(200);
		$(".chat_menu").css("display", "block");
		$(".chat_wrapper").css("display", "block");
		$("body").css("overflow","auto");//body 스크롤바 없애기
		$(".chat_back").css("display","none"); //팝업 뒷배경 display none
	}
	else{
		$('.chat_wrapper').css("display", "none");
	}
});
