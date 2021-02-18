module atxmobo(form_factor = "ATX", screw = true) {
    mobo_thickness = 2.36;

    module mobo_base() {
        difference() {
            color("#3F3F3F") union() {
                if (form_factor == "mITX") {
                    cube([ 170.18, 170.18, mobo_thickness ]);
                } else if (form_factor == "mDTX") {
                    cube([ 203.2, 170.18, mobo_thickness ]);
                } else if (form_factor == "mATX") {
                    cube([ 243.84, 243.84, mobo_thickness ]);
                } else if (form_factor == "EATX") {
                    cube([ 304.8, 330.2, mobo_thickness ]);
                } else {
                    cube([ 304.8, 243.84, mobo_thickness ]);
                }

                translate([ -3.302, -1.143, -2.2352 ]) {
                    cube([ 158.75, 1.144, 44.75 ]);
                }
                translate([ -3.302, 0, 0 ]) {
                    difference() {
                        cube([ 158.75, 35, 44.75 - 2.2352 ]);
                        translate([0, 0, - 0.01]) linear_extrude(44.75 - 2.2352 + 0.02)
                            polygon([ [ 0 - 0.01, 15 - 0.01 ], [ 0 - 0.01, 35 + 0.01 ], [ 20 + 0.01, 35 + 0.01 ] ]);
                        translate([ 158.75, 0, -0.01 ])
                            linear_extrude(44.75 - 2.2352 + 0.02)
                                polygon([ [ 0 + 0.01, 15 - 0.01 ], [ 0 + 0.01, 35 + 0.01 ], [ -20 - 0.01, 35 + 0.01 ] ]);
                        polyhedron(points =
                                       [
                                           [ 0 - 0.01, 0 - 0.01, 44.75 - 2.2352 + 0.01 ],
                                           [ 0 - 0.01, 35 + 0.01, 44.75 - 2.2352 + 0.01 ],
                                           [ 158.75 + 0.01, 35 + 0.01, 44.75 - 2.2352 + 0.01 ],
                                           [ 158.75 + 0.01, 0 - 0.01, 44.75 - 2.2352 + 0.01 ],
                                           [ 158.75 + 0.01, 35 + 0.01, 44.75 - 2.2352 - 8 - 0.01 ],
                                           [ 0 - 0.01, 35 + 0.01, 44.75 - 2.2352 - 8 - 0.01 ]
                                       ],
                                   faces = [
                                       [ 0, 1, 2, 3 ], [ 3, 2, 4 ],
                                       [ 2, 1, 5, 4 ], [ 1, 0, 5 ],
                                       [ 5, 0, 3, 4 ]
                                   ]);
                    }
                }
            }

            { // screw holes
                translate([ 6.35, 33.02, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }
                translate([ 6.35, 165.1, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }
                translate([ 6.35, 237.49, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }
                translate([ 6.35, 322.58, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }

                translate([ 163.83, 10.16, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }
                translate([ 163.83, 165.1, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }
                translate([ 163.83, 237.49, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }
                translate([ 163.83, 322.58, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }

                translate([ 209.55, 10.16, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }
                if (form_factor == "mATX") {
                    translate([ 209.55, 165.1, 0 - 0.01 ]) {
                        cylinder(h = mobo_thickness + 0.02, r = 2.5);
                    }
                }

                if (form_factor == "mATX") {
                    translate([ 209.55 + 20.32, 165.1, 0 - 0.01 ]) {
                        cylinder(h = mobo_thickness + 0.02, r = 2.5);
                    }
                }

                translate([ 288.29, 10.16, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }
                translate([ 288.29, 165.1, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }
                translate([ 288.29, 237.49, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }
                translate([ 288.29, 322.58, 0 - 0.01 ]) {
                    cylinder(h = mobo_thickness + 0.02, r = 2.5);
                }
            }
        }
    }

    module pcie16x() {
        slot_width = 1.6;
        slot_depth = 7.6;

        module slot() {
            difference() {
                cube([ 7.2, 89, 11 ]);
                translate([ (7.2 - slot_width) / 2, 2, 11 - slot_depth - 0.01 ]) {
                    cube([ slot_width, 11.65, slot_depth + 0.02 ]);
                }
                translate([ (7.2 - slot_width) / 2, 15.35, 11 - slot_depth - 0.01 ]) {
                    cube([ slot_width, 70, slot_depth + 0.02 ]);
                }
            }
            translate([ 0, 89, 0 ]) rotate([ 90, 0, 90 ]) linear_extrude(7.2)
                polygon([
                    [ 0, 3 ], [ 0, 11 ], [ 12.625, 11 ], [ 12.625, 14.35 ],
                    [ 18.025, 16 ], [ 18.025, 5 ], [ 3, 5 ]
                ]);

            translate([ 0, 89, 7.4 ]) rotate([ 90, 0, 0 ]) linear_extrude(89)
                polygon([ [ -1.5, 0 ], [ -1.8, 0.8 ], [ 0, 3.6 ], [ 0, 0 ] ]);
        }

        translate([ -3.6, -14.5, 0 ]) color("#3F1F1F") slot();
    }

    module screws() {
        module m4screw(screw_length = 8) {
            color("#1F1F1F") union() {
                translate([ 0, 0, 4 ]) {
                    screw_head(head_thickness = 2.4, head_diameter = 8);
                }
                screw_thread(screw_length = screw_length, thread_diameter = 4,
                             thread_pitch = 0.7, thread_flatness = 12);
            }
        }
        translate([ 0, 0, -4 + mobo_thickness ]) {
            translate([ 6.35, 33.02, 0 ]) {
                m4screw(screw_length = 8);
            }
            translate([ 6.35, 165.1, 0 ]) {
                m4screw(screw_length = 8);
            }
            if (form_factor != "mITX" && form_factor != "mDTX") {
                translate([ 6.35, 237.49, 0 ]) {
                    m4screw(screw_length = 8);
                }
                if (form_factor == "EATX") {
                    translate([ 6.35, 322.58, 0 ]) {
                        m4screw(screw_length = 8);
                    }
                }
            }

            translate([ 163.83, 10.16, 0 ]) {
                m4screw(screw_length = 8);
            }
            translate([ 163.83, 165.1, 0 ]) {
                m4screw(screw_length = 8);
            }
            if (form_factor != "mITX" && form_factor != "mDTX") {
                translate([ 163.83, 237.49, 0 ]) {
                    m4screw(screw_length = 8);
                }
                if (form_factor == "EATX") {
                    translate([ 163.83, 322.58, 0 ]) {
                        m4screw(screw_length = 8);
                    }
                }
            }

            if (form_factor != "mITX" && form_factor != "mDTX") {
                translate([ 209.55, 10.16, 0 ]) {
                    m4screw(screw_length = 8);
                }
                if (form_factor == "mATX") {
                    translate([ 209.55, 165.1, 0 ]) {
                        m4screw(screw_length = 8);
                    }
                }
            }

            if (form_factor == "mATX") {
                translate([ 209.55 + 20.32, 165.1, 0 ]) {
                    m4screw(screw_length = 8);
                }
            }

            if (form_factor != "mITX" && form_factor != "mDTX" &&
                form_factor != "mATX") {
                translate([ 288.29, 10.16, 0 ]) {
                    m4screw(screw_length = 8);
                }
                translate([ 288.29, 165.1, 0 ]) {
                    m4screw(screw_length = 8);
                }
                translate([ 288.29, 237.49, 0 ]) {
                    m4screw(screw_length = 8);
                }
                if (form_factor == "EATX") {
                    translate([ 288.29, 322.58, 0 ]) {
                        m4screw(screw_length = 8);
                    }
                }
            }
        }
    }

    mobo_base();
    pci_socket_distance = 20.32;
    pci_socket_init_pos = 162.26;
    pci_socket_indent = 57.1;
    translate([
        pci_socket_init_pos + pci_socket_distance * 0, pci_socket_indent,
        mobo_thickness
    ]) {
        pcie16x();
    }
    if (form_factor != "mITX") {
        translate([
            pci_socket_init_pos + pci_socket_distance * 1, pci_socket_indent,
            mobo_thickness
        ]) {
            pcie16x();
        }
        if (form_factor != "mDTX") {
            translate([
                pci_socket_init_pos + pci_socket_distance * 2,
                pci_socket_indent,
                mobo_thickness
            ]) {
                pcie16x();
            }
            translate([
                pci_socket_init_pos + pci_socket_distance * 3,
                pci_socket_indent,
                mobo_thickness
            ]) {
                pcie16x();
            }
            if (form_factor != "mATX") {
                translate([
                    pci_socket_init_pos + pci_socket_distance * 4,
                    pci_socket_indent,
                    mobo_thickness
                ]) {
                    pcie16x();
                }
                translate([
                    pci_socket_init_pos + pci_socket_distance * 5,
                    pci_socket_indent,
                    mobo_thickness
                ]) {
                    pcie16x();
                }
                translate([
                    pci_socket_init_pos + pci_socket_distance * 6,
                    pci_socket_indent,
                    mobo_thickness
                ]) {
                    pcie16x();
                }
            }
        }
    }
    if (screw) {
        screws();
    }
}
