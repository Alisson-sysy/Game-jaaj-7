vSpeed += grvSpeed;

image_angle += rotSpeed;
x += hSpeed;
y += vSpeed;

if (y > 400) instance_destroy(self);