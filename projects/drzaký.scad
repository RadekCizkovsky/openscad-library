radius = 5;
width = 10;
weight = 0.5;

holder_weight = 1;
holder_round = 1;
holder_lenght = 10;
holder_hole_radius = 2;


difference()
{
    translate([0,0,0])
    {
        rotate(a = [90,0,0])
        {
            difference(){
                cylinder(r = radius + weight, h = width);
                cylinder(r = radius , h = width); 
            }
        }
        translate([radius + holder_lenght,0,0])
        {
            difference()
            {
                rotate([0,0,180])
                {
                  holder(width, holder_weight, holder_lenght, holder_round, holder_hole_radius);
//                rounded_cube([holder_lenght,width,holder_weight], holder_round,true,false,false,true);
//                translate([2.5,2.5,0])
//                {
//                    cylinder(r=holder_hole_radius,h=holder_weight, $fn=20);
//                }
                }
            }
        }
        translate([-radius - holder_lenght,-width,0])
        {
            difference()
            {
                holder(width, holder_weight, holder_lenght, holder_round, holder_hole_radius);
//                rounded_cube([holder_lenght,width,holder_weight], holder_round,false,true,true,false);
//                translate([2.5,2.5,0])
//                {
//                    cylinder(r=holder_hole_radius,h=holder_weight, $fn=20);
//                }
            }
        }
    }
   
    surface(100,100);
}



////surface(200,200);

module holder(h_width, h_weight, h_length, h_radius, h_hole)
{
    difference()
    {
        rounded_cube([h_length,h_width,h_weight], h_radius,false,true,true,false);
        translate([h_length * 0.5,h_width * 0.5,0])
        {
            cylinder(r=h_hole,h=h_weight, $fn=20);
        }
    }
}

module rounded_cube(cube_dimensions, radius,tr = true,br = true,bl = true,tl = true)
{
    difference()
    {
        cube(cube_dimensions);
        if(tr == true)
        {
            translate([cube_dimensions[0] - radius,radius,0])
            {
                rotate([0,0,270])
                {
                    corner(radius,cube_dimensions[2]);
                }
            }   
        }
        if(br == true)
        {
            translate([radius,radius,0])
            {
                rotate([0,0,180])
                {
                    corner(radius,cube_dimensions[2]);
                }
            }
        }
        if(bl == true)
        {
            translate([radius,cube_dimensions[1] - radius,0])
            {
                rotate([0,0,90])
                {
                    corner(radius,cube_dimensions[2]);
                }
            }
        }
        if(tl == true)
        {
            translate([cube_dimensions[0]- radius,cube_dimensions[1] - radius,0])
            {
                rotate([0,0,0])
                {
                    corner(radius,cube_dimensions[2]);
                }
            }
        }             
    }
}

module corner(r,h)
{
    difference()
    {
        color("red") cube([r,r,h]);
        cylinder(r=r, h=h, $fn=20);
    }
}

module surface(axe_x, axe_y)
{
    surface_height = 100;
    translate([-(axe_x*0.5),-(axe_y*0.5),-surface_height])
    {
        color("red")
        {
            cube([axe_x,axe_y,surface_height]);
        }
    }
}