
$(".inquiry .icon").hover(function() {

	$(".hidden_desc").css("display", "block");

}, function() {
	
	$(".hidden_desc").css("display", "none");
});

$(document).ready(function() {
	
	$("#header").load("/EG/header/");
	$(".footer").load("/EG/footer/");
	
	$(window).scroll(function() {
		if ($(this).scrollTop() > 40) {
			$(".flBtn-first li").last().fadeIn();
		} else {
			$('.flBtn-first li').fadeOut();
		}
	});
	
	$("#m_nav_btn").click(function() {
		$('#m_nav_wrap').fadeIn(200);
	});

	$("#m_nav_btn_close").click(function() {
		$('#m_nav_wrap').fadeOut(200);
	});
});

var swiper = new Swiper('.ns_content', {
	slidesPerView : 'auto',

});

/*
 * $(".qa_page").hide();
 * 
 * $(".customer_tabs ul li a").click(function(e) { $('html, body').scrollTop(0);
 * e.preventDefault(); $("#qa_menu_li").addClass('selected');
 * 
 * var i = $('#' + $(this).attr('id')).fadeIn();
 * 
 * console.log(i); });
 */



	
	$("#inquiry_email_etc").click(function() {
		if(this.checked == true){
			$("#inquiry_email2").css("display", "inline-block");
			$("#select_st").css("display", "none");
		}
		else{
			$("#select_st").css("display", "inline-block");
			$("#inquiry_email2").css("display", "none");
		}
	});
	

$(".over").hover(function() {

	$(".list_sub").css("display", "block");

}, function() {
	
	$(".list_sub").css("display", "none");
});



function readURL(input) {
	  if (input.files && input.files[0]) {

		var reader = new FileReader();

		reader.onload = function(e) {

			var filenames = $("<span>").html(input.files[0].name).attr("class", "file_name");
			
			$(".list_add").append(filenames);
		};

		reader.readAsDataURL(input.files[0]);

	} else {
		removeUpload();
	}
}

function remove_file(){
	$('#fileUpload').replaceWith($('#fileUpload').clone());
	$('.file_name').remove();
	$("#fileUpload").val("");
}


/*자유게시판 글쓰기 및 수정*/
	
$(function(){
	$('select[name = category]').change(function(){
		let select = $('form select').val();
		let str = "";

		if(select == "자유게시판")
		{
			str = "자유게시판 지정 양식";		
		}
		else if(select == "자기소개")
		{
			str = "자기소개 지정 양식";			
		}
		else if(select == "질문게시판")
		{
			str = "질문게시판 지정 양식";			
		}
		$('textarea[name = contents]').text(str);
	});
	
});

function write()
{

	if($('input[name = title]').val() == "" || $('select[name = contents]').val() == "")
	{
		alert("빈 칸이 있습니다"); return false;
	}

	if(!confirm("작성하시겠습니까?")) return false;

	let data = {
		form : $('input[name = f1]').serialize()
	}

	//작성하기 
	$.ajax({
		type : 'post',
		dataType : 'json',
		data : data,
		acync : false,
		url : '....ajax_controller_root....',
		success : function(result){
			//server에서 올 결과값 (json encoding 된 값)
			//result['msg'] : alert 메세지 값
			//result['code'] : 작업의 성공 여부 확인 코드 (1,0)
			alert('');

			//실패하면
			if(!rs['code']) return false;

			//성공하면
			location.reload('....want redirect page....');
		},
		error : function(){
			alert('error');
		}
	});
}
