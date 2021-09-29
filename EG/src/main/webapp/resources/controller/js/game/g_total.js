
$(function() {
	
	$("#g_header").load("/EG/header/");
	$(".footer").load("/EG/footer/");
	
	$('.comment_btn').click(function() {
		$('#comment_contents').slideToggle(300);
	});
});
