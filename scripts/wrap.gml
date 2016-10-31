///wrap()

// wrap x
if (phy_position_x < 0) 
    phy_position_x += room_width;
if (phy_position_x > room_width) 
    phy_position_x -= room_width;
// wrap y
if (phy_position_y < 0) 
    phy_position_y += room_height;
if (phy_position_y > room_height) 
    phy_position_y -= room_height;

