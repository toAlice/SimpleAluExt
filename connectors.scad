module tslide(length, width, height, top_length, top_width, top_height,
              bottom_width, slope_height, screw_diameter, center = false) {
    module base() {
        rotate([ 90, 0, 90 ]) union() {
            linear_extrude(height = length) polygon(points = [
                // 0
                [ width - (width - bottom_width) / 2, 0 ],
                // 4
                [ width, slope_height ],
                // 8
                [ width, height - top_height ],
                // 11
                [ 0, height - top_height ],
                // 7
                [ 0, slope_height ],
                // 3
                [ (width - bottom_width) / 2, 0 ]
            ]);
            translate([ 0, 0, (length - top_length) / 2 ])
                linear_extrude(height = top_length) polygon(points = [
                    // 0
                    [ width - (width - top_width) / 2, height - top_height ],
                    // 3
                    [ (width - top_width) / 2, height - top_height ],
                    // 7
                    [ (width - top_width) / 2, height ],
                    // 4
                    [ width - (width - top_width) / 2, height ]
                ]);
        }
    }
    difference() {
        if (center) {
            translate([ -length / 2, -width / 2, -height / 2 ]) {
                base();
            }
        } else {
            base();
        }
        if (center) {
            cylinder(h = height, d = screw_diameter, center = true);
        } else {
            translate([ length / 2, width / 2, 0 ]) {
                cylinder(h = height, d = screw_diameter);
            }
        }
    }
}
