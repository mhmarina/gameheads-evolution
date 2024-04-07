//custom functions for player
function setOnGround(_val = true){
	if(_val == true){
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
		coyoteJumpTimer = coyoteJumpFrames;
		jumpCount = 0;
	}
	else{
		coyoteJumpFrames--;
		onGround = false;
		coyoteHangTimer = 0;
		if(jumpCount == 0 && coyoteJumpTimer <= 0){
		jumpCount = 1;
		}
	}
}

controlsSetup();
//sprite
idleSpr = sPlayer_idle;
jumpSpr = sPlayer_Jump;
walkSpr = sPlayer_Walking;
runSpr = sPlayer_Run;
crouchSpr = sPlayer_Crouch;
//moving
face = 1; //1 -> right, -1 -> left
moveDir = 0;
runType = 0;
moveSpeed[0] = 6;
moveSpeed[1] = 9; //sprint
xSpeed = 0;
ySpeed = 0;

//state variables
canCrouch = false;
canJump = false;
crouching = false;

//Jumping
grav = 2;
termVel = 8; //cap on falling speed
jumpSpeed = -10;
jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames = 10;
onGround = true;
depth = -2000
	//coyote time
	//adding delay before player falls off ground (hang)
	//also adding buffer where player can jump when off the ground (jump)
	coyoteHangFrames = 2;
	coyoteHangTimer = 0;
	coyoteJumpFrames = 5;
	coyoteJumpTimer = 0;

coolPoints = 0;
pressed = false;




































































































