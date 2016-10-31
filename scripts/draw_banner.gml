///draw_banner(title, message, background, foreground, size)
var title = argument0, message = argument1, 
    background = argument2, foreground = argument3, 
    size = argument4;

var xcenter = vw / 2, ycenter = vh / 2,
    offset = font_get_size(f_title) + font_get_size(f_title) / 2,
    iy = ycenter - offset;
    
draw_rectangle_colour(0, ycenter - size, vw, ycenter + size, background, background, background, background, false);
draw_rectangle_colour(0, ycenter - size, vw, ycenter + size, foreground, foreground, foreground, foreground, true);

draw_set_font(f_title);
draw_text_colour((vw - string_width(title)) / 2, iy, title, foreground, foreground, c_gray, c_gray, 1);
draw_set_font(f_menu);
draw_text_colour((vw - string_width(message)) / 2, iy + offset, message, c_gray, c_gray, foreground, foreground, 1);
draw_set_font(-1);

/*draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var text = title + "#" + message;
draw_text_colour(xcenter, ycenter, text, foreground, foreground, foreground, foreground, 1);
draw_set_valign(-1);
draw_set_halign(-1);*/
