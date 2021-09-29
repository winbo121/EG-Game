
var Menu = {
		preload : function () {
			//game 객체에서 menu 이미지를 로드한다.
			game.load.image('menu', '/EG/resources/img/dodge/start.png');
		},
		
		create: function (){
			//이미지를 표시한다.
			this.add.button(game.world.width*0.15,game.world.height*0.3, 'menu', this.startGame, this);
		},
		
		startGame: function (){
			// 게임 상태으로 하는 부분
			this.state.start('Game');
		}
}