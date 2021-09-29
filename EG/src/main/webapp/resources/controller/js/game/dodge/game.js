
		// 전역변수 선언 부분
		var box;             // 테두리의 투명한 박스
		var player;          // 게임 이용자
		var inputKey;        // 방향키 이벤트
		var ball;            // 공격(ball)
		var ballAlive;       // ball이 창 밖으로 나갔는지의 여부
		var ballArray= [];   // 밖으로 나간 ball를 담은 부분(다시 뿌려주기 위해)
		var playerLife=1;    // 플레이어 생명
		var score;           // 상단 score 부분
		var score_num = 0;   // 초기 점수
		var score_Event;     // 점수 올리는 이벤트
		var startButton;

var Game = {
		// 데이터를 불러 올 떄 사용하는 함수
		preload: function (){
			game.load.image('box', '/EG/resources/img/dodge/box.png');
			game.load.image('player', '/EG/resources/img/dodge/player.png',20, 20);
			game.load.image('ball', '/EG/resources/img/dodge/ball.png',10, 10);
			game.load.image('button', '/EG/resources/img/dodge/start.png');
		},
		
		// 처음 게임을 실행할 때 수행되는 함수
		create: function(){
			// 게임의 속성 설정(아케이드)
			game.physics.startSystem(Phaser.Physics.ARCADE);

			// 게임의 기본 배경 설정
			game.stage.backgroundColor="#000000";
			
			// 현재 점수를 보여주기 위해 개별적인 창 생성
			// 'E' 코드색상 800x80 크기의 블럯을 'score' 이름으로 생성
			game.create.texture('score', ['C'], 800, 80, 0);
			
			// game.add.sprite(0,0, 'score'); 삭제
			
			// score부분으로 ball이 넘어가는 현상을 제거하기 위해
			// 충돌 속성을 주었다.
			score=game.add.group();
			score.enableBody=true;
			score.create(0,0, "score");
			
			// box를 그룹으로 묶어준다.
			box=game.add.group();
			
			// 충돌감지
			box.enableBody=true;
			
			for(var i=0; i<20; i++){
				// 위쪽 변에 box 생성 및 box가 움직이지 않게 설정
				// box를 i*40, 80 위치에 추가
				box.create(i*40, 80, "box").body.immovable=true;    
				// 아래쪽 변에 box 생성 및 box가 움직이지 않게 설정
				box.create(i*40, 600-4, "box").body.immovable=true;
			}
			for(var j=3; j<14; j++){
				// 왼쪽 변에 box 생성 및 box가 움직이지 않게 설정
				box.create(0, j*40, "box").body.immovable=true;
				// 오른쪽 변에 box 생성 및 box가 움직이지 않게 설정
				box.create(800-4, j*40, "box").body.immovable=true;
			}

			// player의 좌표 위치와 이미지 설정하고, 게임에 띄우기
			player=game.add.sprite(400, 300, "player");
			game.physics.arcade.enable(player);
			
			// ball의 속성들
			ball=game.add.group();
			ball.enableBody=true;
			ball.physicsBodyType=Phaser.Physics.ARCADE;
			
			// 공격하는 공의 개수
			ball.createMultiple(30, "ball");
			
			// ball이 창 밖으로 나갈 시 kill하는 역할
			ball.setAll("outOfBoundsKill", true);
			ball.setAll("checkWorldBounds", true);
			
			inputKey=game.input.keyboard.createCursorKeys(); //방향키 이벤트
			
			// score 텍스트 설정 및 score 점수가 오르도록 이벤트, 생명이 없을 시 score도 오르지 않도록 설정 
			var score_text=game.add.text(20,10, "Score 0",{
				fontsize:"50px",
				fill:"#FFFFFF"
			});
			score_Event=game.time.events.loop(Phaser.Timer.SECOND, function(){
				score_num++;
				score_text.setText("Score " +score_num);
			}, this);
		},
		// 주기적으로 수행하는 함수
		update: function(){
			// 방향키 속도
			var velocity=200; 
			
			// 관성
			player.body.velocity.setTo(0,0); 
			// player와 box가 충돌하도록 설정
			game.physics.arcade.collide(player, box) 
			
			// score부분을 넘어갈 경우(overlap), ball을 kill하도록 설정
			game.physics.arcade.overlap(score, ball, function(sky, ball){
				ball.kill();
			}, null, this);
			
			// ball과 player가 충돌할 경우 ball을 kill하도록 설정
			// score에서 ball과의 충돌 이벤트를 score와 ball로 하나 더 추가
			game.physics.arcade.overlap(player, ball, function(player, ball){
				ball.kill();
				playerLife--;
			}, null, this);
			
			// 생명이 없을 경우 멈추게 하는 부분
			if(playerLife<1){
				game.time.events.remove(score_Event);
				
				// 그렇다면 게임 오버으로 이동.
	            game.state.start('Game_Over');
	            
				
			}
			
			// 왼쪽/위쪽 키
			if(inputKey.left.isDown&&inputKey.up.isDown){
				player.body.velocity.x = -velocity;
				player.body.velocity.y = -velocity;
			}
			// 왼쪽/아래쪽 키
			else if(inputKey.left.isDown&&inputKey.down.isDown){
				player.body.velocity.x = -velocity;
				player.body.velocity.y = +velocity;
			}
			// 오른쪽/위쪽 키
			else if(inputKey.right.isDown&&inputKey.up.isDown){
				player.body.velocity.x = +velocity;
				player.body.velocity.y = -velocity;
			}
			// 오른쪽/아래쪽 키
			else if(inputKey.right.isDown&&inputKey.down.isDown){
				player.body.velocity.x = +velocity;
				player.body.velocity.y = +velocity;
			}
			// 왼쪽 키
			else if(inputKey.left.isDown){
				player.body.velocity.x = -velocity;
			}
			// 오른쪽 키
			else if(inputKey.right.isDown){
				player.body.velocity.x = +velocity;
			}
			// 위쪽 키
			else if(inputKey.up.isDown){
				player.body.velocity.y = -velocity;
			}
			// 아래쪽 키
			else if(inputKey.down.isDown){
				player.body.velocity.y = +velocity;
			}
			
			// ball 생성 및 존재 여부 확인, 재생성 되도록 설정
			ballAlive=ball.getFirstExists(false);
			ballArray.length=0;
			
			box.forEachAlive(function(ballAlive){
				ballArray.push(ballAlive);
			});
			// box 중 랜덤으로 하나를 골라서 공격(ball) 생성
			if(ballAlive&&ballArray.length>0){
					var ballRandom=game.rnd.integerInRange(0, ballArray.length-1);
					var ballBox=ballArray[ballRandom];
					ballAlive.reset(ballBox.body.x, ballBox.body.y);
					game.physics.arcade.moveToObject(ballAlive, player, 150);
			}
		}
};