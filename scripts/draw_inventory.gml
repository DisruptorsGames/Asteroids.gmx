///draw_inventory(item, i, x, y, size, columns, background, is_selected)
var item = argument0, i = argument1, xx = argument2, yy = argument3, 
    size = argument4, columns = argument5, background = argument6, 
    is_selected = argument7;

// local variables
var indicator = "^";
var index = 1;
if (item[element.new])
    //index = 3;
    indicator = "`";
else if (within(o_ship.image_blend, item[element.color]) <= 20)
    //index = 2;
    indicator = "*";

var color = ternary(is_selected, 
    make_colour_dpk(item[element.color], 0.25, 0.75), 
    item[element.color]);
    
// pad, only show 7 items, offset each
var ix = xx + i mod columns * (size + 8),
    iy = yy + floor(i / columns) * (size + 8);
// draw image
draw_portrait(s_element, 0, ix, iy, size, color, background, is_selected);
//draw_circle_colour(ix, iy, 2, c_red, c_red, false); < debug
// x:center text, y:center text and pad
draw_set_font(f_menu);
// center text x y
var col = ternary(is_selected, color, c_black);
draw_text_colour(
    ix + (size - string_width(indicator)) / 2,
    iy + (size - string_height(indicator)) / 2 + 6, 
    indicator, col, col, col, col, 0.75);
draw_set_font(-1);
