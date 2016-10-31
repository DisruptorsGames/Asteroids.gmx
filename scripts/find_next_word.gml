///find_next_word(text, word)
var text = argument0, word = argument1, 
    result = "", list = string_split(text, " ");

for (var i = 0; i < ds_list_size(list); i++)
{
    var next = list[| i + 1];
    if (list[| i] == word && !is_undefined(next))
    {
        result = string(next);
        break;
    }
}

// cleanup
ds_list_destroy(list);

return result;
