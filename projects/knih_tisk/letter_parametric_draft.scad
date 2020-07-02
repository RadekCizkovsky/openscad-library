
piece_x = 10;
piece_y = 15;
piece_z = 5;

legs_z = 3;

letter_y =10;

letter_size = 10;
letter_height = 1;
letter_font = "Calibri";

letter = "a";

letter_rotated = false;





difference()
{
    cube([piece_x,piece_y,piece_z]);
    translate([0,0,piece_z - legs_z]) cube([piece_x,(piece_y - letter_y)*0.5,legs_z]);
    translate([0,piece_y - (piece_y - letter_y)*0.5,piece_z - legs_z]) cube([piece_x,(piece_y - letter_y)*0.5,legs_z]);
}


if(letter_rotated)
{
    translate([0,0,letter_height])
    rotate([0,180,0])
    {
        linear_extrude(letter_height)
        {
            text(letter, font = letter_font, size = letter_size, halign = "center", valign = "baseline");
        }
    }
}
else
{
    linear_extrude(letter_height)
    {
        text(letter, font = letter_font, size = letter_size, halign = "center", valign = "baseline");
    }
}