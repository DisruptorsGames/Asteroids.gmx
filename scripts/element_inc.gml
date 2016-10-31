///element_inc(list, color, amount)
var list = argument0, color = argument1, amount = argument2,
    item = find_item(list, color), index = find_item_index(list, color);

// ToDo: fix issue with empty element potentially being added
    
if (is_undefined(item))
    ds_list_add(list, element_create(color, amount, true));
else
{
    item[element.amount] += amount;
    ds_list_replace(list, index, item);
}

return item;
