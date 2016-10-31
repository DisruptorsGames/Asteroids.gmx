///entity_create({name:, key size:, encoded:, range:, target:, icon:, banned:, pc:, color:, subimg:, xscale:, yscale:})
var JSON = argument0, entity = json_decode(JSON);

// bad json, return nothing
if (entity == -1)
{
    show_debug_message("Invalid JSON from entity_create" + ":" + JSON);
    return -1;
}

// arguments
name = set(entity[? "name"], base64_encode(string(id)), false);
key = generate_key(set(entity[? "key"], 3, true));
encoded = set(entity[? "encoded"], true, false);
range = set(entity[? "range"], sprite_width, true);
target = set(entity[? "target"], noone, true);
icon = set(entity[? "icon"], -1, true);
banned = set(entity[? "banned"], false, false);
pc = set(entity[? "pc"], false, false);
image_blend = set(entity[? "color"], make_colour_elm(), true);
image_single = set(entity[? "subimg"], irandom(image_number - 1), true);
image_xscale = set(entity[? "xscale"], 1, true);
image_yscale = set(entity[? "yscale"], 1, true);

// hard coded
in_words = ds_list_create();
out_words = ds_list_create();
port_single = irandom(sprite_get_number(icon) - 1);
make_colour_shades(image_blend);

// cleanup
ds_map_destroy(entity);
