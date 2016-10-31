///starmap() generate starmap surface
var surf = surface_create(view_wview[0], view_hview[0]);
surface_set_target(surf);
for(var i = 0; i < view_wview[0]; i++) 
{
    for(var j = 0; j < view_hview[0]; j++) 
    {
        var r = random(100);
        if (r < 0.05)
        {
            var r = irandom(255),
                c = merge_colour(c_white, make_colour_rgb(r, r, r), random(1));
            draw_circle_colour(i, j, random(2) + 0.5, c, c, false);
        }
    }
}
surface_reset_target();
return surf;

// ToDo: Add a shader to twinkle stars
