///make_colour_comp(color)  
var color = argument0, 
    h = colour_get_hue(color), 
    s = colour_get_saturation(color),
    v = colour_get_value(color);

return make_colour_hsv(lengthdir_x(s, h + 180), s, v);
