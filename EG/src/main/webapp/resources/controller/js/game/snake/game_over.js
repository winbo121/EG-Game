var Game_Over = {
 
    preload : function() {
        // 게임 화면에 필요한 이미지를 로드.
        game.load.image('gameover', '/EG/resources/img/snake/gameover.png');
    },
 
    create : function() {
 
        // 메뉴에서 게임을 시작하는 버튼 만들기.
        this.add.button(0, 0, 'gameover', this.startGame, this);
 
        // 경기 점수에 대한 정보가 포함 된 텍스트 추가.
        game.add.text(235, 350, "LAST SCORE", { font: "bold 16px sans-serif", fill: "#46c0f9", align: "center"});
        game.add.text(350, 348, score.toString(), { font: "bold 20px sans-serif", fill: "#fff", align: "center" });
 
    },
 
    startGame: function () {
 
        // 상태를 다시 Game으로 변경.
        this.state.start('Game');
 
    }
};