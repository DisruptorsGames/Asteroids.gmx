///element_add(list, key, amount, new)
var list = argument0, key = argument1, amount = argument2, new = argument3,
    color = merge_colour(make_colour_elm(), key, random(0.75) + 0.25);

if (amount == -1)
    amount = round(irandom_range(10, 100) / 10) * 10;
    
ds_list_add(list, element_create(color, amount, new));
