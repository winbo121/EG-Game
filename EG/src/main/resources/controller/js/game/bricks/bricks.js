
var game; 


game = new Phaser.Game(800, 600, Phaser.AUTO, "game_display", { preload: preload, create: create, update: update });


var ball;             	  // 볼
var paddle;           	  // 패들
var bricks;           	  // 벽돌

var ballOnPaddle = true;

var score = 0;        	  // 점수
var lives = 3;        	  // 목숨

var scoreText;        	  // 점수 텍스트
var livesText;        	  // 목숨 텍스트
var introText;

var s;

function preload() {

	// SHOW_ALL: 캔버스의 크기를 조절하지만 종횡비는 그대로 유지하므로 왜곡되지 않습니다
    game.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
    game.scale.pageAlignHorizontally = true;
    game.scale.pageAlignVertically = true;
	
    game.load.atlas('breakout', '../../img/bricks/breakout.png', '../../controller/js/game/bricks/test.json');
    game.load.image('starfield', '../../img/bricks/starfield.jpg');
    
    // 바운스 효과음
    game.load.audio('audio-bounce', '../../audio/bounce.m4a');
}
//preload 함수 후에 호출
function create() {
	// Arcade Physics 엔진을 초기화
	// physics.startSystem()시작 부분에 메서드를 추가(물리학)
    game.physics.startSystem(Phaser.Physics.ARCADE);

    // 화면 하단 가장자리와의 공 충돌을 비활성화
    game.physics.arcade.checkCollision.down = false;
    // 게임 배경 설정
    s = game.add.tileSprite(0, 0, 800, 600, 'starfield');
    // 벽돌을 포함 할 빈 그룹을 먼저 추가
    bricks = game.add.group();
    // 벽돌 오브젝트의 바디를 활성화
    bricks.enableBody = true;
    // physicsBodyType을 설정함으로써 생성 한 모든 객체가 자동으로 Arcade Physics 객체가됨을 의미
    bricks.physicsBodyType = Phaser.Physics.ARCADE;

    var brick;

    for (var y = 0; y < 3; y++)
    {
        for (var x = 0; x < 15; x++)
        {
            brick = bricks.create(120 + (x * 36), 100 + (y * 52), 'breakout', 'brick_' + (y+1) + '_1.png');
            // 탄력성 부분
            brick.body.bounce.set(1);
            // 벽돌이 같은 위치에 머무르게 하는 부분
            brick.body.immovable = true;
        }
    }
    // 물리학으로 패들 렌더링
    paddle = game.add.sprite(game.world.centerX, 500, 'breakout', 'paddle_big.png');
    // 패들 위치 조정
    paddle.anchor.setTo(0.5, 0.5);
    // 공과 패들 충돌하여 물리 활성화
    game.physics.enable(paddle, Phaser.Physics.ARCADE);
    // 경계(벽)을 취급하여 공이 지나가지 않도록 하는 부분
    paddle.body.collideWorldBounds = true;
    // 패들에 맞았을 때 탄력성(공 튀는)부분
    paddle.body.bounce.set(1);
    // 공이 패들에서 튀어 나오고 패들이 같은 위치에 머무르게 하는 부분
    paddle.body.immovable = true;

    // 들이 예상대로 작동하므로 공을 그 위에 배치하겠습니다. 
    // 패들을 배치하는 것과 매우 유사합니다.
    ball = game.add.sprite(game.world.centerX, paddle.y - 16, 'breakout', 'ball_1.png');
    ball.anchor.set(0.5);
    ball.checkWorldBounds = true;
    // 물리 시스템에 대해 볼을 활성화
    game.physics.enable(ball, Phaser.Physics.ARCADE);

    // 경계(벽)을 취급하여 공이 지나가지 않도록 하는 부분
    ball.body.collideWorldBounds = true;
    // 탄력성(공 튀는)부분
    ball.body.bounce.set(1);
    
    // 애니메이션 로드
    // Phaser는 이들을 추출하고 배열에 참조를 저장합니다.
    ball.animations.add('spin', [ 'ball_1.png', 'ball_2.png', 'ball_3.png', 'ball_4.png', 'ball_5.png' ], 50, true, false);
    
    // ballLost 이벤트 핸들러
    ball.events.onOutOfBounds.add(ballLost, this);
    // 점수 텍스트 위치(텍스트를 그릴 x 및 y 좌표입니다. 렌더링 될 실제 텍스트입니다. 텍스트를 렌더링하는 데 사용할 글꼴 스타일)
    scoreText = game.add.text(32, 550, 'score: 0', { font: "20px Arial", fill: "#ffffff", align: "left" });
    livesText = game.add.text(680, 550, 'lives: 3', { font: "20px Arial", fill: "#ffffff", align: "left" });
    introText = game.add.text(game.world.centerX, 400, '- click to start -', { font: "40px Arial", fill: "#ffffff", align: "center" });
    introText.anchor.setTo(0.5, 0.5);

    // 입력 관리자에서 터치 또는 클릭 이벤트를 수신
    // 두 번째 인수 (this)는 함수를 호출해야하는 컨텍스트
    game.input.onDown.add(releaseBall, this);
    
    bounceSound = game.add.audio('audio-bounce');

}
//초당 60회 호출하는 부분
// 게임의 로직이 포함
function update () {

    //  Fun, but a little sea-sick inducing :) Uncomment if you like!
    // s.tilePosition.x += (game.input.speed.x / 2);

    paddle.x = game.input.x;

    if (paddle.x < 24)
    {
        paddle.x = 24;
    }
    else if (paddle.x > game.width - 24)
    {
        paddle.x = game.width - 24;
    }

    if (ballOnPaddle)
    {
        ball.body.x = paddle.x;
    }
    else
    {
    	// 패들과 공 사이의 충돌 감지를 활성화
        game.physics.arcade.collide(ball, paddle, ballHitPaddle, null, this);
        // 벽돌과 공 사이의 충돌 감지를 활성화
        game.physics.arcade.collide(ball, bricks, ballHitBrick, null, this);
    }

}

function releaseBall () {

    if (ballOnPaddle)
    {
        ballOnPaddle = false;
        ball.body.velocity.y = -300;
        ball.body.velocity.x = -75;
        ball.animations.play('spin');
        introText.visible = false;
    }

}
//공이 캔버스(경계)를 떠날 때마다 생명 수를 줄이는 부분
function ballLost () {

    lives--;
    livesText.text = 'lives: ' + lives;
    // 생명 확인
    if (lives === 0)
    {
        gameOver();
    }
    // 공과 패들 위치가 화면에서 재설정
    else
    {
        ballOnPaddle = true;

        ball.reset(paddle.body.x + 16, paddle.y - 16);
        
        ball.animations.stop();
    }

}

function gameOver () {

    ball.body.velocity.setTo(0, 0);
    
    introText.text = 'Game Over!';
    introText.visible = true;
    location.reload();

}

function ballHitBrick (_ball, _brick) {
	 var killTween = game.add.tween(_brick.scale);
	    
	 // 공에 부딪 힐 때 즉시 벽돌을 숨기는 대신 폭과 높이를 0으로 조정하여 사라지게 한다.
	 // to()메서드는 트윈이 끝날 때 객체의 상태를 정의
	 killTween.to({x:0,y:0}, 200, Phaser.Easing.Linear.None);
	
	 // onComplete트윈이 완료 될 때 실행할 함수를 정의하는 선택적 이벤트 핸들러를 추가
	 killTween.onComplete.addOnce(function(){
	    // kill()메서드를 실행하여 화면에서 벽돌을 제거 합니다.
	    // 트윈을 추가하여 벽돌이 공에 맞았을 때 부드럽게 사라지도록 하는 부분
		_brick.kill();
	 }, this);
	    killTween.start();
    // 벽돌 제거 할 때마다 점수 10씩 증가
    score += 10;

    scoreText.text = 'score: ' + score;

    //  벽돌이 남아 있는지 체크하는 부분
    if (bricks.countLiving() == 0)
    {
        //  새로운 레벨 시작
        score += 1000;
        scoreText.text = 'score: ' + score;
        introText.text = '- Next Level -';

        //  공을 다시 패들로 옮기는 부분
        ballOnPaddle = true;
        ball.body.velocity.set(0);
        ball.x = paddle.x + 16;
        ball.y = paddle.y - 16;
        ball.animations.stop();

        //  And bring the bricks back from the dead :)
        bricks.callAll('revive');
    }
    bounceSound.play();
}

function ballHitPaddle (_ball, _paddle) {

    var diff = 0;

    if (_ball.x < _paddle.x)
    {
        //  공은 패들의 왼쪽일 때
        diff = _paddle.x - _ball.x;
        _ball.body.velocity.x = (-10 * diff);
    }
    else if (_ball.x > _paddle.x)
    {
        //  공은 패들의 오른쪽일 때
        diff = _ball.x -_paddle.x;
        _ball.body.velocity.x = (10 * diff);
    }
    else
    {
    	// 공은 완벽하게 중앙에 있습니다.
        // 약간의 임의의 X를 추가하여 똑바로 튀는 것을 막습니다!
        _ball.body.velocity.x = 2 + Math.random() * 8;
    }

}