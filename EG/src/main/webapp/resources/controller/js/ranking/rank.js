
$(document).ready(function() {
	
	$("#header").load("../layout/header.jsp");
	$(".footer").load("../layout/footer.jsp");
	
	
	$(".game_rankpage").hide(); 
	$("#total").show();
	$("#sub_menu_li").addClass('selected');
	
	
	// click이벤트를 이용해서 실행되는 부분
	$("#sub_menu_li a").click(function(e) {
		$('html, body').scrollTop(0);
		e.preventDefault();
		$(".game_rankpage").hide();
		$(".rank_nav>ul").children('li').removeClass();
		$(this).closest("li").addClass('selected');
		$('#' + $(this).attr('title')).fadeIn(); 
	});
});