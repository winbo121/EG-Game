
var game;
var config = {
		    type: Phaser.AUTO,
		    width: 800,
		    height: 600,
		    parent: "game_display",
		    physics: {
		        default: 'arcade',
		        arcade: {
		            gravity: { y: 300 },
		            debug: false
		        }
		    },
		    scene: {
		        preload: preload,
		        create: create,
		        update: update
		    }
		};

		game = new Phaser.Game(config);
		
		var platforms;
		var player;
		var stars;
		var bombs;
		var cursors;
		var score = 0;                              // 실제 점수를 저장
		var gameOver = false;
	    var scoreText;
	    var startButton;          // 시작 버튼
	    var playing = false;      // 시작 여부 확인

	    function preload() {
			// 4개의 이미지와 스포라이트 이미지 불러오기
	    	
			this.load.image('sky', '/EG/resources/img/star_eating/sky.png');
			this.load.image('ground', '/EG/resources/img/star_eating/platform.png');
			this.load.image('star', '/EG/resources/img/star_eating/star.png');
			this.load.image('bomb', '/EG/resources/img/star_eating/bomb.png');
			this.load.spritesheet('dude', '/EG/resources/img/star_eating/dude.png', {
				frameWidth : 32,
				frameHeight : 48
			});
			// 버튼 스프라이트 이미지 로드
		    this.load.image('button', '/EG/resources/img/invaders/start.png');
		}

		function create() {
			this.add.image(400, 300, 'sky');

			// 새로운 뷰동 물리 그룹을 만들고, 변수인 platforms에 할당
		    platforms = this.physics.add.staticGroup();

			// (400, 568) 위치에 새 땅 이미지 추가
			// setScale(2)를 호출해 이미지의 크기를 2배
			// refreshBody()는 부동체의 크기를 변경했기 때문에, 물리 시스템에 우리가 가한 변화를 알려주기 위해서 호출
		    platforms.create(400, 568, 'ground').setScale(2).refreshBody();

		    // (600, 400) 위치에 새 땅 이미지
		    platforms.create(600, 400, 'ground');
		 	// (50, 250) 위치에 새 땅 이미지
		    platforms.create(50, 250, 'ground');
		 	// (750, 220) 위치에 새 땅 이미지
		    platforms.create(750, 220, 'ground');
		 	
		 	// player라는 이름의 새 스프라이트를 (100,450) 픽셀 좌표, 즉 게임 화면의 아랫 부분에 생성
		 	// 물리 게임 객체 팩토리(this.physics.add)를 통해 만들어지며, 기본적으로 동체(Dynamic
			// Physics)로 간주
		 	player = this.physics.add.sprite(100, 450, 'dude');
		 	
		 	// 스프라이트에 중력의 효과 부여
		 	player.body.setGravityY(300)
		 	
		 	// bounce 값을 0.2로 조정
		 	player.setBounce(0.2);
		 	player.setCollideWorldBounds(true);
		 	
		 	// 'left' 애니메이션은 프레임 0,1,2,3을 사용하며, 초당 10 프레임 재생.
		 	// repeat에 -1이 들어가 있는 것은 이 애니메이션이 반복될 것임을 알려준다.
		 	this.anims.create({
	            key: 'left',
	            frames: this.anims.generateFrameNumbers('dude', { start: 0, end: 3 }),
	            frameRate: 10,
	            repeat: -1
	        });

	        this.anims.create({
	            key: 'turn',
	            frames: [ { key: 'dude', frame: 4 } ],
	            frameRate: 20
	        });

	     	// 'right' 애니메이션은 프레임 5,6,7,8을 사용하며, 초당 10 프레임 재생.
		 	// repeat에 -1이 들어가 있는 것은 이 애니메이션이 반복될 것임을 알려준다.
	        this.anims.create({
	            key: 'right',
	            frames: this.anims.generateFrameNumbers('dude', { start: 5, end: 8 }),
	            frameRate: 10,
	            repeat: -1
	        });
	     	
	     	cursors = this.input.keyboard.createCursorKeys();
	     	
	     	// 동체 물리 그룹으로 생성
	     	stars = this.physics.add.group({
	            key: 'star',
	            // star 12개 생성(자동으로 1개는 생성되기 때문에)
	            repeat: 11,
	            // 최초에 (12,0) 위치에 만들어지고, 이후 x 좌표 간격 70으로 배치
	            setXY: { x: 12, y: 0, stepX: 70 }
	        });

	        stars.children.iterate(function (child) {
				// 0.4에서 0.8 사이의 무작위한 Y bounce 값을 부여
	            child.setBounceY(Phaser.Math.FloatBetween(0.4, 0.8));

	        });
	        
	        bombs = this.physics.add.group();
	        
	     	// (16,16)은 텍스트가 보여지게 될 좌표입니다.
	     	// 'score: 0'은 보여줄 기본 문자열이며, 그 뒤에 있는 객체는 폰트의 크기와 글씨색 부분
	        scoreText = this.add.text(16, 16, 'score: 0', { fontSize: '32px', fill: '#000' });
	        
	     	// Collider는 두 객체를 가져가 충돌 여부를 확인
	        this.physics.add.collider(player, platforms);
	     	// 플레이어가 별과 겹쳤는지도 확인
	        this.physics.add.collider(stars, platforms);
	     	
	        this.physics.add.collider(bombs, platforms);

	     	// Phaser가 플레이어와 stars 그룹에 속한 어떤 별과 겹쳐있는지를 확인
	     	// 만약 겹치는 상황이 발생하면 collectStar() 함수를 호출
	        this.physics.add.overlap(player, stars, collectStar, null, this);
	     	
	        this.physics.add.collider(player, bombs, hitBomb, null, this);
	        
	       
	        startButton = this.add.image(400,300, 'button').setInteractive();

		    startButton.on('pointerdown', startGame); // Start game on click.
		}

		function update() {
			if(playing) {
		    	
			// 왼쪽
			if (cursors.left.isDown)
		        {
		            player.setVelocityX(-160);

		            player.anims.play('left', true);
		        }
			// 오른쪽
		        else if (cursors.right.isDown)
		        {
		            player.setVelocityX(160);

		            player.anims.play('right', true);
		        }
		        else
		        {
		            player.setVelocityX(0);

		            player.anims.play('turn');
		        }
				// 점프
		        if (cursors.up.isDown && player.body.touching.down)
		        {
		            player.setVelocityY(-470);
		        }
			}
		}
		
		// star가 가진 물리 성질을 비활성화하고, star의 부모 게임 객체를 비활성화시킨 뒤 보이지 않게 설정
		function collectStar (player, star)
	    {
	        star.disableBody(true, true);
	        
	        // 별을 모을 때 마다 10점 추가 및 scoreText 갱신
	        score += 10;
	        scoreText.setText('Score: ' + score);
	        
	        if (stars.countActive(true) === 0)
	        {
	            stars.children.iterate(function (child) {

	                child.enableBody(true, child.x, 0, true, true);

	            });

	            var x = (player.x < 400) ? Phaser.Math.Between(400, 800) : Phaser.Math.Between(0, 400);

	            var bomb = bombs.create(x, 16, 'bomb');
	            bomb.setBounce(1);
	            bomb.setCollideWorldBounds(true);
	            bomb.setVelocity(Phaser.Math.Between(-200, 200), 20);
	            bomb.allowGravity = false;

	        }
	    }
		
		function hitBomb(player, bomb)
		{
		    this.physics.pause();
		    player.setTint(0xff0000);
		    player.anims.play('turn');
		    gameOver = true;
		    if(gameOver){
		    	alert('You lost, game over!');
		    	location.reload();
		    }
		}
		// 버튼을 누르면 버튼을 제거하고 공의 초기 속도를 설정하고 playing변수를로 설정
		function startGame() {
			console.log('Game started!');
			startButton.destroy();
		    playing = true;
		}