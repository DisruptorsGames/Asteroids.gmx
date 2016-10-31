///json(key, value)
var key = argument0, value = string(argument1);
value = string_replace_all(value, "\", "\\");
return "'" + key + "':'" + value + "'";
