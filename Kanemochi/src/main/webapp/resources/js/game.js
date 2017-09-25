function restLeng(length){
  var temp = length % 10;
  var result = length + (10-temp);
  return result;
}
var width = restLeng($("#game").width());
var height = restLeng($("#game").height());
//----------------------------------
npcCharacter = function (game) {
    this.buildLeftX =0;
    this.buildRightX = game.world.width;
    this.npcFloor =0;
    this.direction = 'left';
    this.npcLeftEnd = 0;
    this.npcRightEnd = game.world.width;
    
    var width2 = (game.world.width - (150*0.35));
    var positionX = width2-(100);
    var positionY=0;

    positionY = game.world.height - (200*0.35);
    
    var npcImage = Math.floor(Math.random() * 5)+1;
    var randGender = Math.floor(Math.random() * 2);
    var npcGender;
    if(randGender == 0){
    	npcGender = 'w';
    }
    else{
    	npcGender = 'm';
    }
    Phaser.Sprite.call(this, game, positionX, positionY, 'npc_'+npcGender+npcImage);
    this.scale.setTo(0.35);
    game.physics.arcade.enable(this);
    var wink = this.animations.add('wink',[4,5],2,true);
    var leftWalk = this.animations.add('leftWalk',[0,1],2,true);
    var rightWalk = this.animations.add('rightWalk',[2,3],2,true);
    this.play('wink');
    game.add.existing(this);
};
npcCharacter.prototype = Object.create(Phaser.Sprite.prototype);
npcCharacter.prototype.constructor = npcCharacter;
npcCharacter.prototype.update = function() {
	
    var collideBuild = game.physics.arcade.collide(this,GameState.buildingGroup);
    var behavior = Math.floor(Math.random() * 1000);

    game.physics.arcade.collide(this,GameState.buildingTopGroup,function(main,test){
      main.npcLeftEnd = test.x;
      main.npcRightEnd = test.x+test.width-main.width+1;
    });
    if(behavior >=0 && behavior < 1){
      // this.turn();
    }
    if((collideBuild == true) &&behavior >=1 && behavior <2){
      this.elevator();
    }
    if((collideBuild == true) && behavior >=2 && behavior <3){
      // this.out();
    }
    if(behavior >=3 && behavior <1000){
      this.move();
    }
};
npcCharacter.prototype.move = function(){
	
  var wholeFloor=1;
  if((game.world.height - this.height) == this.y){
    this.npcFloor = 1;
  }
  else{
    wholeFloor = Math.floor(game.world.height/159);
    for(var i=1;i<wholeFloor;i++){
      if((game.world.height-(159*i)) >= this.y && (game.world.height-(159*(i+1)) < this.y)){
        this.npcFloor = i+1;
        break;
      }
    }
  }

  if(this.npcFloor ==1){
    if(this.x <= this.buildLeftX){
      this.direction = 'right';
    }
    else if(this.x >= (this.buildRightX-this.width)){
      this.direction = 'left';
    }
    if(this.direction == 'right' && this.x < (this.buildRightX-this.width))
    {
      this.x+=2;
      this.play('rightWalk');
    }
    else if(this.direction == 'left' && this.x > this.buildLeftX ){
      this.x-=2;
      this.play('leftWalk');
    }
  }

    if(this.npcFloor>1){
        game.physics.arcade.collide(this,GameState.buildingTopGroup,function(main,test){
          if(main.npcLeftEnd == 0){
            main.npcLeftEnd = test.x;
          }
          if(main.npcRightEnd == game.world.width){
            main.npcRightEnd = test.x+test.width-main.width+1;
          }
          if(test.x < main.npcLeftEnd){
            //이동을 하겠지..
              main.npcLeftEnd = test.x;
          }
          if (test.x > main.npcRightEnd) {
            main.npcRightEnd = (test.x)+(test.width)-main.width;
          }
        
          if(main.x <= main.npcLeftEnd){
            main.direction = 'right';
          }
          if(main.x >= main.npcRightEnd){
            main.direction = 'left';
          }
        });
        if(this.direction == 'right' && this.x <= this.npcRightEnd)
        {
          this.x+=2;
          this.play('rightWalk');
        }
        if(this.direction == 'left' && this.x >= this.npcLeftEnd){
          this.x-=2;
          this.play('leftWalk');
        }
    }
    
}
npcCharacter.prototype.out = function(){
  console.log('out');

  if(this.npcFloor>1){
    this.y+=158;
  }
}
npcCharacter.prototype.elevator = function(){
  console.log('elevator');
  this.y-=158;
}
npcCharacter.prototype.turn = function(){
  console.log('turn');
  if(this.direction == 'right'){
      this.direction = 'left';
  }
  if(this.direction == 'left'){
      this.direction = 'right';
  }
}
//---------------------------------------------------
var game = new Phaser.Game(width,height,Phaser.AUTO,"game");
var ground; // 밑의 투명한 바닥 : 전역변수

var buildingCounter = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];//카테고리별 빌딩의 수를 담으려고 함. (여기서 쓰려고)
var numberOfNPC=0;
var incOrDec = true;
var direction = 'right';
var userCharacter;
var userDirection ='right';
var beforeLevel=1;
var level =1;
var cursors;
//var deleteMode = false;
var GameState = {
  preload:function(){
    //이미지 호출
	  this.load.spritesheet('cafe','/kanemochi/resources/image/shop/complete/cafe.png',400,300);
	    this.load.spritesheet('bus', '/kanemochi/resources/image/shop/complete/bus.png', 600, 300);
	    this.load.spritesheet('bank', '/kanemochi/resources/image/shop/complete/bank.png', 600, 300);
	    this.load.spritesheet('movie', '/kanemochi/resources/image/shop/complete/movie.png', 600, 300);
	    this.load.spritesheet('hospital', '/kanemochi/resources/image/shop/complete/hospital.png', 600, 300);
	    this.load.spritesheet('beer', '/kanemochi/resources/image/shop/complete/beer.png', 400, 300);
	    this.load.spritesheet('book', '/kanemochi/resources/image/shop/complete/book.png', 400, 300);
	    this.load.spritesheet('clothes', '/kanemochi/resources/image/shop/complete/clothes.png', 400, 300);
	    this.load.spritesheet('cvs', '/kanemochi/resources/image/shop/complete/cvs.png', 400, 300);
	    this.load.spritesheet('dessert', '/kanemochi/resources/image/shop/complete/dessert.png', 400, 300);
	    this.load.spritesheet('hair', '/kanemochi/resources/image/shop/complete/hair.png', 400, 300);
	    this.load.spritesheet('ramen', '/kanemochi/resources/image/shop/complete/ramen.png', 400, 300);
	    this.load.spritesheet('sushi', '/kanemochi/resources/image/shop/complete/sushi.png', 400, 300);
	    
	  this.load.image('background', '/kanemochi/resources/image/bg/bg.jpg');
    this.load.spritesheet('ground','/kanemochi/resources/image/bg/ground.png');
    
    this.load.spritesheet('buildingTopLong','/kanemochi/resources/image/bg/buildingTop.png',600,30);
    this.load.spritesheet('buildingTopShort','/kanemochi/resources/image/bg/buildingTop.png',400,30);
    this.load.spritesheet('buildingTopCheck','/kanemochi/resources/image/bg/buildingTop.png',400,30);
    this.load.spritesheet('buildingWall','/kanemochi/resources/image/bg/wall.png',400,300);
    
    
    this.load.spritesheet('elevator', '/kanemochi/resources/image/shop/complete/elevator.png',400, 300);
    
    this.load.spritesheet('delete_button','/kanemochi/resources/image/button/delete_button.png',80,60);
    
    this.load.spritesheet('onlySpeech','/kanemochi/resources/image/speech/speech_bubble2.png');
    
    this.load.spritesheet('mainCharacter', '/kanemochi/resources/image/character/character_final/chineseGirl_final.png', 150, 200);
    this.load.spritesheet('npc_w1', '/kanemochi/resources/image/npc/npc_w1.png', 150, 200);
    this.load.spritesheet('npc_m1', '/kanemochi/resources/image/npc/npc_m1.png', 150, 200);
    this.load.spritesheet('npc_w2', '/kanemochi/resources/image/npc/npc_w2.png', 150, 200);
    this.load.spritesheet('npc_m2', '/kanemochi/resources/image/npc/npc_m2.png', 150, 200);
    this.load.spritesheet('npc_w3', '/kanemochi/resources/image/npc/npc_w3.png', 150, 200);
    this.load.spritesheet('npc_m3', '/kanemochi/resources/image/npc/npc_m3.png', 150, 200);
    this.load.spritesheet('npc_w4', '/kanemochi/resources/image/npc/npc_w4.png', 150, 200);
    this.load.spritesheet('npc_m4', '/kanemochi/resources/image/npc/npc_m4.png', 150, 200);
    this.load.spritesheet('npc_w5', '/kanemochi/resources/image/npc/npc_w5.png', 150, 200);
    this.load.spritesheet('npc_m5', '/kanemochi/resources/image/npc/npc_m5.png', 150, 200);
    
    this.load.spritesheet('level_1','/kanemochi/resources/image/level/level1.png');
    this.load.spritesheet('level_2','/kanemochi/resources/image/level/level2.png');
    this.load.spritesheet('level_3','/kanemochi/resources/image/level/level3.png');
    this.load.spritesheet('level_4','/kanemochi/resources/image/level/level4.png');
    this.load.spritesheet('level_5','/kanemochi/resources/image/level/level5.png');
    this.load.spritesheet('level_6','/kanemochi/resources/image/level/level6.png');
    this.load.spritesheet('level_7','/kanemochi/resources/image/level/level7.png');
    this.load.spritesheet('level_8','/kanemochi/resources/image/level/level8.png');
    this.load.spritesheet('level_9','/kanemochi/resources/image/level/level9.png');
    this.load.spritesheet('level_10','/kanemochi/resources/image/level/level10.png');
	this.load.spritesheet('beer','/kanemochi/resources/image/beer.png',400,300);
	this.load.spritesheet('burger','/kanemochi/resources/image/burger.png',400,300);
	this.load.spritesheet('dessert','/kanemochi/resources/image/dessert.png',400,300);
	
  },
  create:function(){
  //근본적인 생성로직들 = 배경
  game.world.setBounds(0, 0, width*2, height*1.5);
  this.background = this.game.add.sprite(0,0,'background');
  this.background.width = width*2;
  this.background.height = height*1.5;
  //밑 바닥의 투명 배경
  ground = this.add.sprite(0,(height*1.5)+5,'ground');
  this.game.stage.disableVisibilityChange = true;
  //player character
  userCharacter = this.game.add.sprite(0,0,'mainCharacter');
  
  userCharacter.scale.setTo(0.5);
  userCharacter.y = game.world.height - userCharacter.height;
  game.physics.arcade.enable(userCharacter);
  var wink = userCharacter.animations.add('wink',[4,5],2,true);
  var leftWalk = userCharacter.animations.add('leftWalk',[0,1],2,true);
  var rightWalk = userCharacter.animations.add('rightWalk',[2,3],2,true);
  userCharacter.play('wink');
  //var elevatorMove = elevator.animations.add('elevatorMove',[0,1,2,3,4,5,6],7,true);
  //건물 배열같은거.(ArrayList처럼 생각하세요)
  this.buildingGroup = game.add.group();
  this.buildingGroup.enableBody = true;
  this.buildingTopGroup = game.add.group();
  this.buildingTopGroup.enableBody = true;
  this.elevatorGroup = game.add.group();
  this.elevatorGroup.enableBody = true;
  this.elevatorTopGroup = game.add.group();  
  this.npcGroup = game.add.group();
  this.wallGroup = game.add.group();
  this.wallGroup.enableBody = true;
  this.gameGroup = game.add.group();
 //주의 : 폰트 안됨. 하얀거만 칠해진거임. //text 관련
 // 그리고 여기는 아마 html과 합치게 되면 없어지거나 다르게 변형해야 할 내용이라고 생각함.
  
  //카메라 임시
  cursors = game.input.keyboard.createCursorKeys();
  game.camera.y += height;
  
  //physics
  this.game.physics.startSystem(Phaser.Physics.ARCADE);//game의 물리법칙을 Phaser.Physics.ARCADE로 한다는 뜻
  //캐릭터와 밑의 투명 배경의 충돌을 위해 작성한 내용. 1.캐릭터와 밑 배경에 arcade 물리 적용
  this.game.physics.arcade.enable(ground);
  //밑 바닥에 중력처리 안해서 안떨어지게(물리는 적용되게)
  ground.body.allowGravity = false;
  ground.body.immovable = true;
  getStatus();
  },
    update:function(){
      this.game.world.bringToTop(GameState.npcGroup);
      this.game.physics.arcade.collide(GameState.npcGroup,ground);
      this.game.physics.arcade.collide(GameState.npcGroup,GameState.buildingTopGroup);
      this.game.physics.arcade.collide(GameState.npcGroup,GameState.elevatorTopGroup);
      
      this.game.physics.arcade.enable(GameState.buildingTopGroup);
      this.game.physics.arcade.enable(GameState.elevatorTopGroup);
      this.game.physics.arcade.enable(GameState.wallGroup);
      this.game.physics.arcade.collide(userCharacter,ground);
      this.game.world.bringToTop(userCharacter);
      
      if(level != beforeLevel){
    	  userCharacterBehavior(userCharacter,'levelUP');
      }
      if (cursors.up.isDown)
      {
          game.camera.y -= 10;
      }
      else if (cursors.down.isDown)
      {
          game.camera.y += 10;
      }
      if (cursors.left.isDown)
      {
          game.camera.x -= 10;
      }
      else if (cursors.right.isDown)
      {
          game.camera.x += 10;
      }

      
      game.physics.arcade.collide(GameState.npcGroup,GameState.elevatorGroup,function(left,right){
    	  if(right.getBounds().contains(right.x, right.y-15)){
    		  
    	  }
      })
      
    }
};
game.state.add('GameState',GameState);
game.state.start('GameState');

function userCharacterBehavior(userCharacter,situation){
	var randBehavior = Math.floor(Math.random() * 2);
		comeUserCharacter(userCharacter,situation);
}

function comeUserCharacter(userCharacter,situation){
	if(userCharacter.x < 300 && userDirection=='right'){
		userCharacter.play('rightWalk');
		userCharacter.x = userCharacter.x+1;
	}
	else if(userCharacter.x > 0 && userDirection == 'left'){
		userCharacter.play('leftWalk');
		userCharacter.x = userCharacter.x-1;
	}
	if(userCharacter.x ==300){
		var ballon = this.game.add.sprite(300+(userCharacter.width*2),userCharacter.y-(userCharacter.height*1.2),'onlySpeech');

		ballon.anchor.set(0.5);
		ballon.scale.setTo(-0.3,0.3);
		ballon.x -= userCharacter.width;
		userCharacter.play('wink');
	if(situation == 'levelUP'){
		var joun=  game.add.text(150,-350,"레벨 업", { font: "100px arial", fill: "#000000", align: "center" });
		joun.scale.setTo(-1,1);
		ballon.addChild(joun);
		var levelImg = game.add.sprite(+150,-200,'level_'+level);
		levelImg.scale.setTo(-1.5,1.5);
		ballon.addChild(levelImg);
	}	
	else{
		var joun=  game.add.text(300,-200,"히오스는 갓겜", { font: "100px arial", fill: "#000000", align: "center" });
		joun.scale.setTo(-1,1);
		ballon.addChild(joun);
	}	
		setTimeout(function(){
			userDirection = 'left';
			ballon.destroy();
		},2000);
	}
	else if(userCharacter.x ==0){
		userDirection = 'right';
		userCharacter.play('wink');
		beforeLevel = level;
	}
}

function getStatus(){
	$.ajax({
		url : '/kanemochi/record/getStatus',
		method : 'post',
		dataType : "json",
		success: function(result) {
			$(result).each(function(index,item){
				setTimeout(stateBuilding(item.img_id,item.img_x,item.img_y),200);
			});
		},
		error: function() {
			console.log("error");
		}
	});
}

function stateBuilding(inputText,buildingX,buildingY){
	//충돌 체크하기 위한 변수.
	  var checkResult;
	  var topCheck;
	  var sprite2 = game.add.sprite(buildingX,buildingY,inputText);
	  sprite2.inputEnabled = true;
	  var result;
	  if(typeof(inputText) == "string"){
		  	if(inputText != 'elevator')
		  	{
			    GameState.buildingGroup.add(sprite2);  
	        }
		  	else if(inputText == 'elevator'){
		  		GameState.elevatorGroup.add(sprite2);  
		  	}
		  	console.log("여기 지나감");
		    sprite2.events.onInputOver.add(function(){
				  deleteButtonOn(sprite2);
			  },this);
			  sprite2.events.onInputOut.add(function(){
				  deleteButtonOff(sprite2);
			  },this);
		  		sprite2.scale.setTo(0.5);
			  game.physics.arcade.enable(sprite2);
			  sprite2.body.allowGravity = false;
			  sprite2.body.immovable = true;
			  	switch (inputText) {
			    	    case 'cafe':
			    	      sprite2.name = inputText+'_'+(++buildingCounter[0]);
			    	      break;
			    	    case 'beer':
			    	      sprite2.name = inputText+'_'+(++buildingCounter[1]);
			    	      break;
			    	    case 'ramen':
			    	        sprite2.name = inputText+'_'+(++buildingCounter[2]);
			    	        break;
			    	    case 'cvs':
			    	        sprite2.name = inputText+'_'+(++buildingCounter[3]);
			    	        break;    
			    	    case 'sushi':
			    	    	sprite2.name = inputText+'_'+(++buildingCounter[4]);
			    	    	break;
			    	    case 'dessert':
			    	    	sprite2.name = inputText+'_'+(++buildingCounter[5]);
			    	    	break;
			    	    case 'bus':
			    	        sprite2.name = inputText+'_'+(++buildingCounter[6]);
			    	        break;
			    	    case 'movie':
			    	    	sprite2.name = inputText+'_'+(++buildingCounter[7]);
			    	    	break;
			          case 'hospital':
			              sprite2.name = inputText+'_'+(++buildingCounter[8]);
			              break;
			          case 'book':
			              sprite2.name = inputText+'_'+(++buildingCounter[9]);
			              break;    
			          case 'hair':
			          	sprite2.name = inputText+'_'+(++buildingCounter[10]);
			          	break;
			          case 'clothes':
			          	sprite2.name = inputText+'_'+(++buildingCounter[11]);
			          	break;
			          case 'burger':
			        	sprite2.name = inputText+'_'+(++buildingCounter[12]);
			        	break;
			          case 'elevator':
				        sprite2.name = inputText+'_'+(++buildingCounter[13]);
				        break;
			          default:
			        	  break;
			 	}
  	    
	    	      var wholeFloor=1;
	    	      var buildingFloor =0;
	    	      if((game.world.height - 150) == sprite2.y){
	    	        buildingFloor = 1;
	    	      }
	    	      if((game.world.height - 300) == sprite2.y){
		    	        buildingFloor = 2;
		    	      }
	    	      else{
	    	        wholeFloor = Math.floor(((game.world.height - sprite2.height)/159))+1;
	    	        for(var i=1;i<wholeFloor-1;i++){
	    	          if((game.world.height-300)-(160*i) == sprite2.y){
	    	            buildingFloor = i+2;
	    	            break;
	    	          }
	    	        }
	    	      }
	    	     if(buildingFloor>1){
	    	    	 sprite2.y = sprite2.y-9;
	    	     }
	    	      sprite2.buildingFloor = buildingFloor;
	    	      var buildingTop;

	    	    if(sprite2.width == 200){
	    	      buildingTop =  game.add.sprite(sprite2.x, sprite2.y-8.9, 'buildingTopShort');
	    	    }
	    	    else if(sprite2.width == 300){
	    	      buildingTop =  game.add.sprite(sprite2.x, sprite2.y-8.9, 'buildingTopLong');
	    	    }

	    	    GameState.buildingTopGroup.add(buildingTop);
	    	    if(sprite2.key =='elevator'){
	    	    	GameState.elevatorTopGroup.add(buildingTop);
	    	    }
	    	    buildingTop.scale.setTo(0.5,0.3);
	    	    this.game.physics.arcade.enable(buildingTop);
	    	    buildingTop.body.allowGravity = false;
	    	    buildingTop.body.immovable = true;
	    	 
	    	    //--------------------------------------------------------------------------
	    	  
	    	     var leftWing;
	    	    if(sprite2.width == 200){
	    	    	leftWing =  game.add.sprite(sprite2.x - sprite2.width-0.5, sprite2.y+30, 'buildingTopCheck');
	    	    }
	    	    else if(sprite2.width == 300){
	    	    	leftWing =  game.add.sprite(sprite2.x - sprite2.width +99.5, sprite2.y+30, 'buildingTopCheck');
	    	    }
	    		var rightWing =  game.add.sprite(sprite2.x + sprite2.width, sprite2.y+30, 'buildingTopCheck');

	    		this.game.physics.arcade.enable([leftWing,rightWing]);
	    		leftWing.scale.setTo(0.5,0.3);
	    		rightWing.scale.setTo(0.5,0.3);
	    		
	    		var leftWall;
	    		var rightWall;
	    		var leftWallTop;
	    		var rightWallTop;
	    		var timer = setTimeout(function(){
					var leftCollision = game.physics.arcade.collide(leftWing,GameState.buildingGroup,function(left,test){
						if(!game.physics.arcade.collide(leftWing,GameState.wallGroup)){
		    			 if(test.name != sprite2.name && (sprite2.x - (test.x+test.width)) < 200){
		    				 leftWall = game.add.sprite(test.x+test.width, test.y, 'buildingWall');
		    			    
		    			      leftWall.scale.setTo(0.5,1);
		    			      leftWall.width = (sprite2.x - test.x - test.width);
		    			      leftWall.height = sprite2.height;
		    			      console.log(leftWall);
		    			      GameState.wallGroup.add(leftWall);
		    			      
		    			      leftWallTop =  game.add.sprite(leftWall.x, leftWall.y-8.9, 'buildingTopShort');
		    			      leftWallTop.scale.setTo(0.5,0.3);
		    			      leftWallTop.width = (sprite2.x - test.x - test.width);
		    			      
		    			      game.physics.arcade.enable(leftWallTop);
		    			      leftWallTop.body.allowGravity = false;
		    			      leftWallTop.body.immovable = true;
		    			      leftWallTop.tint = 0xff0000;
		    			      GameState.buildingTopGroup.add(leftWallTop);
		    			 }
						}
		    		 });
		    		var rightCollision = game.physics.arcade.collide(rightWing,GameState.buildingGroup,function(right,test){
		    			if(!game.physics.arcade.collide(right,GameState.wallGroup)){
		    			 if(test.name != sprite2.name && (test.x - (sprite2.x+sprite2.width)) < 200){
		    				 rightWall = game.add.sprite(sprite2.x+sprite2.width, sprite2.y, 'buildingWall');
		    				 rightWall.scale.setTo(0.5,1);
		    				 var temp = sprite2.x+sprite2.width;
		    				
		    				 rightWall.width = (test.x - temp);
		    			      rightWall.height = test.height;
		    			      console.log(rightWall);
		    			      GameState.wallGroup.add(rightWall);
		    			      
		    			      rightWallTop =  game.add.sprite(rightWall.x, rightWall.y-8.9, 'buildingTopShort');
		    			      
		    			      rightWallTop.scale.setTo(0.5,0.3);
		    			      rightWallTop.width = (test.x - temp);
		    			      game.physics.arcade.enable(rightWallTop);
		    			      rightWallTop.body.allowGravity = false;
		    			      rightWallTop.body.immovable = true;
		    			      rightWallTop.tint = 0x00ff00;
		    			      GameState.buildingTopGroup.add(rightWallTop);
		    			 } 
		    			}
		    		 });
	    			var leftCollision1 = game.physics.arcade.collide(leftWing,GameState.elevatorGroup,function(left,test){
	    				if(!game.physics.arcade.collide(leftWing,GameState.wallGroup)){
		    			 if(test.name != sprite2.name && (sprite2.x - (test.x+test.width)) < 200){
		    				 leftWall = game.add.sprite(test.x+test.width, test.y, 'buildingWall');
		    			    
		    			      leftWall.scale.setTo(0.5,1);
		    			      leftWall.width = (sprite2.x - test.x - test.width);
		    			      leftWall.height = sprite2.height;
		    			      GameState.wallGroup.add(leftWall);
		    			      console.log(leftWall);
		    			      leftWallTop =  game.add.sprite(leftWall.x, leftWall.y-8.9, 'buildingTopShort');
		    			      leftWallTop.scale.setTo(0.5,0.3);
		    			      leftWallTop.width = (sprite2.x - test.x - test.width);
		    			      game.physics.arcade.enable(leftWallTop);
		    			      leftWallTop.body.allowGravity = false;
		    			      leftWallTop.body.immovable = true;
		    			      leftWallTop.tint = 0xff0000;
		    			      GameState.buildingTopGroup.add(leftWallTop);
		    			 }
	    				}
		    		 });
		    		var rightCollision1 = game.physics.arcade.collide(rightWing,GameState.elevatorGroup,function(right,test){
		    			if(!game.physics.arcade.collide(rightWing,GameState.wallGroup)){
		    			 if(test.name != sprite2.name && (test.x - (sprite2.x+sprite2.width)) < 200){
		    				 rightWall = game.add.sprite(sprite2.x+sprite2.width, sprite2.y, 'buildingWall');
		    				 rightWall.scale.setTo(0.5,1);
		    				 var temp = sprite2.x+sprite2.width;
		    				
		    				 rightWall.width = (test.x - temp);
		    			      rightWall.height = test.height;
		    			      GameState.wallGroup.add(rightWall);
		    			      console.log(rightWall);
		    			      rightWallTop =  game.add.sprite(rightWall.x, rightWall.y-8.9, 'buildingTopShort');
		    			     
		    			      rightWallTop.scale.setTo(0.5,0.3);
		    			      rightWallTop.width = (test.x - temp);
		    			      game.physics.arcade.enable(rightWallTop);
		    			      rightWallTop.body.allowGravity = false;
		    			      rightWallTop.body.immovable = true;
		    			      rightWallTop.tint = 0x0000ff;
		    			      GameState.buildingTopGroup.add(rightWallTop);
		    			 }
		    			}
		    		 });
		    		leftWing.destroy();
		    		rightWing.destroy();
				}, 150);
		  		
	    	    //------------------------------------------------------------------------
	    	    numberOfNPC = getNumberOfNPC(numberOfNPC,GameState.buildingGroup.length,incOrDec);
	    	    
	    	    randomCreateNPC(numberOfNPC);
	    	    for(var j=0;j<GameState.npcGroup.length;j++){
	    	      var npcI = GameState.npcGroup.getAt(j);
	    	    }
	  		}
	    	  else{
	    	    //충돌시 건물 삭제.
	    	    switch (sprite2.key) {
	    	      case 'cafe':
	    	        buildingCounter[0]--;
	    	        break;
	    	      case 'beer':
	    	        buildingCounter[1]--;
	    	        break;
	    	      case 'ramen':
	    	          buildingCounter[2]--;
	    	          break;
	    	      case 'cvs':
	    	          buildingCounter[3]--;
	    	          break;
	    	      case 'sushi':
	    	          buildingCounter[4]--;
	    	          break;
	    	      case 'dessert':
	    	          buildingCounter[5]--;
	    	          break;
	    	      case 'bus':
	    	          buildingCounter[6]--;
	    	          break;
	    	      case 'movie':
	    	          buildingCounter[7]--;
	    	          break;
	    	      case 'hospital':
	    	          buildingCounter[8]--;
	    	          break;
	    	      case 'book':
	    	          buildingCounter[9]--;
	    	          break;
	    	      case 'hair':
	    	          buildingCounter[10]--;
	    	          break;
	    	      case 'clothes':
	    	          buildingCounter[11]--;
	    	          break;
	    	      case 'burger':
	    	          buildingCounter[12]--;
	    	          break;
	    	      case 'elevator':
	    	          buildingCounter[13]--;
		    	          break;
	    	      default:
	    	      }
	    	    GameState.buildingGroup.remove(sprite2);
	    	    GameState.elevatorGroup.remove(sprite2);
	    	  }
}

function createBuilding(inputText){
	
  //충돌 체크하기 위한 변수.
  var checkResult;
  //하얀천장 닿는지 체크하기 위한
  var topCheck;
  //건물 이미지(sprite)를 생성하면서 위에 설정한 Phaser Group에 넣습니다. 마우스 포인트 위치 기준으로 넣고
  //inputText에 해당하는 스프라이트를 위에서 (preload)찾아서 그 이미지를 불러옵니다.
  var spriteTemp = game.add.sprite(game.camera.x,game.camera.y,inputText);
  var elevatorTop = spriteTemp;
  var elevatorBottom;
  var elevatorComplete;
  var result;
//  var spriteTemp = buildingGroup.create(game.input.mousePointer.x,game.input.mousePointer.y,inputText);
	  if(inputText != 'elevator'){
		  GameState.buildingGroup.add(spriteTemp);  
	  }
	  else if(inputText == 'elevator'){
		  GameState.elevatorGroup.add(spriteTemp);  
	  }
	  spriteTemp.scale.setTo(0.5);
	  spriteTemp.alpha = 0.5;
	  spriteTemp.inputEnabled = true;
	  spriteTemp.input.enableDrag();
	  spriteTemp.input.enableSnap(10, 10, true, true);
	  
	  //그 건물 스프라이트에 대한 물리 처리
	  game.physics.arcade.enable(spriteTemp);
	  spriteTemp.body.allowGravity = false;
	  spriteTemp.body.immovable = true;
	  //해당 스프라이트에 대한 drag 이벤트 처리
	  spriteTemp.events.onDragUpdate.add(checkCollide,spriteTemp);

	  function checkCollide(sprite){//충돌처리 확인하는 내부함수
	      //drag시 충돌하는지 안하는지 처리

	      var check;//false 충돌 안남. / true 충돌남.
	      var firstFloorCheck = true; // true면 1층인거
	      var windowCheck = true; // false면 게임창 바깥 나간거
	    //게임 나가냐 안나가냐
	    if(sprite.x < 0 || sprite.x > game.world.width-(sprite.width) || sprite.y < 0 || sprite.y > game.world.height - (sprite.height)){
	      windowCheck = false;
	    }
	    //1층처리
	    if(sprite.y< game.world.height -(sprite.height) ){
	      firstFloorCheck = false;
	    }
	    //건물 위에 하얀 바 닿았을때 확인
	    topCheck = game.physics.arcade.collide(sprite,GameState.buildingTopGroup);
	    topCheck1 = game.physics.arcade.collide(sprite,GameState.elevatorTopGroup);
	    //게임창을 안벗어나면서 1층일 경우 충돌을 체크해서 생성여부 정함
	    if(sprite.key != 'elevator'){
	    	if(windowCheck == true && firstFloorCheck == true && topCheck == false){
	  	      check = game.physics.arcade.collide(sprite,GameState.buildingGroup);
	  	      check1 = game.physics.arcade.collide(sprite,GameState.elevatorGroup);
	  	      // check = false;
	  	    }
	  	    //게임창 안벗어나고, 1층이 아니더라도, 위에 하얀바에 닿으면 충돌 체크해서 생성여부 정함
	  	    else if(windowCheck == true && firstFloorCheck == false && topCheck==true && topCheck1 == false){
	  	      //만들어진 건물들을 담은 그룹에서 건물들 스프라이트를 배열로 뽑아옴
	  	      var getBuilding = GameState.buildingGroup.getAll('exists', true);
	  	      for (var i in getBuilding) {
	  	        //지금 드래그하는 건물의 x랑 만들어진 건물들과의 x좌표를 비교함 그런데
	  	        //지금 드래그하는 건물 역시 그룹에 들어가있기 때문에 이름이 같은(자기자신)을 제외하고 검색.
	  	        if(sprite.y<= (getBuilding[i].y-sprite.height) && sprite.name != getBuilding[i].name){
	  	          check = game.physics.arcade.collide(sprite,GameState.buildingGroup);
	  	          check1 = game.physics.arcade.collide(sprite,GameState.elevatorGroup);
	  	          break;
	  	        }
	  	        else{
	  	          check = true;
	  	          check1 =true;
	  	        }
	  	      }
	  	    }
	  	    else{
	  	      check = true;
	  	      check1= true;
	  	      
	  	    }
	    }
	    else if(sprite.key == 'elevator'){
	    	if(windowCheck == true && firstFloorCheck == true && topCheck1 == false){
	            check = game.physics.arcade.collide(sprite,GameState.buildingGroup);
	            check1 = game.physics.arcade.collide(sprite,GameState.elevatorGroup);
	            // check = false;
	          }
	          //게임창 안벗어나고, 1층이 아니더라도, 위에 하얀바에 닿으면 충돌 체크해서 생성여부 정함
	          else if(windowCheck == true && firstFloorCheck == false && topCheck1 ==true){
	            //만들어진 건물들을 담은 그룹에서 건물들 스프라이트를 배열로 뽑아옴
	            var getBuilding = GameState.elevatorGroup.getAll('exists', true);
	            for (var i in getBuilding) {
	              //지금 드래그하는 건물의 x랑 만들어진 건물들과의 x좌표를 비교함 그런데
	              //지금 드래그하는 건물 역시 그룹에 들어가있기 때문에 이름이 같은(자기자신)을 제외하고 검색.
	              if(sprite.y<= (getBuilding[i].y-sprite.height) && sprite.name != getBuilding[i].name){
	                check = game.physics.arcade.collide(sprite,GameState.buildingGroup);
	                check1 = game.physics.arcade.collide(sprite,GameState.elevatorGroup);
	                break;
	              }
	              else{
	                check = true;
	                check1 = true;
	              }
	            }
	          }
	          else{
	            check = true;
	            check1 = true;
	          }
	    }
	    //모든 충돌여부에 따른 건물 색깔 변화
	    if(check == true && check1 == true){
	      sprite.tint = 0xff0000;
	      checkResult = true;
	    }
	    else{
	      sprite.tint = 0xffffff;
	      checkResult = false;
	    }
	  }
	  	spriteTemp.events.onInputUp.add(function(){
		var temp;
		temp = mouseUp(spriteTemp,checkResult,topCheck);
    	 res = temp; 
    	},this);
}
//보통 빌딩을 마우스 버튼 뗐을 때 로직

function mouseUp(sprite,check,topCheck){
  //check는 아까 위에서 했던 충돌여부임.
	var result = true;
  if(check == false){
    //충돌안하면 설정하는 것들 / 투명도 복구 / 움직임, 드래그 방지 / 메인캐릭터를 제일 앞으로 오게 (건물에 가려지지않게)
    stateBuilding(sprite.key,sprite.x,sprite.y);
    $.ajax({
        url : '/kanemochi/record/setStatus',
        method : 'post',
        data : {'img_x':sprite.x,
               'img_y':sprite.y,
               'img_id':sprite.key},
        success: function(result) {
        	console.log("성공");
        },
        error: function() {
        	console.log("성공");
        }
     });
  }
  else{
    result=  false;
  }
  if(sprite.key != 'elevator'){
	  //그냥 건물
	  GameState.buildingGroup.remove(sprite);
  }
  else if(sprite.key == 'elevator'){
	  //엘리베이터
	  GameState.elevatorGroup.remove(sprite);
  }
  sprite.destroy();
  return result;
}
function deleteButtonOn(anywaySprite){
	
	var delete_button = game.add.sprite(0+(anywaySprite.width*1.8) - 10,20,'delete_button');
	delete_button.inputEnabled = true;
	
	anywaySprite.addChild(delete_button);
	delete_button.scale.setTo(0.5);
	delete_button.events.onInputDown.add(function(){
		
		var delete_result = confirm("삭제하시겠습니까?!");
		if(delete_result){
			 var leftWing2;
			    if(anywaySprite.width == 200){
			    	leftWing2 =  game.add.sprite(anywaySprite.x - anywaySprite.width, anywaySprite.y+30, 'buildingTopCheck');
			    }
			    else if(anywaySprite.width == 300){
			    	leftWing2 =  game.add.sprite(anywaySprite.x - anywaySprite.width +100, anywaySprite.y+30, 'buildingTopCheck');
			    }
				var rightWing2 =  game.add.sprite(anywaySprite.x + anywaySprite.width, anywaySprite.y+30, 'buildingTopCheck');

				this.game.physics.arcade.enable([leftWing2,rightWing2]);
				leftWing2.scale.setTo(0.5,0.3);
				rightWing2.scale.setTo(0.5,0.3);
				
				var leftWall;
				var rightWall;
				var leftWallTop;
				var rightWallTop;
				
				setTimeout(game.physics.arcade.collide(leftWing2,GameState.wallGroup,function(left,wall){
					console.log("왼쪽 벽 충돌");
					console.log(anywaySprite);
					console.log(left);
					console.log(wall);
					      game.physics.arcade.collide(wall,GameState.buildingTopGroup,function(wall2,top){
					    	  console.log("왼쪽 벽과 벽 지붕 충돌");
					    	  console.log(anywaySprite);
								console.log(wall2);
								console.log(top);
					    	  GameState.buildingTopGroup.remove(top);
					      });
					      GameState.wallGroup.remove(wall);
				      
				 }),100);
				setTimeout(game.physics.arcade.collide(rightWing2,GameState.wallGroup,function(right,wall){
					console.log("오른쪽 벽 충돌");
					console.log(anywaySprite);
					console.log(right);
					console.log(wall);
					game.physics.arcade.collide(wall,GameState.buildingTopGroup,function(wall2,top){
						console.log("오른쪽 벽과 벽 지붕 충돌");
						console.log(anywaySprite);
						console.log(wall2);
						console.log(top);
				    	  GameState.buildingTopGroup.remove(top);
				      });
				      GameState.wallGroup.remove(wall);
				 }),100);
				
				//여기에 그 Ajax 넣으시고
				setTimeout(game.physics.arcade.collide(anywaySprite,GameState.buildingTopGroup,function(sprite,top){
					console.log("건물 지붕 제거");
					GameState.buildingTopGroup.remove(top);
				}),100);
				GameState.buildingGroup.remove(anywaySprite);
				leftWing2.destroy();
				rightWing2.destroy();
		}
		else{ console.log("삭제 안한다 마!")};	
	},this);
}
function deleteButtonOff(anywaySprite){
		anywaySprite.removeChildAt(0);
}


function getNumberOfNPC(npc,nowBuildingCounter,incOrDec){
    if(nowBuildingCounter<11 && nowBuildingCounter == 1){
      npc = 1;
    }
    else if((nowBuildingCounter %5 != 0) && (nowBuildingCounter <11)){
      if(incOrDec == true){
          npc+=(nowBuildingCounter-1);
      }
      else{
        npc-=(nowBuildingCounter+1);
      }
    }
    else{
      return 0;
    }
    return npc;
  }

  
  function randomCreateNPC(numberOfNPC){
    var randomTime;
      for(var i=0; i<numberOfNPC-1;i++){
        
        randomTime = 5;
        setTimeout(temp, randomTime*1000);
      }
      function temp(){
        var sprite =new npcCharacter(game);
        GameState.npcGroup.add(sprite);
      }
  }

