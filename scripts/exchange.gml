///exchange(color, amount, from, to)
var color = argument0, amount = argument1, 
    from = argument2, to = argument3;

// ToDo: Fix issue with item transfering incorrectly
    
element_dec(from, color, amount);
element_inc(to, color, amount);
