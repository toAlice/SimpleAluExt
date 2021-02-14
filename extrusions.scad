module extrusion(sidelen, height, notch, border_thickness, arm_thickness,
                 center_diameter, center_sidelen, corner_inner = 0,
                 corner_outer = 0, center = false) {
    long_base = sidelen - border_thickness * 2 - sqrt(2) * arm_thickness;
    short_base = center_sidelen - sqrt(2) * arm_thickness;

    module extru_main() {
        difference() {
            polygon(
                [
                    // 0
                    [ 0, sidelen ],

                    // 1
                    [ (sidelen - notch) / 2, sidelen ],
                    // 2
                    [
                        (sidelen - notch) / 2, sidelen - border_thickness
                    ],
                    // 3
                    [
                        (sidelen - long_base) / 2,
                        sidelen - border_thickness
                    ],
                    // 4
                    [
                        (sidelen - short_base) / 2,
                        sidelen - (sidelen - center_sidelen) / 2
                    ],

                    // 5
                    [
                        sidelen - (sidelen - short_base) / 2,
                        sidelen - (sidelen - center_sidelen) / 2
                    ],
                    // 6
                    [
                        sidelen - (sidelen - long_base) / 2,
                        sidelen - border_thickness
                    ],
                    // 7
                    [
                        sidelen - (sidelen - notch) / 2,
                        sidelen - border_thickness
                    ],
                    // 8
                    [ sidelen - (sidelen - notch) / 2, sidelen ],

                    // 9
                    [ sidelen, sidelen ],

                    // 10
                    [ sidelen, sidelen - (sidelen - notch) / 2 ],
                    // 11
                    [
                        sidelen - border_thickness,
                        sidelen - (sidelen - notch) / 2
                    ],
                    // 12
                    [
                        sidelen - border_thickness,
                        sidelen - (sidelen - long_base) / 2
                    ],
                    // 13
                    [
                        sidelen - (sidelen - center_sidelen) / 2,
                        sidelen - (sidelen - short_base) / 2
                    ],

                    // 14
                    [
                        sidelen - (sidelen - center_sidelen) / 2,
                        (sidelen - short_base) / 2
                    ],
                    // 15
                    [
                        sidelen - border_thickness,
                        (sidelen - long_base) / 2
                    ],
                    // 16
                    [
                        sidelen - border_thickness, (sidelen - notch) / 2
                    ],
                    // 17
                    [ sidelen, (sidelen - notch) / 2 ],

                    // 18
                    [ sidelen, 0 ],

                    // 19
                    [ sidelen - (sidelen - notch) / 2, 0 ],
                    // 20
                    [
                        sidelen - (sidelen - notch) / 2, border_thickness
                    ],
                    // 21
                    [
                        sidelen - (sidelen - long_base) / 2,
                        border_thickness
                    ],
                    // 22
                    [
                        sidelen - (sidelen - short_base) / 2,
                        (sidelen - center_sidelen) / 2
                    ],

                    // 23
                    [
                        (sidelen - short_base) / 2,
                        (sidelen - center_sidelen) / 2
                    ],
                    // 24
                    [ (sidelen - long_base) / 2, border_thickness ],
                    // 25
                    [ (sidelen - notch) / 2, border_thickness ],
                    // 26
                    [ (sidelen - notch) / 2, 0 ],

                    // 27
                    [ 0, 0 ],

                    // 28
                    [ 0, (sidelen - notch) / 2 ],
                    // 29
                    [ border_thickness, (sidelen - notch) / 2 ],
                    // 30
                    [ border_thickness, (sidelen - long_base) / 2 ],
                    // 31
                    [
                        (sidelen - center_sidelen) / 2,
                        (sidelen - short_base) / 2
                    ],

                    // 32
                    [
                        (sidelen - center_sidelen) / 2,
                        sidelen - (sidelen - short_base) / 2 
                    ],
                    // 33
                    [
                        border_thickness,
                        sidelen - (sidelen - long_base) / 2
                    ],
                    // 34
                    [
                        border_thickness, sidelen - (sidelen - notch) / 2
                    ],
                    // 35
                    [ 0, sidelen - (sidelen - notch) / 2 ]
                ]
            );
            translate([ sidelen / 2, sidelen / 2]) {
                circle(d = center_diameter);
            }
        }
    }

    module extru_cornors() {
        difference() {
            union() {
                extru_main();
                if (corner_outer > 0) {
                    translate([ 0, sidelen - corner_outer ]) {
                        square(corner_outer);
                    }
                    translate([ 0, sidelen - corner_outer ]) {
                        square(corner_outer);                    
                    }
                    translate(
                        [ sidelen - corner_outer, sidelen - corner_outer ]) {
                        square(corner_outer);                    
                    }
                    translate([ sidelen - corner_outer, 0 ]) {
                        square(corner_outer);                    
                    }
                }
            }
            if (corner_inner > 0) {
                translate([
                    (corner_outer - corner_inner) / 2,
                    (corner_outer - corner_inner) / 2
                ]) {
                    // cube([ corner_inner, corner_inner, height ]);
                    square(corner_inner);
                }
                translate([
                    (corner_outer - corner_inner) / 2,
                    sidelen - (corner_outer - corner_inner) / 2 - corner_inner
                ]) {
                    // cube([ corner_inner, corner_inner, height ]);
                    square(corner_inner);
                }
                translate([
                    sidelen - (corner_outer - corner_inner) / 2 - corner_inner,
                    sidelen - (corner_outer - corner_inner) / 2 - corner_inner
                ]) {
                    // cube([ corner_inner, corner_inner, height ]);
                    square(corner_inner);
                }
                translate([
                    sidelen - (corner_outer - corner_inner) / 2 - corner_inner,
                    (corner_outer - corner_inner) / 2
                ]) {
                    // cube([ corner_inner, corner_inner, height ]);
                    square(corner_inner);
                }
            }
        }
    }

    if (center) {
        translate([ -sidelen / 2, -sidelen / 2, -height / 2 ]) {
            linear_extrude(height=height) {
                extru_cornors();
            }
        }
    } else {
        linear_extrude(height=height) {
            extru_cornors();
        }
    }
}

module extrusion45cut(sidelen, notch, border_thickness, arm_thickness,
                      center_diameter, center_sidelen, corner_inner = 0,
                      corner_outer = 0, center = false) {
    module prism(offset = 0) {
        polyhedron(
            points =
                [
                    // 0
                    [ offset, offset, sidelen + offset ],
                    // 1
                    [ sidelen + offset, offset, sidelen + offset ],
                    // 2
                    [ sidelen + offset, sidelen + offset, sidelen + offset ],
                    // 3
                    [ offset, sidelen + offset, sidelen + offset ],
                    // 4
                    [
                        sidelen + offset, sidelen + offset, sidelen + offset -
                        sidelen
                    ],
                    // 5
                    [ offset, sidelen + offset, sidelen + offset - sidelen ],
                ],
            faces = [
                [ 3, 2, 1, 0 ],
                [ 2, 3, 5, 4 ],
                [ 4, 5, 0, 1 ],
                [ 3, 0, 5 ],
                [ 1, 2, 4 ],
            ]);
    }
    difference() {
        extrusion(sidelen, sidelen, notch, border_thickness, arm_thickness,
                  center_diameter, center_sidelen, corner_inner, corner_outer,
                  center);
        if (center) {
            prism(-sidelen / 2);
        } else {
            prism();
        }
    }
}
