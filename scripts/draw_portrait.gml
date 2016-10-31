///draw_portrait(sprite, subimg, x, y, size, color, background, outline)
var image = argument0, index = argument1, 
    xx = argument2, yy = argument3, size = argument4, 
    color = argument5, background = argument6, outline = argument7;
    
if (!sprite_exists(image))
    return -1;

var scale = size / sprite_get_width(image);

// highlights
if (background)
    draw_rectangle_colour(xx, yy, xx + size, yy + size, c_black, c_black, c_black, c_black, false);
if (outline)
    draw_rectangle_colour(xx, yy, xx + size, yy + size, color, color, color, color, true);

// get offset for image that have a origin set
// add center point for images that have a scale
var xo = sprite_get_xoffset(image) * scale /*+ (size - sprite_get_width(image)) / 2*/;
var yo = sprite_get_yoffset(image) * scale /*+ (size - sprite_get_height(image)) / 2*/;
draw_sprite_ext(image, index, xx + xo, yy + yo, scale, scale, 0, color, 0.75);

// reference stuffz
//draw_rectangle_colour(xx, yy, xx + size, yy + size, c_white, c_white, c_white, c_white, 0.75);
//draw_text_colour(xx, yy + 16, string(xo) + "," + string(yo), c_white, c_white, c_white, c_white, 0.75);







