const Chat = (function(){

	const myName = "blue";
	
	//웹소켓 초기화
	var webSocket = new WebSocket("ws://localhost:8080/EG/broadsocket"); //운영에서는 실제 아이피를 넣어야 한다.
 
    // init 함수
    function init() {
        // enter 키 이벤트
        $(document).on('keydown', 'div.input-div textarea', function(e){
            if(e.keyCode == 13 && !e.shiftKey) {
                e.preventDefault();
                const message = $(this).val();
                // jsp 화면에서 sessionStorage.setItem("uid", "${session.uid}"); 작업을 해주어야 한다.
 				var uid = window.sessionStorage.getItem("uid");
				
				// 메시지 전송
				if(uid == "" || uid == null){
					sendMessage("익명 : "+message);
				}else{
					sendMessage(uid+" 님: "+message);
				}
				
                
                
                // 입력창 clear
                clearTextarea();
            }
        });
    }
 
    // 메세지 태그 생성
    function createMessageTag(LR_className, senderName, message) {
        // 형식 가져오기
        let chatLi = $('div.chat.format ul li').clone();
 
        // 값 채우기
        chatLi.addClass(LR_className);
        chatLi.find('.sender span').text(senderName);
        chatLi.find('.message span').text(message);
 
        return chatLi;
    }
 
    // 메세지 태그 append
    function appendMessageTag(LR_className, senderName, message) {
        const chatLi = createMessageTag(LR_className, senderName, message);
 
        $('div.chat:not(.format) ul').append(chatLi);
 
        // 스크롤바 아래 고정
        $('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
    }
 
    // 메세지 전송
    function sendMessage(message) {
        // 서버에 전송하는 코드로 후에 대체
    	
    	console.log(message);
    
        webSocket.send(message);
    }
 
    // 메세지 입력박스 내용 지우기
    function clearTextarea() {
        $('div.input-div textarea').val('');
    }
    

	    webSocket.onmessage = function processMessge(message) {
	    	console.log(message);
		// Json 풀기
		var jsonData = JSON.parse(message.data);
		if (jsonData.message != null) {
			const LR = (message.senderName != myName)? "left" : "right";
	        appendMessageTag("right", message.senderName, jsonData.message);
		};
	}
 
    return {
        'init': init
    };
})();
 
$(function(){
    Chat.init();
});

$("#chat").click(function() {
	$(".hidden_desc").css("display", "block");
})

$(".no_chat").click(function() {
	$("#messageTextArea").css("display", "none");
	$("#no_chat").css("display", "none");
	$("#show_chat").css("display", "block");
	$(".hidden_desc").css("display", "none");
})

$(".show_chat").click(function() {
	$("#messageTextArea").css("display", "block");
	$("#no_chat").css("display", "block");
	$("#show_chat").css("display", "none");
	$(".hidden_desc").css("display", "none");
})

/*
$('a').click(function() { 

	$(this).stop().animate({
		opacity : '.5'
	}, 500);
}, function() {
	$(this).stop().animate({
		opacity : '1'
	}, 500);
});
*/


$(".chat_menu").show();
$(".chat_menu").click(function(event) {

	$(".chat_back").css("display","block"); //팝업 뒷배경 display block
	$(".chat_menu").css("display", "none");
	$(".chat_wrapper").css("display", "block");
	 $("body").css("overflow","hidden");//body 스크롤바 없애기
	
	
}), $(".header>.chat_close").click(function(event) {
	$(".chat_menu").css("display", "block");
	$(".chat_wrapper").css("display", "none");
	$("body").css("overflow","auto");//body 스크롤바 생성
	$(".chat_back").css("display","none"); //팝업 뒷배경 display none
});

