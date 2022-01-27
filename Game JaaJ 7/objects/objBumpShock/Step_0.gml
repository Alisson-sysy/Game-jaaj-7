image_yscale = hSpeed;
image_xscale = facing * image_yscale;

hitbox.ys = image_yscale * 2.7;

if (x < 0 or x > 672) instance_destroy(self);

hSpeed += hAcc;
x += hSpeed * facing;