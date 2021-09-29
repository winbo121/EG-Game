var Game_Over = {
 
    preload : function() {
        // 게임 화면에 필요한 이미지를 로드.
        game.load.image('gameover', '/EG/resources/img/flappy_bird/game_over.png');
    },
 
    create : function() {
 
        // 메뉴에서 게임을 시작하는 버튼 만들기.
        this.add.button(game.world.width*0.15,game.world.height*0.15, 'gameover', this.startGame, this);
 
    },
 
    startGame: function () {
        // 상태를 다시 Game으로 변경.
        this.state.start('Game');
    }
};