///instance_spawn(x, y, obj, kick)
var xx = argument0, yy = argument1, obj = argument2, kick = argument3,
    w = sprite_width * 2, h = sprite_height * 2, inst = noone;

if (collision_rectangle(xx - w, yy - h, xx + w, yy + h, all, false, true) == noone)
    inst = instance_create(xx, yy, obj);

if (kick)
{
    with (inst)
    {
        physics_apply_local_impulse(0, 0, random(sprite_width * 6), random(sprite_height * 6));
    }
}
return inst;
    

