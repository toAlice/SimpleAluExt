module graphics_card() {

    pcb_thickness = 1.57;
    pcb_length = 176.18;
    pcb_height = 132;
    hole_base_x = 47; 
    hole_base_y = 20; 
    hole_dis_x = 89; 
    hole_dis_y = 63;
    gpu_thickness = 5; 
    gpu_sidelen = 73; 
    slots = 3;
    
    module lineup(num, space) {
        for (i = [0 : num-1]) {
            translate([ space*i, 0, 0 ]) {
                children(0);
            }
        }
    }

    module pcb() {
        difference() {
            color("#0F0F0F") cube([ pcb_thickness, pcb_length, pcb_height ]);
            translate([ 0 - 0.01, 7.5, 82 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness + 0.02, d = 3.18);
            }
            { // Cooler Mounting holes

                translate([ 0 - 0.01, hole_base_x, hole_base_y ]) {
                    rotate([ 0, 90, 0 ]) {
                        cylinder(h = pcb_thickness + 0.02, d = 3.18);
                    }
                }
                translate([ 0 - 0.01, hole_base_x + hole_dis_x, hole_base_y ]) {
                    rotate([ 0, 90, 0 ]) {
                        cylinder(h = pcb_thickness + 0.02, d = 3.18);
                    }
                }
                translate([ 0 - 0.01, hole_base_x + hole_dis_x, hole_base_y + hole_dis_y ]) {
                    rotate([ 0, 90, 0 ]) {
                        cylinder(h = pcb_thickness + 0.02, d = 3.18);
                    }
                }
                translate([ 0 - 0.01, hole_base_x, hole_base_y + hole_dis_y ]) {
                    rotate([ 0, 90, 0 ]) {
                        cylinder(h = pcb_thickness + 0.02, d = 3.18);
                    }
                }
            }
        }

        difference() {
            translate([ 0, 0, -8.25 ]) {
                color("#0F0F0F") cube([ pcb_thickness, 15, 8.25 ]);
            }
            translate([ 0 - 0.01, 7.5, -3.4 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness + 0.02, d = 3.18);
            }
        }

        translate([ 0, 33.35, -8.25 ]) difference() {
            color("#0F0F0F") cube([ pcb_thickness, 11.65, 8.25 ]);
            translate([ 0 - 0.01, 8, 0 - 0.01 ]) {
                cube([ pcb_thickness + 0.02, 3.65, 6.425 + 0.02 ]);
            }
            translate([ 0 - 0.01, 9.825, 6.425 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness + 0.02, d = 3.65);
            }
        }

        translate([ 0, 45, -12.75 ]) difference() {
            color("#0F0F0F") cube([ pcb_thickness, 99.75, 12.75 ]);

            translate([ 0 - 0.01, 0.25, -0.25 ]) rotate([ 45, 0, 0 ]) {
                cube([ pcb_thickness + 0.02, sqrt(2) / 4, sqrt(2) / 2 ]);
            }

            translate([ 0 - 0.01, 11.2, 0 - 0.01]) {
                cube([ pcb_thickness + 0.02, 1.90, 7.45 + 0.02 ]);
            }

            translate([ 0 - 0.01, 10.7, 0 ]) rotate([ -45, 0, 0 ]) {
                cube([ pcb_thickness + 0.02, sqrt(2) / 4, sqrt(2) / 2 ]);
            }

            translate([ 0 - 0.01, 12.15, 7.45 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness + 0.02, d = 1.9);
            }

            translate([ 0 - 0.01, 13.35, -0.25 ]) rotate([ 45, 0, 0 ]) {
                cube([ pcb_thickness + 0.02, sqrt(2) / 4, sqrt(2) / 2 ]);
            }

            translate([ 0 - 0.01, 84.3, 0 - 0.01 ]) {
                cube([ pcb_thickness + 0.02, 2.75, 7.605 + 0.02 ]);
            }
            translate([ 0 - 0.01, 85.675, 7.605 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness + 0.02, d = 2.75);
            }

            translate([ 0 - 0.01, 83.8, 0 ]) rotate([ -45, 0, 0 ]) {
                cube([ pcb_thickness + 0.02, sqrt(2) / 4, sqrt(2) / 2 ]);
            }

            translate([ 0 - 0.01, 87.05 - 0.01, 0 - 0.01 ]) {
                cube([ pcb_thickness + 0.02, 12.7 + 0.02, 2.95 + 0.02 ]);
            }
            translate([ 0 - 0.01, 98.35, 2.95 ]) rotate([ -30, 0, 0 ]) {
                cube([ pcb_thickness + 0.02, 1.4, 2.8 ]);
            }
            translate([ 0 - 0.01, 94.925 - 0.01, 7.95 ]) {
                cube([ pcb_thickness + 0.02, 4.825 + 0.02, 4.8 ]);
            }
            translate([ 0 - 0.01, 94.05, 8.825 ]) {
                cube([ pcb_thickness + 0.02, 1.75, 3.05 ]);
            }
            translate([ 0 - 0.01, 94.925, 8.825 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness + 0.02, d = 1.75);
            }
            translate([ 0 - 0.01, 94.925, 11.875 ]) rotate([ 0, 90, 0 ]) {
                cylinder(h = pcb_thickness + 0.02, d = 1.75);
            }
        }
        translate([
            pcb_thickness, hole_base_x + (hole_dis_x - gpu_sidelen) / 2,
            hole_base_y + (hole_dis_y - gpu_sidelen) / 2
        ]) { // GPU Die
            color("#7F7F7F") cube([ gpu_thickness, gpu_sidelen, gpu_sidelen ]);
        }
        mem_x = 12;
        mem_y = 14;
        mem_t = 1.1;
        mem_space = 0.5;
        { // memory dies
            module mem_die(r=false) {
                if (r) {
                    color("#2F2F2F") cube([mem_y, mem_x, mem_t]);
                } else {
                    color("#2F2F2F") cube([mem_x, mem_y, mem_t]);
                }
            }
            module mem_array() {
                translate([0, (hole_dis_x - gpu_sidelen) / 2 - mem_space * 4, (hole_dis_y - ((mem_x + mem_space) * 4 - mem_space)) / 2]) {
                    rotate([180, 0, 0]) {
                        rotate([0, 90, 0]) {
                            lineup(4, mem_x + mem_space) {
                                mem_die();
                            }
                        }
                    }
                }
                translate([0, (hole_dis_x - ((mem_y + mem_space) * 4 - mem_space)) / 2, (hole_dis_y - gpu_sidelen) / 2 - mem_x - mem_space * 4]) {
                    rotate([90, 0, 0]) {
                        rotate([0, 90, 0]) {
                            lineup(4, mem_y + mem_space) {
                                mem_die(true);
                            }
                        }
                    }
                }
                translate([0, gpu_sidelen + mem_y + (hole_dis_x - gpu_sidelen) / 2 + mem_space * 4, (hole_dis_y - ((mem_x + mem_space) * 4 - mem_space)) / 2]) {
                    rotate([180, 0, 0]) {
                        rotate([0, 90, 0]) {
                            lineup(4, mem_x + mem_space) {
                                mem_die();
                            }
                        }
                    }
                }
            }
            translate([pcb_thickness, hole_base_x, hole_base_y]) {
                mem_array();
            }
            translate([-mem_t, hole_base_x, hole_base_y]) {
                mem_array();
            }
        }
        molex_x = 9.6;
        molex_y = 12.8;
        molex_space = 1.2;
        molex_t = 18;
        choke_x = 7.8;
        choke_y = 10.1;
        choke_space = 0.2;
        choke_t = 4.8;
        mos_x = 4.8;
        mos_y = 5.7;
        mos_t = 0.8;
        mos_space = 3.2;
        cap_x = 3.9;
        cap_y = 6.2;
        cap_t = 1.0;
        cap_space = 0.8;
        { // 8 or 12 pin connectors
            translate([pcb_thickness, (pcb_length - ((molex_y + molex_space) * 3 - molex_space)) / 2, pcb_height - molex_x]) {
                rotate([90, 0, 0]) {
                    rotate([0, 90, 0]) {
                        lineup(3, molex_y + molex_space) {
                            union() {
                                color("#1F1F1F") cube([molex_y, molex_x, molex_t]);
                                color("#AFAFAF") difference() {
                                    union() {
                                        translate([molex_y / 3 - 0.4, -6, 0]) {
                                            cube([0.8, 6, molex_t / 7 * 6]);
                                        }
                                        translate([molex_y / 3 * 2 - 0.4, -6, 0]) {
                                            cube([0.8, 6, molex_t / 7 * 6]);
                                        }
                                    }
                                    translate([0, -3, -0.01]) {
                                        cube([molex_y, 3 + 10, molex_t / 5 + 0.02]);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        translate([pcb_thickness, 14.7,  (choke_x + choke_space) * 14 + 4 ]) { // vrm left
            { // mos array
                translate([0, 0, 0]) {
                    rotate([0, 90, 0]) {
                        lineup(14, choke_x + choke_space) {
                            color("#3F3F3F") cube([mos_x, mos_y, mos_t]);
                        }
                    }
                }
            }
            { // choke array
                translate([ 0, mos_y + cap_space, 0 ]) {
                    rotate([ 0, 90, 0 ]) {
                        lineup(14, choke_x + choke_space) {
                            color("#AFAFAF") cube([choke_x, choke_y, choke_t]);
                        }
                    }
                }
            }
            { // caps
                translate([ 0, mos_y + cap_space + choke_y + cap_space, 0 ]) {
                    rotate([ 0, 90, 0 ]) {
                        lineup(24, cap_x + cap_space) {
                            color("#7F7F7F") cube([cap_x, cap_y, cap_t]);
                        }
                    }
                }
                translate([ -pcb_thickness - cap_t, mos_y + cap_space + choke_y + cap_space, 0 ]) {
                    rotate([ 0, 90, 0 ]) {
                        lineup(24, cap_x + cap_space) {
                            color("#7F7F7F") cube([cap_x, cap_y, cap_t]);
                        }
                    }
                }
            }
        }
        translate([pcb_thickness, pcb_length - 8, 0 ]) { // vrm right
            rotate([ 180, 0, 0 ]) { 
                { // mos array
                    translate([0, 0, -mos_space -(choke_x - mos_x) / 2]) {
                        rotate([0, 90, 0]) {
                            lineup(14, choke_x + choke_space) {
                                color("#3F3F3F") cube([mos_x, mos_y, mos_t]);
                            }
                        }
                    }
                }
                { // choke array
                    translate([ 0, mos_y + cap_space, -mos_space ]) {
                        rotate([ 0, 90, 0 ]) {
                            lineup(14, choke_x + choke_space) {
                                color("#AFAFAF") cube([choke_x, choke_y, choke_t]);
                            }
                        }
                    }
                }
                { // caps
                    translate([ 0, mos_y + cap_space + choke_y + cap_space, -mos_space ]) {
                        rotate([ 0, 90, 0 ]) {
                            lineup(24, cap_x + cap_space) {
                                color("#7F7F7F") cube([cap_x, cap_y, cap_t]);
                            }
                        }
                    }
                    translate([ -pcb_thickness - cap_t, mos_y + cap_space + choke_y + cap_space, -mos_space ]) {
                        rotate([ 0, 90, 0 ]) {
                            lineup(24, cap_x + cap_space) {
                                color("#7F7F7F") cube([cap_x, cap_y, cap_t]);
                            }
                        }
                    }
                }
            }
        }
    }

    bracket_thickness = 0.86;
    module io_bracket(tab = false) {
        module mounting_tab() {
            difference() {
                cube([ bracket_thickness, 7.95, 12.57 ]);
                translate([ 0 - 0.01, 3.98, 3.17 ]) {
                    rotate([ 0, 90, 0 ]) {
                        cylinder(h = bracket_thickness + 0.02, d = 2.8448);
                    }
                }
                translate([ 0 - 0.01, 7.95 - 1.27 / 2, 1.27 / 2 ]) rotate([ 0, 90, 0 ]) {
                    difference() {
                        cube([ 1.27, 1.27, bracket_thickness + 0.02 ]);
                        cylinder(h = bracket_thickness + 0.02, d = 1.27);
                    }
                }

                translate([ 0 - 0.01, 1.27 / 2, 1.27 / 2 ]) rotate([ 0, 90, 0 ]) {
                    difference() {
                        translate([ 0, -1.27, 0 ]) {
                            cube([ 1.27, 1.27, bracket_thickness + 0.02 ]);
                        }
                        cylinder(h = bracket_thickness + 0.02, d = 1.27);
                    }
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
                translate([ 18.42, 5.08, 0 - 0.01 ]) {
                    cylinder(h = bracket_thickness + 0.02, d = 4.42);
                }
                translate([ 18.42 - 0.01, 2.87, 0 - 0.01 ]) {
                    cube([ 3.17 + 0.02, 4.42, bracket_thickness + 0.02 ]);
                }
                translate([ 10.92, 7.24 - 0.01, 0 - 0.01 ]) {
                    cube([ 3.05, 4.19 + 0.02, bracket_thickness + 0.02 ]);
                }
                difference() {
                    translate([ 2.54 - 0.01, 7.62 - 0.01, 0 - 0.01 ]) {
                        cube([ 3.81 + 0.02, 3.81 + 0.02, bracket_thickness + 0.02 ]);
                    }
                    translate([ 6.35, 7.62, 0 - 0.01 ]) {
                        cylinder(h = bracket_thickness + 0.02, r = 3.81);
                    }
                }
                translate([ 17.78 - 0.01, 7.62 - 0.01, 0 - 0.01 ]) difference() {
                    cube([ 3.81 + 0.02, 3.81 + 0.02, bracket_thickness + 0.02 ]);
                    cylinder(h = bracket_thickness, r = 3.81);
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
                    translate([ 3.47, 10.16, 0 - 0.01 ]) { // connectors cutout
                        cube([ 12.06, 89.90, bracket_thickness + 0.02 ]);
                    }
                    translate([ 0 - 0.01, 0 - 0.01, 0 - 0.01 ]) { // short side shift cutout
                        cube([
                            2.54 + 0.02, 3.94 - bracket_thickness + 0.02,
                            bracket_thickness + 0.02
                        ]);
                        linear_extrude(bracket_thickness + 0.02) polygon([
                            [ 0, 3.94 - bracket_thickness ],
                            [ 0, 6.48 - bracket_thickness ],
                            [ 2.54, 3.94 - bracket_thickness ]
                        ]);
                    }
                    if (tab) {
                        translate([ 0 - 0.01, 0 - 0.01, 0 - 0.01 ]) { // long side shift cutout
                            translate([ 18.42, 7.11 - bracket_thickness, 0 ]) {
                                cube([
                                    3.17 + 0.02, 107.84 + bracket_thickness + 0.02,
                                    bracket_thickness + 0.02
                                ]);
                            }
                            linear_extrude(bracket_thickness + 0.02) polygon([
                                [ 21.59 + 0.02, 3.94 - bracket_thickness ],
                                [ 21.59 + 0.02, 7.11 - bracket_thickness + 0.02 ],
                                [ 18.42, 7.11 - bracket_thickness + 0.02 ]
                            ]);
                        }
                    }

                    translate([0 - 0.01, 0, 0 - 0.01]) { // bottom slope
                        linear_extrude(bracket_thickness + 0.02) polygon([
                            [ 0, 108.64 ], [ 4.12, 112.75 ],
                            [ 4.12, 114.95 + 0.02 ], [ 0, 114.95 + 0.02 ]
                        ]);
                        linear_extrude(bracket_thickness + 0.02) polygon([
                            [ 21.59 + 0.02, 108.64 ],
                            [ 18.42 + 0.02, 108.64 ],
                            [ 18.42 - 4.11, 112.75 ],
                            [ 18.42 - 4.11, 114.95 + 0.02 ],
                            [ 18.42 + 0.02, 114.95 + 0.02 ],
                            [ 21.59 + 0.02, 114.95 + 0.02 ],
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

    module cooler() {
        module mounting_screws() {
            translate([screw_length / 2 - 1, 0, 0]) {
                translate([ 0, hole_base_x, hole_base_y ]) {
                    rotate([0, 90, 0]) screw_thread(screw_length, 3, 0.5);
                }
                translate([ 0, hole_base_x + hole_dis_x, hole_base_y ]) {
                    rotate([0, 90, 0]) screw_thread(screw_length, 3, 0.5);
                }
                translate([ 0, hole_base_x, hole_base_y + hole_dis_y ]) {
                    rotate([0, 90, 0]) screw_thread(screw_length, 3, 0.5);
                }
                translate([ 0, hole_base_x + hole_dis_x, hole_base_y + hole_dis_y ]) {
                    rotate([0, 90, 0]) screw_thread(screw_length, 3, 0.5);
                }
            }
        }
        screw_length = 10;
        difference() {
            translate([ pcb_thickness + gpu_thickness, hole_base_x - 8, 1 ]) {
                color("#AFAFAF") cube([4 - 0.01, hole_dis_x + 16, hole_dis_y + (hole_base_y) * 2]);            
            }
            mounting_screws();
        }
        module stackup(amount, space) {
            for (i = [0 : amount - 1]) {
                translate([0, 0, space * i]) {
                    children(0);
                }
            }
        }
        color("#AFAFAF") difference() {
            translate([pcb_thickness + gpu_thickness + 2, 10, 4]) {
                stackup(130, 1) {
                    cube([40.64, 166.18, 0.2]);
                }
                cube([2, 166.18, 130 - 0.8]);
            }
            translate([pcb_thickness, (pcb_length - 40.8) / 2 - 2, pcb_height - 13.3]) {
                cube([20, 40.8 + 4, 20]);
            }
        }
        mounting_screws();
    }

    module back_plate() {
        color("#AFAFAF") translate([ -2.67, 0, 0 ]) {
            cube([2.67 - 1.1, pcb_length, pcb_height]);
        }
    }

    translate([ -pcb_thickness / 2, -57.15, 0 ]) {
        pcb();
        union() {
            color("#000000") io_bracket(tab = true); 
            if (slots > 1) {
                translate([20.32, 0, 0]) lineup(slots - 1, 20.32) {
                    color("#000000") io_bracket();
                };
            }
        }
        cooler();
        back_plate();
    }
}
