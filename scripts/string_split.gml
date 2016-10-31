///string_split(text, separator)
var text = argument0, separator = argument1;

var words = ds_list_create();

var saved = "";
for (var i = 1; i <= string_length(text); i++)
{
    var char = string_char_at(text, i);
    if (char != separator)
        saved += char;
    else
    {
        ds_list_add(words, saved);
        saved = "";
    }
}
ds_list_add(words, saved);

return words;
