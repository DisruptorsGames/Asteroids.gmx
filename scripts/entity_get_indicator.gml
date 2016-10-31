///entity_get_indicator(object_index)
var indicator = undefined;
switch(argument0)
{
    case o_space_station:
        indicator = "@";
        break;
    case o_blackhole:
        indicator = "0";
        break;
    case o_marker:
        indicator = "x";
        break;
    case o_element:
        indicator = "$";
        break;
    case o_asteroid_l:
    case o_asteroid_m:
    case o_asteroid_s:
        indicator = "*";
        break;
}
return indicator;
