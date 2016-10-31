///element_dec(list, color, amount)
var list = argument0, color = argument1, amount = argument2,
    item = find_item(list, color), index = find_item_index(list, color);

if (!is_undefined(item))
{
    item[element.amount] -= amount;
    ds_list_replace(list, index, item);
    
    if (item[element.amount] == 0)
    {
        ds_list_delete(list, index);
        /*var next = element_next(index, ds_list_size(list));
        item = list[| next];*/
        if (!is_undefined(list[| index]))
            item = list[| index];
    }
}

return item;
