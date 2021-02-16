include<extrusions.scad>

include<connectors.scad>

include<screws.scad>

module chassis() {
    sidelen = 20;
    notch = 6;
    border_thickness = 1.5;
    arm_thickness = 2.5;
    center_diameter = 5;
    center_sidelen = 8;
    corner_inner = 0;
    corner_outer = 5.0;

    vchassie_len = 330;

    translate([ 0, 0, -vchassie_len / 2 + sidelen / 2 ]) extrusion(
        sidelen = sidelen, height = vchassie_len, notch = notch,
        border_thickness = border_thickness, arm_thickness = arm_thickness,
        center_diameter = center_diameter, center_sidelen = center_sidelen,
        corner_inner = corner_inner, corner_outer = corner_outer,
        center = true);

    hchassie_len = 330;

    translate([ 0, hchassie_len / 2 + sidelen / 2, 0 ]) rotate([ 90, 0, 0 ])
        extrusion(sidelen = sidelen, height = hchassie_len, notch = notch,
                  border_thickness = border_thickness,
                  arm_thickness = arm_thickness,
                  center_diameter = center_diameter,
                  center_sidelen = center_sidelen, corner_inner = corner_inner,
                  corner_outer = corner_outer, center = true);

    translate([ 0, hchassie_len / 2 + sidelen / 2, -154.94 ])
        rotate([ 90, 0, 0 ]) extrusion(
            sidelen = sidelen, height = hchassie_len, notch = notch,
            border_thickness = border_thickness, arm_thickness = arm_thickness,
            center_diameter = center_diameter, center_sidelen = center_sidelen,
            corner_inner = corner_inner, corner_outer = corner_outer,
            center = true);

    translate([ 0, hchassie_len / 2 + sidelen / 2, -279.4 ])
        rotate([ 90, 0, 0 ]) extrusion(
            sidelen = sidelen, height = hchassie_len, notch = notch,
            border_thickness = border_thickness, arm_thickness = arm_thickness,
            center_diameter = center_diameter, center_sidelen = center_sidelen,
            corner_inner = corner_inner, corner_outer = corner_outer,
            center = true);
}

module atxmobo(form_factor = "ATX") {
    mobo_thickness = 1.57;
    module mobo_base() {
        difference() {
            union() {
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
                        linear_extrude(44.75 - 2.2352)
                            polygon([ [ 0, 15 ], [ 0, 35 ], [ 20, 35 ] ]);
                        translate([ 158.75, 0, 0 ])
                            linear_extrude(44.75 - 2.2352)
                                polygon([ [ 0, 15 ], [ 0, 35 ], [ -20, 35 ] ]);
                        polyhedron(points =
                                       [
                                           [ 0, 0, 44.75 - 2.2352 ],
                                           [ 0, 35, 44.75 - 2.2352 ],
                                           [ 158.75, 35, 44.75 - 2.2352 ],
                                           [ 158.75, 0, 44.75 - 2.2352 ],
                                           [ 158.75, 35, 44.75 - 2.2352 - 8 ],
                                           [ 0, 35, 44.75 - 2.2352 - 8 ]
                                       ],
                                   faces = [
                                       [ 0, 1, 2, 3 ], [ 3, 2, 4 ],
                                       [ 2, 1, 5, 4 ], [ 1, 0, 5 ],
                                       [ 5, 0, 3, 4 ]
                                   ]);
                    }
                }
            }

            translate([ 6.35, 33.02, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }
            translate([ 6.35, 165.1, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }
            translate([ 6.35, 237.49, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }
            translate([ 6.35, 322.58, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }

            translate([ 163.83, 10.16, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }
            translate([ 163.83, 165.1, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }
            translate([ 163.83, 237.49, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }
            translate([ 163.83, 322.58, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }

            translate([ 209.55, 10.16, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }
            if (form_factor == "mATX") {
                translate([ 209.55, 165.1, 0 ]) {
                    cylinder(h = mobo_thickness, r = 2.5);
                }
            }

            if (form_factor == "mATX") {
                translate([ 209.55 + 20.32, 165.1, 0 ]) {
                    cylinder(h = mobo_thickness, r = 2.5);
                }
            }

            translate([ 288.29, 10.16, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }
            translate([ 288.29, 165.1, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }
            translate([ 288.29, 237.49, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }
            translate([ 288.29, 322.58, 0 ]) {
                cylinder(h = mobo_thickness, r = 2.5);
            }
        }
    }

    module pcie16x(center = false) {
        slot_width = 1.6;
        slot_depth = 8.6;

        module slot() {
            difference() {
                cube([ 7.2, 89, 11 ]);
                translate([ (7.2 - slot_width) / 2, 2, 11 - slot_depth ]) {
                    cube([ slot_width, 11.65, slot_depth ]);
                }
                translate([ (7.2 - slot_width) / 2, 15.35, 11 - slot_depth ]) {
                    cube([ slot_width, 70, slot_depth ]);
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

        if (center) {
            translate([ -3.6, -44.5, -5.5 ]) slot();
        } else {
            slot();
        }
    }

    mobo_base();
    pci_socket_distance = 20.32;
    pci_socket_init_pos = 165.1 + 18.75 - pci_socket_distance - 3.6;
    pci_socket_indent = 10.16 + 46.94 - 14.5;
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
}

module graphics_card(slots = 1) {
    pcb_thickness = 1.57;
    pcb_length = 165.1;
    module pcb() {
        difference() {
            cube([ pcb_thickness, pcb_length, 98.4 ]);
            translate([ 0, 7.5, 82 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness, d = 3.18);
            }
            translate([ 0, pcb_length - 5.08, 3.85 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness, d = 3.18);
            }
            translate([ 0, pcb_length - 5.08, 93.38 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness, d = 3.18);
            }
        }

        difference() {
            translate([ 0, 0, -8.25 ]) {
                cube([ pcb_thickness, 15, 8.25 ]);
            }
            translate([ 0, 7.5, -3.4 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness, d = 3.18);
            }
        }

        translate([ 0, 33.35, -8.25 ]) difference() {
            cube([ pcb_thickness, 11.65, 8.25 ]);
            translate([ 0, 8, 0 ]) {
                cube([ pcb_thickness, 3.65, 6.425 ]);
            }
            translate([ 0, 9.825, 6.425 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness, d = 3.65);
            }
        }

        translate([ 0, 45, -12.75 ]) difference() {
            cube([ pcb_thickness, 99.75, 12.75 ]);

            translate([ 0, 0.25, -0.25 ]) rotate([ 45, 0, 0 ]) {
                cube([ pcb_thickness, sqrt(2) / 4, sqrt(2) / 2 ]);
            }

            translate([ 0, 11.2, 0 ]) {
                cube([ pcb_thickness, 1.90, 7.45 ]);
            }

            translate([ 0, 10.7, 0 ]) rotate([ -45, 0, 0 ]) {
                cube([ pcb_thickness, sqrt(2) / 4, sqrt(2) / 2 ]);
            }

            translate([ 0, 12.15, 7.45 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness, d = 1.9);
            }

            translate([ 0, 13.35, -0.25 ]) rotate([ 45, 0, 0 ]) {
                cube([ pcb_thickness, sqrt(2) / 4, sqrt(2) / 2 ]);
            }

            translate([ 0, 84.3, 0 ]) {
                cube([ pcb_thickness, 2.75, 7.605 ]);
            }
            translate([ 0, 85.675, 7.605 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness, d = 2.75);
            }

            translate([ 0, 83.8, 0 ]) rotate([ -45, 0, 0 ]) {
                cube([ pcb_thickness, sqrt(2) / 4, sqrt(2) / 2 ]);
            }

            translate([ 0, 87.05, 0 ]) {
                cube([ pcb_thickness, 12.7, 2.95 ]);
            }
            translate([ 0, 98.35, 2.95 ]) rotate([ -30, 0, 0 ]) {
                cube([ pcb_thickness, 1.4, 2.8 ]);
            }
            translate([ 0, 94.925, 7.95 ]) {
                cube([ pcb_thickness, 4.825, 4.8 ]);
            }
            translate([ 0, 94.05, 8.825 ]) {
                cube([ pcb_thickness, 1.75, 3.05 ]);
            }
            translate([ 0, 94.925, 8.825 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness, d = 1.75);
            }
            translate([ 0, 94.925, 11.875 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness, d = 1.75);
            }
        }
    }

    module io_bracket() {

    }

    module shroud() {

    }

    module back_plate() {

    }

    pcb();
}

// mITX, mDTX, mATX, ATX, EATX
// atxmobo("ATX");
// graphics_card();

screw(screw_length = 6, thread_diameter = 4, thread_pitch = 0.7,
      head_thickness = 2.4, head_diameter = 8, thread_flatness = 12);
