
		
		// 전역변수 선언 부분
		var bird;            // 플레이어
		var spaceKey;        // 게임 플레이 키 이벤트
		var pipe			 // 장애물(파이프)
		var pipes;           // 장애물(파이프)그룹
		var score;           // 점수 스코어
		var labelScore;      // 점수 표시라벨
		var jumpSound;       // 점프 사운드
		var animation;    	 // 점프 애니메이션
		var hole;            // 구멍
		var timer;           // addRowOfPipes () 함수를 호출

var Game = {
		// 처음에 실행되는 부분
		//이미지와 사운드를 로드하는 부분
		preload:function(){
			game.load.image('bird', '../../img/flappy_bird/bird.png');
			// 파이프 스프라이트 로드
			game.load.image('pipe', '../../img/flappy_bird/pipe.png');
			// 점프 사운드 로드
			game.load.audio('jump','../../audio/jump.wav');
			
		},
		// preload 함수 후에 호출
		// 게임을 설정하고 스프라이트를 표시
		create:function(){
			 // 게임의 배경색을 파란색으로 변경하십시오.
		    game.stage.backgroundColor = '#71c5cf';

		    // 물리 시스템 설정
		    game.physics.startSystem(Phaser.Physics.ARCADE);

		    // 새를 x = 100 및 y = 245 위치에 표시하십시오.
		    bird = game.add.sprite(100, 245, 'bird');

		    // 새를 물리 시스템에 추가
		    // 추가내용 : movements, gravity, collisions, etc.
		    game.physics.arcade.enable(bird);

		    // 새에 중력을 가하여 떨어 뜨립니다.
		    bird.body.gravity.y = 1000;

		    // 스페이스 키가 눌려지면 'jump'함수를 호출하십시오.
		    spaceKey = game.input.keyboard.addKey(
		                    Phaser.Keyboard.SPACEBAR);
		    spaceKey.onDown.add(this.jump, this);
		    
		    // 많은 파이프를 다루기 때문에 빈 그룹을 만들어 준다.
		    pipes = game.add.group();
		    // 1.5 초마다 addRowOfPipes () 함수를 호출
		    timer = game.time.events.loop(1500, this.addRowOfPipes, this);
		    
		    // 스코어를 왼쪽 상단 표시
		    score = 0;
		    labelScore = game.add.text(20,20, "0",{
		    	font: "30px Arial",
		    	fill: "#ffffff"
		    })
		    
		    // 앵커를 왼쪽과 아래쪽으로 움직이는 부분
		    bird.anchor.setTo(-0.2,0.5);
		    
		    // 사운드를 게임에 추가
		    jumpSound = game.add.audio('jump');
		},
		// 초당 60회 호출하는 부분
		// 게임의 로직이 포함
		update:function(){
			 // 새가 화면에서 벗어난 경우 (너무 높거나 너무 낮은 경우)
		    // restartGame 함수를 호출하십시오.
		    if (bird.y < 0 || bird.y > 600){
		        this.restartGame();
		    }
		    // 새가 파이프 그룹의 파이프와 충돌 할 때 restartGame ()을 호출
		    game.physics.arcade.overlap(bird, pipes, this.hitPipe, null, this);
		
		    // 새가 천천히 특정 지점까지 아래로 회전합니다.
		    // 그리고 새가 뛰었을 때, 그것은 위로 회전합니다.
		    if(bird.angle<20){
		    	bird.angle += 1;
		    }
		},
		// 새가 점프하는 함수
		jump: function() {
		    // 중력을 반대로 설정
		    bird.body.velocity.y = -350;
		    
		    // 점프 애니메이션 생성
		    animation = game.add.tween(bird);
		    
		    // 100 밀리세컨드 동안 angle은 -20도로 변경
		    animation.to({
		    	angle: -20
		    }, 100)
		    
		    if(bird.alive == false){
		    	return;
		    }
		    
		    // 애니메이션 시작
		    animation.start();
		    
		    jumpSound.play();
		},

		// Game Restart 함수
		restartGame: function() {
			// 그렇다면 게임 오버으로 이동.
            game.state.start('Game_Over');
		},
		
		addOnePipe:function(x,y){
			// x와 y 위치에 파이프 만들기
			pipe = game.add.sprite(x,y,'pipe');
			
			// 이전에 생성된 그룹에 추가
			pipes.add(pipe);
			
			// 파이프를 물리 시스템에 추가
			game.physics.arcade.enable(pipe);
			
			// 파이프에 속도를 추가하여 왼쪽으로 이동합니다.
			pipe.body.velocity.x = -250;
			
			// 파이프가 더 이상 보이지 않을 때 자동으로 파이프를 삭제
			pipe.checkWorldBounds = true;
			pipe.outOfBoundsKill = true;
		},
		
		addRowOfPipes:function(){
			// 무작위로 1과 5 사이의 숫자 선택
			// 구멍 위치가 되는 부분
			hole = Math.floor(Math.random()*6)+1;
			
			// 6개의 파이프 추가
			// '구멍'과 '구멍+1' 위치에 하나의 큰 구멍이 있는 상태
			for(var i=0; i<10; i++){
				 if (i != hole && i != hole + 1&& i != hole + 2)
			       this.addOnePipe(500, i * 60 + 10);
			}
			// 새로운 파이프가 생성 될 때마다 점수를 1 씩 증가
			score += 10;
			labelScore.text = score;
		},
		
		hitPipe:function(){
			// 새가 이미 파이프에 부딪쳤다면 아무 것도 하지 않는다.
			// 새가 벌써 화면에서 떨어지고 있는 것을 의미
			if(bird.alive == false){
				return;
			}
			
			// 새의 alive속성을 false로 설정
			bird.alive = false;
			
			// 새 파이프가 나타나지 않도록 하는 부분
			game.time.events.remove(timer);
			
			// 모든 파이프를 통과 및 이동을 중지
			pipes.forEach(function(p){
				p.body.velocity.x = 0;
			}, this)
		}
}
