///generate_key(size)
var key = "";
for(var i = 0; i < argument0; i++)
{
    var c = "#";
    while (c == "#")
    {
        c = chr(irandom(93) + 33);
    }
    key += c;
}
return key;
