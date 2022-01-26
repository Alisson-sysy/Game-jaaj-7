// Criar camada de colisão
image_xscale = 3
image_yscale = 3
instance_create_layer(x, y + 10, "Hitboxes", objEnemyHitbox);
objEnemyHitbox.image_xscale = 4;
objEnemyHitbox.image_yscale = 6;

state = hermesStateFree;
eventMoment = 0;

// Arrow Rain
summonArrow = 0;
warningDelay = 60;
target = [];