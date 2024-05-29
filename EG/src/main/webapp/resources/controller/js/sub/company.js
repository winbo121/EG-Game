$(function(){
	$("#company_header").load("/EG/header/");
	$(".footer").load("/EG/footer/");
	
	$('.bi-arrow-down-short').click(function(){
		$(this).prev('.bottom').find('.git').slideDown();
		$(this).hide();		
	});
});	


$(".over").hover(function() {

	$(".list_sub").css("display", "block");

}, function() {
	
	$(".list_sub").css("display", "none");
});


/*카카오 맵 api*/
