

var game;

// Phaser.Game개체를 만들고 게임 변수에 할당하여 초기화
game = new Phaser.Game(480, 320, Phaser.AUTO, null, {
	preload: preload, 
	create: create, 
	update: update
	
});

	var ball;             	  // 볼
	var paddle;           	  // 패들
	var bricks;           	  // 벽돌
	var newBrick;         	  // 새로운 벽돌
	var brickInfo;        	  // 벽돌 데이터 저장
	var scoreText;        	  // 점수 텍스트
	var score = 0;        	  // 점수
	var lives = 3;        	  // 목숨
	var livesText;        	  // 목숨 텍스트
	var lifeLostText;     	  // 목숨 잃을 때 텍스트
	var playing = false;      // 시작 여부 확인
	var startButton;          // 시작 버튼
	var bounceSound;          // 효과음
	var audioStatus = true    // 효과음 상태

	// 처음에 실행되는 부분
	function preload() {
		// SHOW_ALL: 캔버스의 크기를 조절하지만 종횡비는 그대로 유지하므로 왜곡되지 않습니다
	    game.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
	    game.scale.pageAlignHorizontally = true;
	    game.scale.pageAlignVertically = true;
	    // 사용자 정의 canvas 배경색 추가
	    game.stage.backgroundColor = '#eee';
	    
	    // 패들 이미지 로드
	    game.load.image('paddle', '../../img/bricks/paddle.png');
	    // 벽돌 이미지 로드
	    game.load.image('brick', '../../img/bricks/brick.png');
	    // 볼 스프라이트 이미지 로드
	    game.load.spritesheet('ball', '../../img/bricks/wobble.png', 20, 20);
	    // 버튼 스프라이트 이미지 로드
	    game.load.spritesheet('button', '../../img/bricks/button.png', 120, 40);
	    game.load.spritesheet('button-audio', '../../img/bricks/button-audio.png', 35, 35);
	    game.load.audio('audio-bounce', '../../audio/bounce.m4a');
	}
	// preload 함수 후에 호출
	function create() {
		// Arcade Physics 엔진을 초기화
		// physics.startSystem()시작 부분에 메서드를 추가(물리학)
	    game.physics.startSystem(Phaser.Physics.ARCADE);
	    
	    // 화면 하단 가장자리와의 공 충돌을 비활성화
	    game.physics.arcade.checkCollision.down = false;
	    
	    // 들이 예상대로 작동하므로 공을 그 위에 배치하겠습니다. 
	    // 패들을 배치하는 것과 매우 유사합니다. 
	    // 화면 중앙에 수평으로 배치하고 수직으로 하단에 약간의 간격을두고 배치해야합니다. 
	    // 원하는대로 정확하게 배치하기 위해 앵커를 공의 정확한 중앙에 설정
	    ball = game.add.sprite(game.world.width*0.5, game.world.height-25, 'ball');
	    
	    // 애니메이션 로드
	    // Phaser는 이들을 추출하고 배열 (위치 0, 1, 2)에 참조를 저장합니다. 
	    // 위 배열은 프레임 0, 1, 0 등을 표시
	    ball.animations.add('wobble', [0,1,0,2,0,1,0,2,0], 24);
	    ball.anchor.set(0.5);
	    
	    // 물리 시스템에 대해 볼을 활성화
	    game.physics.enable(ball, Phaser.Physics.ARCADE);
	    // 경계(벽)을 취급하여 공이 지나가지 않도록 하는 부분
	    ball.body.collideWorldBounds = true;
	    // 탄력성(공 튀는)부분
	    ball.body.bounce.set(1);
	    ball.checkWorldBounds = true;
	    // ballLeaveScreen 이벤트 핸들러
	    ball.events.onOutOfBounds.add(ballLeaveScreen, this);
	    
	    // 물리학으로 패들 렌더링
	    // world.width및 world.height값을 사용하여 패들을 원하는 위치에 정확하게 배치 game.world.width*0.5할 수 있습니다. 
	    paddle = game.add.sprite(game.world.width*0.5, game.world.height-5, 'paddle',manageAudio);
	    
	    // 패들 위치 조정
	    paddle.anchor.set(0.5,1);
	    // 공과 패들 충돌하여 물리 활성화
	    game.physics.enable(paddle, Phaser.Physics.ARCADE);
	    // 공이 패들에서 튀어 나오고 패들이 같은 위치에 머무르게 하는 부분
	    paddle.body.immovable = true;

	    // 벽돌 그리기
	    initBricks();

	    // textStyle하여 텍스트 정의
	    textStyle = { font: '18px Arial', fill: '#0095DD' };
	    // 점수 텍스트 위치(텍스트를 그릴 x 및 y 좌표입니다. 렌더링 될 실제 텍스트입니다. 텍스트를 렌더링하는 데 사용할 글꼴 스타일)
	    scoreText = game.add.text(5, 5, 'Points: 0', textStyle);
	    livesText = game.add.text(game.world.width-5, 5, 'Lives: '+lives, textStyle);
	    livesText.anchor.set(1,0);
	    
	    lifeLostText = game.add.text(game.world.width*0.5, game.world.height*0.5, 'Life lost, tap to continue', textStyle);
	    lifeLostText.anchor.set(0.5);
	    lifeLostText.visible = false;

	    // 게임에 버튼 추가
	    startButton = game.add.button(game.world.width*0.5, game.world.height*0.5, 'button', startGame, this, 1, 0, 2);
	    startButton.anchor.set(0.5);
	    
	    bounceSound = game.add.audio('audio-bounce');
	}
	// 초당 60회 호출하는 부분
	// 게임의 로직이 포함
	function update() {
		// 패들과 공 사이의 충돌 감지를 활성화
	    game.physics.arcade.collide(ball, paddle, ballHitPaddle);
	    game.physics.arcade.collide(ball, bricks, ballHitBrick);
	    // 게임이 시작되기 전에 패들을 가만히 유지
	    if(playing) {
	    	// 패들의 기본 위치가 화면 중간으로 설정
	        paddle.x = game.input.x || game.world.width*0.5;
	    }
	}
	function initBricks() {
		// 단일 벽돌의 너비와 높이, 우리가 화면에서 볼 벽돌의 행과 열의 수, 위쪽과 왼쪽 오프셋 (그리기 시작할 캔버스상의 위치) 벽돌)과 벽돌의 각 행과 열 사이의 패딩
	    brickInfo = {
	        width: 50,
	        height: 20,
	        count: {
	            row: 7,
	            col: 3
	        },
	        offset: {
	            top: 50,
	            left: 60
	        },
	        padding: 10
	    }
	    // 벽돌을 포함 할 빈 그룹을 먼저 추가
	    bricks = game.add.group();
	    // 행과 열을 반복하여 반복 할 때마다 새 벽돌을 만들 수 있습니다.
	    // 여기에서는 행과 열을 반복하여 새 벽돌을 만들고 화면에 배치합니다. 
	    // 새로 생성 된 벽돌은 Arcade 물리 엔진에서 활성화되고, 몸체가 움직이지 않도록 설정되어 있으며 (공에 맞았을 때 움직이지 않음) 앵커를 가운데로 설정하고 벽돌을 추가
	    for(c=0; c<brickInfo.count.col; c++) {
	        for(r=0; r<brickInfo.count.row; r++) {
	        	// 각각의 벽돌을 각각의 x와 y 위치에 그리는 것
	            var brickX = (r*(brickInfo.width+brickInfo.padding))+brickInfo.offset.left;
	            var brickY = (c*(brickInfo.height+brickInfo.padding))+brickInfo.offset.top;
	            newBrick = game.add.sprite(brickX, brickY, 'brick');
	            game.physics.enable(newBrick, Phaser.Physics.ARCADE);
	            newBrick.body.immovable = true;
	            newBrick.anchor.set(0.5);
	            bricks.add(newBrick);
	        }
	    }
	}
	function ballHitBrick(ball, brick) {
	    var killTween = game.add.tween(brick.scale);
	    
	    // 공에 부딪 힐 때 즉시 벽돌을 숨기는 대신 폭과 높이를 0으로 조정하여 사라지게 한다.
	    // to()메서드는 트윈이 끝날 때 객체의 상태를 정의
	    killTween.to({x:0,y:0}, 200, Phaser.Easing.Linear.None);
	    
	    
	    // onComplete트윈이 완료 될 때 실행할 함수를 정의하는 선택적 이벤트 핸들러를 추가
	    killTween.onComplete.addOnce(function(){
	    	// kill()메서드를 실행하여 화면에서 벽돌을 제거 합니다.
	    	// 트윈을 추가하여 벽돌이 공에 맞았을 때 부드럽게 사라지도록 하는 부분
	        brick.kill();
	    }, this);
	    killTween.start();
	    // 벽돌 제거 할 때마다 점수 10씩 증가
	    score += 10;
	    scoreText.setText('Points: '+score);
	    if(score === brickInfo.count.row*brickInfo.count.col*10) {
	        alert('You won the game');
	        location.reload();
	    }
	    if(audioStatus) {
			bounceSound.play();
		}
	}
	//공이 캔버스(경계)를 떠날 때마다 생명 수를 줄이는 부분
	function ballLeaveScreen() {
	    lives--;
	    // 생명 확인
	    if(lives) {
	    	// 생명 잃은 메시지가 표시되고 공과 패들 위치가 화면에서 재설정
	        livesText.setText('Lives: '+lives);
	        lifeLostText.visible = true;
	        ball.reset(game.world.width*0.5, game.world.height-25);
	        paddle.reset(game.world.width*0.5, game.world.height-5);
	        game.input.onDown.addOnce(function(){
	            lifeLostText.visible = false;
	            // 화면에서 공을 움직이는 부분
	            ball.body.velocity.set(150, -150);
	        }, this);
	    }
	    else {
	        alert('You lost, game over!');
	        location.reload();
	    }
	}
	function ballHitPaddle(ball, paddle) {
		// 공이 패들에 부딪 힐 때마다 애니메이션이 재생
	    ball.animations.play('wobble');
	    // 리바운드를 무작위로 만들기
	    ball.body.velocity.x = -1*5*(paddle.x-ball.x);
	}
	
	// 버튼을 누르면 버튼을 제거하고 공의 초기 속도를 설정하고 playing변수를로 설정
	function startGame() {
	    startButton.destroy();
	    // create()함수 로 돌아가서 ball.body.velocity.set(150, -150);행을 찾아 제거
	    ball.body.velocity.set(150, -150);
	    playing = true;
	}
	function manageAudio() {
		audioStatus =! audioStatus;
		audioButton.animations.play(audioStatus);
	}