///make_colour_elm()
var h = irandom_range(0, 255), 
    s = irandom_range(51, 255), 
    v = irandom_range(102, 255);
return make_colour_hsv(h, s, v);

/*
    element < 1323524 (COLOR CODE)
    element -> make_colour_hsv(hue, saturation, value)
        => HUE: 0 - 255
           SAT: 51 - 255
           VAL: 102 - 255
    ******************************
    - 1323524 == 1323524 (EQUAL)
    + value(1323524) = 159 (COLOR VALUE)
        => (100 - 159) = -59 -> 59
            59 < 20 (RANGE)
    + SHIP (range 20) 
        INVENTORY: 
            (^)not usable,
            (*)usable (usable by ship only)
            (`)new item (new to inventory)
    + STATION (range 50)
        => (100 - 159) = -59 -> 59
            59 < 50 (RANGE)
*/
