
getControls();

//crouching
if(downKey && onGround && !attackKey && canCrouch){
	crouching = true;
}
else{
	crouching = false;
}

//x movement
moveDir = rightKey - leftKey //neato
//infer face:
if(moveDir != 0){
	face = moveDir;
}

//get x speed
xSpeed = moveDir * moveSpeed[runType];
runType = runKey;

//x collisions
var _subPixel = 0.5;
if place_meeting(x + xSpeed, y,  oWall){
	//if slope
	if(!place_meeting(x + xSpeed, y - abs(xSpeed) - 1, oWall)){
		while(place_meeting(x+xSpeed, y, oWall)){
			y -= _subPixel;
		}
	}
	//if no slope
	else{
		//scoot up to wall precisely
		var _pixelCheck = _subPixel * sign(xSpeed);
		while(!place_meeting(x + _pixelCheck, y, oWall)){
		x += _pixelCheck;
		}
	xSpeed = 0;
	}
}

//go down slope:
//check if not jumping
//clip to bottom wall
if(ySpeed >= 0 && !place_meeting(x+xSpeed, y + 1, oWall) && place_meeting(x+xSpeed, y+abs(xSpeed)+1, oWall)){
	while(!place_meeting(x+xSpeed, y + _subPixel, oWall)){
		y += _subPixel;
	}
}

x += xSpeed;

//y movement
//gravity
if(coyoteHangTimer > 0){
	coyoteHangTimer --;
}
else{
	//apply gravity to player
	ySpeed += grav;
	//we're no longer on ground
	setOnGround(false);
}

//jump
// to fly, remove the jumpmax
if(jumpKeyBuffered && jumpCount < jumpMax && canJump){
	audio_play_sound(JumpSFX,1,false);
	//reset buffer
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	//set the jump hold timer
	jumpHoldTimer = jumpHoldFrames;
	
	//tell ourselves we are no longer jumping
	setOnGround(false);
}

//cut off jump by releasing button
if(!jumpKey){
	jumpHoldTimer = 0;
}

if(jumpHoldTimer > 0){
	//constantly set y speed to be jumping speed
	ySpeed = jumpSpeed;
	jumpHoldTimer--;
}

if(ySpeed > termVel){ySpeed = termVel} //cap ySpeed @ termVal

var _subPixel = .5;

if (place_meeting(x, y+ySpeed, oWall)){
	var _pixelCheck = _subPixel * sign(ySpeed);

	while !place_meeting(x,y+_pixelCheck,oWall){
		y += _pixelCheck;
	}
	
	//bonk code
	if (ySpeed < 0){
		jumpHoldTimer = 0;
	}
	ySpeed = 0;
}

//set if on the ground
if (ySpeed >= 0 && place_meeting(x,y+1,oWall)){
	setOnGround(true);	
}
y += ySpeed;

		//sprite control
		if(crouching){
		sprite_index = crouchSpr;
		mask_index = crouchSpr;
		}
		else{
			if (abs(xSpeed) > 0){
				sprite_index = walkSpr;
			}
			if(abs(xSpeed) >= moveSpeed[1]){
				sprite_index = runSpr;
			}
			if(xSpeed == 0){
				sprite_index = idleSpr;
			}
			if(!onGround){
				sprite_index = jumpSpr;
			}
			mask_index = idleSpr;
		}

if(!instance_exists(oDetonator) && coolPoints == 20){
	oCamera.instruction = "Blow up the boxes!";
	instance_create_layer(1350,0,"Instances",oDetonator);
}



































































































