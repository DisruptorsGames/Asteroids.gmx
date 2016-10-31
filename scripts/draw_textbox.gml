///draw_textbox(x, y, string, color, back_color, font, background, outline)
var xx = argument0, yy = argument1,
    str = argument2, color = argument3, back_color = argument4,
    font = argument5, background = argument6, outline = argument7;
    
if (string_length(str) == 0)
    return 0;
    
// base the size on length and font
var width = string_length(str) * font_get_size(font),
    height = font_get_size(font) * 1.5;

if (background)
    draw_rectangle_colour(xx, yy, xx + width, yy + height, back_color, back_color, back_color, back_color, false);

if (outline)
    draw_rectangle_colour(xx, yy, xx + width, yy + height, color, color, color, color, true);
    
draw_set_font(font);
draw_text_colour(xx, yy, str, color, color, color, color, 1);
draw_set_font(-1);
