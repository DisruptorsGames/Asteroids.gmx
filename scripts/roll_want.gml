//roll_want(color, amount)
var color = argument0, amount = argument1;

acceptance += round(o_ship.reputation / 10);
acceptance += ternary(is_undefined(sales[? o_ship.id]), 0, round(real(sales[? o_ship.id]) / 10));
acceptance += ternary(within(image_blend, color) <= 10, 5, 0);
acceptance += ternary(within(image_blend, color) <= 20, 2.5, 0);
acceptance += ternary(within(image_blend, color) <= 50, 2.5, 0);
acceptance += ternary(amount > 10, round(amount / 10), 0);

// lucky
acceptance += ternary(irandom(100) < 25, 5, 0);

return acceptance > 10;
