// Estado
state = playerStateFree;
onGround = true;
facing = 1;
wallGrab = false;

// Variáveis
// Movimentação Horizontal
hSpeed = 0;
maxSpeed = 2.5;
hAcceleration = 0.4;

// Movimentação Vertical
vSpeed = 0;
maxVSpeed = 5;
vGravity = 0.2;

// Pulos
jumps = 2;

// Dash
dashDuration = 0;
dashMaxDuration = 10;
dashCooldown = 0;

// Wall grab
wallGrabSpeed = 1.5;
wallJumpDelay = 0;
wallJumpFacing = 0;

// Combate
maxLife = 100;
life = 100;
semiLife = 100;

// Recoil Damage
recoil = 30;

// Hit / Combo
damage = 20;
hitStage = 0;
hitWait = 40;