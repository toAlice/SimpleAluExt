module screw_thread(screw_length, thread_diameter, thread_pitch, thread = false,
                    thread_flatness = 12) {
    if (thread) {
        thread_radius = thread_diameter / 2;
        linear_extrude(height = screw_length, center = true, convexity = 10,
                       twist = screw_length / thread_pitch * 360, $fn = 100)
            translate([ thread_radius / thread_flatness, 0 ])
                circle(r = thread_radius);
    } else {
        cylinder(h = screw_length, d = thread_diameter, center = true);
    }
}

module screw_head(head_thickness, head_diameter) {
    difference() {
        cylinder(h = head_thickness, d = head_diameter);

        translate([ 0, 0, head_thickness / 4 * 3 + 0.01 ]) {
            cube(
                [
                    head_diameter / 3 * 2, head_diameter / 10,
                    head_thickness / 2
                ],
                center = true);
            rotate([ 0, 0, 90 ]) {
                cube(
                    [
                        head_diameter / 3 * 2, head_diameter / 10,
                        head_thickness / 2
                    ],
                    center = true);
            }
        }
    }
}