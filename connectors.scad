module tslide(length,
              width,
              height,
              top_length,
              top_width,
              top_height,
              bottom_width,
              slope_height,
              screw_diameter,
              center=false) {
    module base() {
        union() {
            polyhedron(
                points=[
                    // 0
                    [0, width - (width - bottom_width) / 2, 0],
                    // 1
                    [length, width - (width - bottom_width) / 2, 0],
                    // 2
                    [length, (width - bottom_width) / 2, 0],
                    // 3
                    [0, (width - bottom_width) / 2, 0],
                    
                    // 4
                    [0, width, slope_height],
                    // 5
                    [length, width, slope_height],
                    // 6
                    [length, 0, slope_height],
                    // 7
                    [0, 0, slope_height],
                    
                    // 8
                    [0, width, height - top_height],
                    // 9
                    [length, width, height - top_height],
                    // 10
                    [length, 0, height - top_height],
                    // 11
                    [0, 0, height - top_height],

                    
                ],
                faces=[
                    [3, 2, 1, 0],
                    [8, 9, 10, 11],
                    
                    [0, 4, 8, 11, 7, 3],
                    [2, 6, 10, 9, 5, 1],
                    
                    [1, 5, 4, 0],
                    [3, 7, 6, 2],
                    
                    [5, 9, 8, 4],
                    [7, 11, 10, 6],
                ]
            );
            polyhedron(
                points=[
                    // 0
                    [(length - top_length) / 2, width - (width - top_width) / 2, height - top_height],
                    // 1
                    [length - (length - top_length) / 2, width - (width - top_width) / 2, height - top_height],
                    // 2
                    [length - (length - top_length) / 2, (width - top_width) / 2, height - top_height],
                    // 3
                    [(length - top_length) / 2, (width - top_width) / 2, height - top_height],

                    // 4
                    [(length - top_length) / 2, width - (width - top_width) / 2, height],
                    // 5
                    [length - (length - top_length) / 2, width - (width - top_width) / 2, height],
                    // 6
                    [length - (length - top_length) / 2, (width - top_width) / 2, height],
                    // 7
                    [(length - top_length) / 2, (width - top_width) / 2, height],
                ],
                faces=[
                    [3, 2, 1, 0],
                    [4, 5, 6, 7],
                    [7, 6, 2, 3],
                    [5, 4, 0, 1],
                    [4, 7, 3, 0],
                    [6, 5, 1, 2],
                ]
            );
        }
    }
    difference() {
        if (center) {
            translate([-length / 2, -width / 2, -height / 2]) { 
                base();
            }
        } else {
            base();
        }
        if (center) {
            cylinder(h=height, d=screw_diameter, center=true);
        } else {
            translate([length / 2, width / 2, 0]) {
                cylinder(h=height, d=screw_diameter);
            }
        }
    }
}

// example:
// tslide(length=110,
//        width=102,
//        height=50,
//        top_length=110,
//        top_width=60,
//        top_height=10,
//        bottom_width=70,
//        slope_height=15,
//        screw_diameter=30,
//        center=false);
