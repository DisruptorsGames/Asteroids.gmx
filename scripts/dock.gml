///dock(target, docked)
var target = argument0, docked = argument1;
if (instance_exists(o_ship))
{
    o_ship.target = target;
    o_ship.docked = docked;
    o_ship.selected = undefined;
}
