use <../libs/gridfinity-openscad/gridfinity_cup_with_walls.scad>;
use <../libs/gridfinity-openscad/rounded_square.scad>;

ep = 0.001;

module breadboard()
{
    width = 54;
    length = 165;
    height = 9.5;

    translate([ -width / 2, -length / 2, 0 ])
    {
        cube([ width, length, height ]);
        translate([ width - ep, 14, 0 ]) notch();
        translate([ width - ep, 80.6, 0 ]) notch();
        translate([ width - ep, 147.6, 0 ]) notch();
    }

    module notch()
    {
        notch_width = 1.5;
        notch_length = 3.4;
        notch_height = height;
        cube([ notch_width, notch_length, notch_height ]);
    }
}

difference()
{
    gridfinity_cup_with_walls(rows = 2, columns = 4, layers = 3, floor_extra_height = 9);
    minkowski()
    {
        translate([ 0, 0, -19 ]) breadboard();
        cube([ 1, 1, ep ], center = true);
    }
}
