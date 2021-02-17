module graphics_card(pcb_thickness = 1.57, pcb_length = 144.75,
                     hole_base_x = 45, hole_base_y = 20, hole_dis = 53,
                     gpu_thickness = 5, gpu_sidelen = 41, slots = 1) {
    module pcb() {
        difference() {
            cube([ pcb_thickness, pcb_length, 98.4 ]);
            translate([ 0, 7.5, 82 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness, d = 3.18);
            }
            { // Cooler Mounting holes

                translate([ 0, hole_base_x, hole_base_y ])
                    rotate([ 0, 90, 0 ]) {
                    cylinder(h = pcb_thickness, d = 3.18);
                }
                translate([ 0, hole_base_x + hole_dis, hole_base_y ])
                    rotate([ 0, 90, 0 ]) {
                    cylinder(h = pcb_thickness, d = 3.18);
                }
                translate([ 0, hole_base_x + hole_dis, hole_base_y + hole_dis ])
                    rotate([ 0, 90, 0 ]) {
                    cylinder(h = pcb_thickness, d = 3.18);
                }
                translate([ 0, hole_base_x, hole_base_y + hole_dis ])
                    rotate([ 0, 90, 0 ]) {
                    cylinder(h = pcb_thickness, d = 3.18);
                }
            }
        }
        translate([
            pcb_thickness, hole_base_x + (hole_dis - gpu_sidelen) / 2,
            hole_base_y + (hole_dis - gpu_sidelen) / 2
        ]) {
            cube([ pcb_thickness, gpu_sidelen, gpu_sidelen ]);
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

    bracket_thickness = 0.86;
    module io_bracket(tab = false) {
        module mounting_tab() {
            difference() {
                cube([ bracket_thickness, 7.95, 12.57 ]);
                translate([ 0, 3.98, 3.17 ]) {
                    rotate([ 0, 90, 0 ]) {
                        cylinder(h = bracket_thickness, d = 2.8448);
                    }
                }
                translate([ 0, 7.95 - 1.27 / 2, 1.27 / 2 ]) rotate([ 0, 90, 0 ])
                    difference() {
                    cube([ 1.27, 1.27, bracket_thickness ]);
                    cylinder(h = bracket_thickness, d = 1.27);
                }

                translate([ 0, 1.27 / 2, 1.27 / 2 ]) rotate([ 0, 90, 0 ])
                    difference() {
                    translate([ 0, -1.27, 0 ])
                        cube([ 1.27, 1.27, bracket_thickness ]);
                    cylinder(h = bracket_thickness, d = 1.27);
                }
            }
        }
        translate(
            [ 18.42 - bracket_thickness, -1.9 + bracket_thickness, 92.11 ])
            rotate([ 0, 0, 180 ]) {
            translate([ 0, bracket_thickness, 0 ]) difference() {
                translate([ 2.54, 0, 0 ]) {
                    cube([ 19.05, 11.43, bracket_thickness ]);
                }
                translate([ 18.42, 5.08, 0 ]) {
                    cylinder(h = bracket_thickness, d = 4.42);
                }
                translate([ 18.42, 2.87, 0 ]) {
                    cube([ 3.17, 4.42, bracket_thickness ]);
                }
                translate([ 10.92, 7.24, 0 ]) {
                    cube([ 3.05, 4.19, bracket_thickness ]);
                }
                difference() {
                    translate([ 2.54, 7.62, 0 ]) {
                        cube([ 3.81, 3.81, bracket_thickness ]);
                    }
                    translate([ 6.35, 7.62, 0 ]) {
                        cylinder(h = bracket_thickness, r = 3.81);
                    }
                }
                difference() {
                    translate([ 17.78, 7.62, 0 ]) {
                        cube([ 3.81, 3.81, bracket_thickness ]);
                    }
                    translate([ 17.78, 7.62, 0 ]) {
                        cylinder(h = bracket_thickness, r = 3.81);
                    }
                }
            }

            translate([ 0, bracket_thickness, 0 ]) {
                rotate([ 0, 90, 0 ]) {
                    intersection() {
                        cylinder(h = 21.59, r = bracket_thickness);
                        translate(
                            [ -bracket_thickness, -bracket_thickness, 2.54 ]) {
                            cube([
                                bracket_thickness, bracket_thickness, 19.05
                            ]);
                        }
                    }
                }
            }

            rotate([ -90, 0, 0 ]) {
                difference() {
                    cube([ 21.59, 114.95, bracket_thickness ]);
                    translate([ 3.47, 10.16, 0 ]) { // connectors cutout
                        cube([ 12.06, 89.90, bracket_thickness ]);
                    }
                    union() { // short side shift cutout
                        cube([
                            2.54, 3.94 - bracket_thickness,
                            bracket_thickness
                        ]);
                        linear_extrude(bracket_thickness) polygon([
                            [ 0, 3.94 - bracket_thickness ],
                            [ 0, 6.48 - bracket_thickness ],
                            [ 2.54, 3.94 - bracket_thickness ]
                        ]);
                    }
                    if (tab) {
                        union() { // long side shift cutout
                            translate([ 18.42, 7.11 - bracket_thickness, 0 ]) {
                                cube([
                                    3.17, 107.84 + bracket_thickness,
                                    bracket_thickness
                                ]);
                            }
                            linear_extrude(bracket_thickness) polygon([
                                [ 21.59 + 0.001, 3.94 - bracket_thickness ],
                                [ 21.59 + 0.001, 7.11 - bracket_thickness ],
                                [ 18.42, 7.11 - bracket_thickness ]
                            ]);
                        }
                    }

                    { // bottom slope
                        linear_extrude(bracket_thickness) polygon([
                            [ 0, 108.64 ], [ 4.12, 112.75 ],
                            [ 4.12, 114.95 + 0.001 ], [ 0, 114.95 + 0.001 ]
                        ]);
                        linear_extrude(bracket_thickness) polygon([
                            [ 21.59 + 0.001, 108.64 ],
                            [ 18.42 + 0.001, 108.64 ],
                            [ 18.42 - 4.11, 112.75 ],
                            [ 18.42 - 4.11, 114.95 + 0.001 ],
                            [ 18.42 + 0.001, 114.95 + 0.001 ],
                            [ 21.59 + 0.001, 114.95 + 0.001 ],
                        ]);
                    }
                }
                // add 0.02mm here so after rotating 5deg the height will still
                // be 5.07mm
                translate([ 0, 114.95, 0 ]) rotate([ 5, 0, 0 ]) union() {
                    linear_extrude(bracket_thickness) polygon([
                        [ 4.12, 0 ], [ 4.12, 4.135 ], [ 4.12 + 0.955, 5.09 ],
                        [ 18.42 - 4.11 - 0.955, 5.09 ], [ 18.42 - 4.11, 4.135 ],
                        [ 18.42 - 4.11, 0 ]
                    ]);
                    translate([ 4.12 + 0.955, 5.09 - 0.955, 0 ]) {
                        cylinder(h = bracket_thickness, r = 0.955);
                    }
                    translate([ 18.42 - 4.11 - 0.955, 5.09 - 0.955, 0 ]) {
                        cylinder(h = bracket_thickness, r = 0.955);
                    }
                }
                if (tab) {
                    // mounting tabs
                    translate([
                        18.42 - bracket_thickness, 10.11 - 3.98, -12.57 +
                        bracket_thickness
                    ]) {
                        mounting_tab();
                    }
                    translate([
                        18.42 - bracket_thickness, 10.11 - 3.98 + 85.4, -12.57 +
                        bracket_thickness
                    ]) {
                        mounting_tab();
                    }
                }
            }
        }
    }

    module shroud() {
    }

    module back_plate() {
    }
    translate([ -pcb_thickness / 2, -57.15, 0 ]) {
        pcb();
        union() {
            io_bracket(tab = true);
            if (slots > 1) {
                for (i = [2:slots]) {
                    translate([ 20.32 * (i - 1), 0, 0 ]) io_bracket();
                }
            }
        }
    }
}