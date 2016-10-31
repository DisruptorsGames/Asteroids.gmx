///chat_log_ext(list, word, item, amount, text)
var list = argument0, word = argument1, 
    item = argument2, amount = argument3, 
    text = argument4;

// don't log anything if no word or list exists
if (is_undefined(word) || !ds_exists(list, ds_type_list))
    return 0;

// add color and amount to item log
if (!is_undefined(item))
{
    var value = colour_get_value(item[element.color]);
    text = string(value) + "x" + string(amount);
}

ds_list_add(list, ternary(string_length(text) > 0, word + "->" + text, word));
