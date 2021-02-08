module extrusion(sidelen, 
                 height, 
                 notch, 
                 thickness, 
                 center_diameter,
                 center_sidelen, 
                 long_base, 
                 center=false) {
    short_base = long_base - (sidelen - center_sidelen - thickness * 2);

    module constructor() {
        difference() {        
            polyhedron(
                points=[
                    // 0
                    [0, 0, 0],

                    // 1
                    [(sidelen - notch) / 2, 0, 0], 
                    // 2
                    [(sidelen - notch) / 2, thickness, 0], 
                    // 3
                    [(sidelen - long_base) / 2, thickness, 0], 
                    // 4
                    [(sidelen - short_base) / 2, (sidelen - center_sidelen) / 2, 0],

                    // 5
                    [sidelen - (sidelen - short_base) / 2, (sidelen - center_sidelen) / 2, 0],
                    // 6
                    [sidelen - (sidelen - long_base) / 2, thickness, 0],
                    // 7
                    [sidelen - (sidelen - notch) / 2, thickness, 0],
                    // 8
                    [sidelen - (sidelen - notch) / 2, 0, 0],

                    // 9
                    [sidelen, 0, 0],

                    // 10
                    [sidelen, (sidelen - notch) / 2, 0],
                    // 11
                    [sidelen - thickness, (sidelen - notch) / 2, 0],
                    // 12
                    [sidelen - thickness, (sidelen - long_base) / 2, 0],
                    // 13
                    [sidelen - (sidelen - center_sidelen) / 2, (sidelen - short_base) / 2, 0],

                    // 14
                    [sidelen - (sidelen - center_sidelen) / 2, sidelen - (sidelen - short_base) / 2, 0],
                    // 15
                    [sidelen - thickness, sidelen - (sidelen - long_base) / 2, 0],
                    // 16
                    [sidelen - thickness, sidelen - (sidelen - notch) / 2, 0],
                    // 17
                    [sidelen, sidelen - (sidelen - notch) / 2, 0],

                    // 18
                    [sidelen, sidelen, 0],

                    // 19
                    [sidelen - (sidelen - notch) / 2, sidelen, 0],
                    // 20
                    [sidelen - (sidelen - notch) / 2, sidelen - thickness, 0],
                    // 21
                    [sidelen - (sidelen - long_base) / 2, sidelen - thickness, 0],
                    // 22
                    [sidelen - (sidelen - short_base) / 2, sidelen - (sidelen - center_sidelen) / 2, 0],

                    // 23
                    [(sidelen - short_base) / 2, sidelen - (sidelen - center_sidelen) / 2, 0],
                    // 24
                    [(sidelen - long_base) / 2, sidelen - thickness, 0],
                    // 25
                    [(sidelen - notch) / 2, sidelen - thickness, 0],
                    // 26
                    [(sidelen - notch) / 2, sidelen, 0],

                    // 27
                    [0, sidelen, 0],

                    // 28
                    [0, sidelen - (sidelen - notch) / 2, 0],
                    // 29
                    [thickness, sidelen - (sidelen - notch) / 2, 0],
                    // 30
                    [thickness, sidelen - (sidelen - long_base) / 2, 0],
                    // 31
                    [(sidelen - center_sidelen) / 2, sidelen - (sidelen - short_base) / 2, 0],

                    // 32
                    [(sidelen - center_sidelen) / 2, (sidelen - short_base) / 2, 0],
                    // 33
                    [thickness, (sidelen - long_base) / 2, 0],
                    // 34
                    [thickness, (sidelen - notch) / 2, 0],
                    // 35
                    [0, (sidelen - notch) / 2, 0],



                    // 36
                    [0, 0, height], 

                    // 37
                    [(sidelen - notch) / 2, 0, height],
                    // 38
                    [(sidelen - notch) / 2, thickness, height],
                    // 39
                    [(sidelen - long_base) / 2, thickness, height],
                    // 40
                    [(sidelen - short_base) / 2, (sidelen - center_sidelen) / 2, height],

                    // 41
                    [sidelen - (sidelen - short_base) / 2, (sidelen - center_sidelen) / 2, height],
                    // 42
                    [sidelen - (sidelen - long_base) / 2, thickness, height],
                    // 43
                    [sidelen - (sidelen - notch) / 2, thickness, height],
                    // 44
                    [sidelen - (sidelen - notch) / 2, 0, height],

                    // 45
                    [sidelen, 0, height],

                    // 46
                    [sidelen, (sidelen - notch) / 2, height],
                    // 47
                    [sidelen - thickness, (sidelen - notch) / 2, height],
                    // 48
                    [sidelen - thickness, (sidelen - long_base) / 2, height],
                    // 49
                    [sidelen - (sidelen - center_sidelen) / 2, (sidelen - short_base) / 2, height],

                    // 50
                    [sidelen - (sidelen - center_sidelen) / 2, sidelen - (sidelen - short_base) / 2, height],
                    // 51
                    [sidelen - thickness, sidelen - (sidelen - long_base) / 2, height],
                    // 52
                    [sidelen - thickness, sidelen - (sidelen - notch) / 2, height],
                    // 53
                    [sidelen, sidelen - (sidelen - notch) / 2, height],

                    // 54
                    [sidelen, sidelen, height],

                    // 55
                    [sidelen - (sidelen - notch) / 2, sidelen, height],
                    // 56
                    [sidelen - (sidelen - notch) / 2, sidelen - thickness, height],
                    // 57
                    [sidelen - (sidelen - long_base) / 2, sidelen - thickness, height],
                    // 58
                    [sidelen - (sidelen - short_base) / 2, sidelen - (sidelen - center_sidelen) / 2, height],

                    // 59            translate([posx, posy, 0]) {
                    [(sidelen - short_base) / 2, sidelen - (sidelen - center_sidelen) / 2, height],
                    // 60
                    [(sidelen - long_base) / 2, sidelen - thickness, height],
                    // 61
                    [(sidelen - notch) / 2, sidelen - thickness, height],
                    // 62
                    [(sidelen - notch) / 2, sidelen, height],

                    // 63
                    [0, sidelen, height],

                    // 64
                    [0, sidelen - (sidelen - notch) / 2, height],
                    // 65
                    [thickness, sidelen - (sidelen - notch) / 2, height],
                    // 66
                    [thickness, sidelen - (sidelen - long_base) / 2, height],
                    // 67
                    [(sidelen - center_sidelen) / 2, sidelen - (sidelen - short_base) / 2, height],

                    // 68
                    [(sidelen - center_sidelen) / 2, (sidelen - short_base) / 2, height],
                    // 69
                    [thickness, (sidelen - long_base) / 2, height],
                    // 70
                    [thickness, (sidelen - notch) / 2, height],
                    // 71
                    [0, (sidelen - notch) / 2, height],
                ],
                faces = [
                    [68, 69, 33, 32],
                    [69, 70, 34, 33],
                    [70, 71, 35, 34],
                    [71, 36, 0, 35],
                    [36, 37, 1, 0],
                    [37, 38, 2, 1],
                    [38, 39, 3, 2],
                    [39, 40, 4, 3],

                    [40, 41, 5, 4],

                    [41, 42, 6, 5],
                    [42, 43, 7, 6],
                    [43, 44, 8, 7],
                    [44, 45, 9, 8],
                    [45, 46, 10, 9],
                    [46, 47, 11, 10],
                    [47, 48, 12, 11],
                    [48, 49, 13, 12],

                    [49, 50, 14, 13],

                    [50, 51, 15, 14],
                    [51, 52, 16, 15],
                    [52, 53, 17, 16],
                    [53, 54, 18, 17],
                    [54, 55, 19, 18],
                    [55, 56, 20, 19],
                    [56, 57, 21, 20],
                    [57, 58, 22, 21],

                    [58, 59, 23, 22],

                    [59, 60, 24, 23],
                    [60, 61, 25, 24],
                    [61, 62, 26, 25],
                    [62, 63, 27, 26],
                    [63, 64, 28, 27],
                    [64, 65, 29, 28],
                    [65, 66, 30, 29],
                    [66, 67, 31, 30],

                    [67, 68, 32, 31],

                    [0, 1, 2, 3, 4, 5, 6, 7, 8, 
                    9, 10, 11, 12, 13, 14, 15, 16, 17, 
                    18, 19, 20, 21, 22, 23, 24, 25, 26, 
                    27, 28, 29, 30, 31, 32, 33, 34, 35],

                    [71, 70, 69, 68, 67, 66, 65, 64, 63, 
                    62, 61, 60, 59, 58, 57, 56, 55, 54,
                    53, 52, 51, 50, 49, 48, 47, 46, 45,
                    44, 43, 42, 41, 40, 39, 38, 37, 36],
                ]
            );
            translate([sidelen / 2, sidelen / 2, height / 2]) {
                cylinder(height, d=center_diameter, center=true);
            }
        }
    }

    if (center) {
        translate([-sidelen / 2, -sidelen / 2, -height / 2]) {
            constructor();
        }
    } else {
        constructor();
    }      
}

module extrusion45cut(
    sidelen,
    height,
    notch,
    thickness,
    center_diameter,
    center_sidelen,
    long_base,
    center=false) {
    module prism(sidelen, height, sidelen_offset=0, height_offset=0) {
        polyhedron(
            points=[
                // 0
                [sidelen_offset, sidelen_offset, 
                height + height_offset],
                // 1
                [sidelen + sidelen_offset, sidelen_offset, 
                height + height_offset],
                // 2
                [sidelen + sidelen_offset, sidelen + sidelen_offset, 
                height + height_offset],
                // 3
                [sidelen_offset, sidelen + sidelen_offset, 
                height + height_offset],
                // 4 
                [sidelen + sidelen_offset, sidelen + sidelen_offset, 
                height + height_offset - sidelen],
                // 5
                [sidelen_offset, sidelen + sidelen_offset, 
                height + height_offset - sidelen],
            ],
            faces=[
                [3, 2, 1, 0],
                [2, 3, 5, 4],
                [4, 5, 0, 1],
                [3, 0, 5],
                [1, 2, 4],
            ]
        );
    }
    difference() {
        extrusion(
            sidelen, 
            height,
            notch, 
            thickness, 
            center_diameter,
            center_sidelen,
            long_base,
            center);

        if (center) {
            prism(sidelen, height, -sidelen / 2, -height / 2);
        } else {
            prism(sidelen, height);
        }
    }
}

// extrusion(sidelen=20, 
//           height=10, 
//           notch=6.2, 
//           thickness=1.5, 
//           center_diameter=6.0, 
//           center_sidelen=10,
//           long_base=14,
//           center=true);

// extrusion45cut(sidelen=20, 
//           height=40, 
//           notch=6.2, 
//           thickness=1.5, 
//           center_diameter=6.0, 
//           center_sidelen=10,
//           long_base=14,
//           center=true);
