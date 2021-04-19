
$(function() {
	
	$("#g_header").load("../layout/header.jsp");
	$(".footer").load("../layout/footer.jsp");
	
	$('.comment_btn').click(function() {
		$('#comment_contents').slideToggle(300);
	});
});
