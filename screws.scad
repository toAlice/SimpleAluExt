module screw_thread(screw_length, thread_diameter, thread_pitch,
                    thread_flatness = 20) {
    thread_radius = thread_diameter / 2;

    linear_extrude(height = screw_length, center = true, convexity = 10,
                   twist = screw_length / thread_pitch * 360, $fn = 100)
        translate([ thread_radius / thread_flatness, 0, 0 ])
            circle(r = thread_radius);
}

module screw(screw_length, thread_diameter, thread_pitch, head_thickness,
             head_diameter, thread_flatness = 20) {
    difference() {
        translate([ 0, 0, screw_length / 2]) {
            cylinder(h = head_thickness, d = head_diameter);
        }

        translate([0, 0, screw_length / 2 + head_thickness / 4 * 3 + 0.01]) {
            cube([head_diameter / 3 * 2, head_diameter / 10, head_thickness / 2], center = true);
            rotate([ 0, 0, 90 ]) {
                cube([head_diameter / 3 * 2, head_diameter / 10, head_thickness / 2], center = true);
            }
        }
    }

    screw_thread(screw_length, thread_diameter, thread_pitch, thread_flatness);
}