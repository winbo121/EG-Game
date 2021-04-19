
var game;

// 게임 인스턴스를 만든다.
game = new Phaser.Game(800, 600, Phaser.AUTO, "game_display");

// 게임 인스턴스를 초기화 한 후, 상태를 추가한다.
game.state.add('Menu', Menu);
game.state.add('Game', Game);
game.state.add('Game_Over', Game_Over);
 
game.state.start('Menu');
