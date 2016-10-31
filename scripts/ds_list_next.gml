///ds_list_next(index, size)
var index = argument0, size = argument1;

// move forward
index += ternary(keyboard_check(o_ship.modifier), -1, 1);
// loop back to front / front to back
if (index > size)
    index = 0;
else if (index < -1)
    index = size - 1;

return index;
