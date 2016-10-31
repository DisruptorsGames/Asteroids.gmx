///set(value, default, isreal)
var value = argument0, def = argument1, isreal = argument2;
if (is_undefined(value))
    return def;
else
    return ternary(isreal, real(value), value);
