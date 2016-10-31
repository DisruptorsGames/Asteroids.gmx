///find_item(list, color)
var list = argument0, color = argument1;

if (!ds_exists(list, ds_type_list))
    return undefined;

// loop through inventory and find a specific item 
// based on the given range
for (var i = 0; i < ds_list_size(list); i++)
{
    var item = list[| i];
    if (item[element.color] == color)
        return item;
}

return undefined;
