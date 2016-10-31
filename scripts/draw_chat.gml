///draw_chat(x, y, list, color, lines)
var xx = argument0, yy = argument1, list = argument2, 
    color = argument3, lines = argument4;

var count = min(lines, ds_list_size(list));
for (var i = 0; i < count; i++) 
{
   var index = ds_list_size(list) - 1 - i;
   var val = list[| index];
   draw_text_colour(xx, yy + string_height(val) * i, val, color, color, color, color, 1);
}
