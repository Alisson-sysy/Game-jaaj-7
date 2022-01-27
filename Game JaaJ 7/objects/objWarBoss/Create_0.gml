// Criar camada de colisão
image_xscale = 3
image_yscale = 3

// Posição inicial
y = 245;

with (instance_create_layer(x, y + 10, "Hitboxes", objEnemyHitbox)) {
	follow = other;
}

with (instance_create_layer(x, y + 10, "Hitboxes", objEnemyHit)) {
	follow = other;
	isPersistent = true;
	destroyOnWall = false;
	destroyTime = 1000;
	xs = 3.5;
	ys = 5;
}


//instance_create_layer(x, y + 10, "Hitboxes", objEnemyHitbox);
objEnemyHitbox.image_xscale = 4;
objEnemyHitbox.image_yscale = 6;

state = hermesStateFree;
eventMoment = 0;

// Parametros
totalLife = 3000
maxLife = 3000;

// Arrow Rain
summonArrow = 0;
warningDelay = 60;
target = [];

// Spin
spinDuration = 75;
spinMaxDuration = 75;

// Bump
jumpDelay = 20;
dropSpeed = 0;

// Repos
xTarget = 0;