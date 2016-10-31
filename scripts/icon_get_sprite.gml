///icon_get_sprite(part)
if (room != r_space)
    return -1;

switch(argument0)
{
    case "engine":
        return s_icon_engine;
        break;
    case "shield":
        return s_icon_shield;
        break;
    case "laser":
        return s_icon_cannon;
        break;
    case "radar":
        return s_icon_radar;
        break;
    case "catalog":
        return s_icon_compass;
        break;
    case "cloaking":
        return s_icon_cloaking;
        break;
}

