///find_item(list, find, range)
var list = argument0, find = argument1, range = argument2;

if (!ds_exists(list, ds_type_list))
    return undefined;

// loop through inventory and find a specific item 
// based on the given range
for (var i = 0; i < ds_list_size(list); i++)
{
    var item = list[| i];
    if (within(item[element.color], find) <= range)
        return item;
}

return undefined;
