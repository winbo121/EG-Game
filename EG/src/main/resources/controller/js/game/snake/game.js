var snake, apple, squareSize, score, speed,
    updateDelay, direction, new_direction,
    addNew, cursors, scoreTextValue, speedTextValue, 
    textStyle_Key, textStyle_Value;
 
var Game = {
    preload : function() {
        // 뱀의 몸통과 사과 이미지 두개를 preload 해놓는다.
        game.load.image('snake', '../../img/snake/snake.png');
        game.load.image('apple', '../../img/snake/apple.png');
    },
 
    create : function() {
        snake = [];                     // sanke.png 를 얼마나 표시할지를 나타낼 변수
        apple = {};                     // 사과
        squareSize = 15;                // 사과/뱀의 1 블럭 사이즈
        score = 0;                      // Game score.
        speed = 0;                      // Game speed.
        updateDelay = 0;                // 키 입력시 얼만큼의 delay 후 방향을 변경할 지
        direction = 'right';            // 시작시 뱀의 방향
        new_direction = null;           // 키 입력시 변경될 뱀의 방향
        addNew = false;                 // 뱀이 사과를 먹었을 때, 새로운 사과를 놓을지 여부
 
        // 기본 Phaser 컨트롤러를 keyboard input 으로 받겠다고 명시
        cursors = game.input.keyboard.createCursorKeys();
        game.stage.backgroundColor = '#061f27';
 
        
        for(var i = 0; i < 10; i++) {
            snake[i] = game.add.sprite(150 + i * squareSize, 150, 'snake');  // Parameters are (X coordinate, Y coordinate, image)
        }
 
        // 첫 사과 배치
        this.generateApple();
        
        // 상단의 텍스트 (점수, 속도)
        textStyle_Key = { font: "bold 14px sans-serif", fill: "#46c0f9", align: "center" };
        textStyle_Value = { font: "bold 18px sans-serif", fill: "#fff", align: "center" };
 
        // Score.
        game.add.text(30, 20, "SCORE", textStyle_Key);
        scoreTextValue = game.add.text(90, 18, score.toString(), textStyle_Value);
        
        // Speed.
        game.add.text(650, 20, "SPEED", textStyle_Key);
        speedTextValue = game.add.text(708, 18, speed.toString(), textStyle_Value);
 
    },
 
 
    update: function() {
        //    키 입력 처리
        if (cursors.right.isDown && direction!='left') {
            new_direction = 'right';
        } else if (cursors.left.isDown && direction!='right') {
            new_direction = 'left';
        } else if (cursors.up.isDown && direction!='down') {
            new_direction = 'up';
        } else if (cursors.down.isDown && direction!='up') {
            new_direction = 'down';
        }
 
 
        // 점수에 따라 게임 속도를 계산하는 공식.
        // 점수가 높을수록 게임 속도가 빨라지며 최대 10;
        speed = Math.min(10, Math.floor(score/5));
        
        // 게임 화면에서 속도 값을 업데이트
        speedTextValue.text = '' + speed;
 
        // Phaser의 업데이트 기능은 약 60FPS의 업데이트 속도를 갖기 때문에,
        // 게임을 플레이 할 수 있도록 속도를 줄여야합니다..
 
        // 모든 업데이트 호출에서 카운터 증가.
        updateDelay++;
 
        // 카운터가 (10-게임 속도)로 나누어 진 경우에만 게임 작업 수행.
        // 속도가 빠를수록 더 자주 수행되어 뱀이 더 빨리 움직입니다
        if (updateDelay % (10 - speed) == 0) {
            // 뱀 움직이는 부분
            var firstCell = snake[snake.length - 1],
                lastCell = snake.shift(),
                oldLastCellx = lastCell.x,
                oldLastCelly = lastCell.y;
 
            // 키보드에서 새로운 방향을 선택한 경우 지금 뱀의 방향을 하는 부분
            if(new_direction) {
                direction = new_direction;
                new_direction = null;
            }
 
 
            // 방향에 따라 뱀의 머리를 기준으로 마지막 셀의 좌표를 변경합니다.
 
            if(direction == 'right') {
                lastCell.x = firstCell.x + 15;
                lastCell.y = firstCell.y;
            } else if(direction == 'left') {
                lastCell.x = firstCell.x - 15;
                lastCell.y = firstCell.y;
            } else if(direction == 'up') {
                lastCell.x = firstCell.x;
                lastCell.y = firstCell.y - 15;
            } else if(direction == 'down') {
                lastCell.x = firstCell.x;
                lastCell.y = firstCell.y + 15;
            }
 
 
            // 스택 앞에 마지막 셀을 놓습니다.
            // 첫 번째 셀로 표시.
            snake.push(lastCell);
            firstCell = lastCell;
 
        if(addNew) {
            snake.unshift(game.add.sprite(oldLastCellx, oldLastCelly, 'snake'));
            addNew = false;
        }
 
        // 사과 충돌 확인.
        this.appleCollision();
 
        // 자신과의 충돌을 확인하십시오. 매개 변수는 뱀의 머리입니다..
        this.selfCollision(firstCell);
 
        // 벽과의 충돌 여부를 확인하십시오. 매개 변수는 뱀의 머리입니다.
        this.wallCollision(firstCell);
        }
    },
 
    generateApple: function() {
        // 사과를 랜덤 위치에 놓는다.
        var randomX = Math.floor(Math.random() * 40 ) * squareSize,
            randomY = Math.floor(Math.random() * 30 ) * squareSize;
 
        // 새로운 사과 추가.
        apple = game.add.sprite(randomX, randomY, 'apple');        
    },
    
    appleCollision: function() {
    	// 뱀의 일부가 사과와 겹치는 지 확인합니다.
        // 사과가 뱀 내부에서 스폰되는 경우 필요합니다
        for(var i = 0; i < snake.length; i++) {
            if(snake[i].x == apple.x && snake[i].y == apple.y) {
                // 다음에 뱀이 움직일 때 새 블록이 길이에 추가됩니다.
                addNew = true;
 
                // 오래된 사과를 파괴
                apple.destroy();
 
                // 새로 만들기.
                this.generateApple();
 
                // 점수 높이기.
                score++;
 
                // 점수 판 새로 고침.
                scoreTextValue.text = score.toString();
 
            }
        }
 
    },
 
    selfCollision: function(head) {
        // 뱀의 머리가 뱀의 일부와 겹치는 지 확인.
        for(var i = 0; i < snake.length - 1; i++) {
            if(head.x == snake[i].x && head.y == snake[i].y) {
                // 그렇다면 게임 오버으로 이동.
                game.state.start('Game_Over');
            }
        }
    },
 
    wallCollision: function(head) {
        // 뱀의 머리가 게임장의 경계에 있는지 확인.
        if(head.x >= 800 || head.x < 0 || head.y >= 600 || head.y < 0) {
            // 경계 안에 없으면 벽에 부딪힌 것입니다. 게임 오버으로 이동.
            game.state.start('Game_Over');
        }
    }
};
