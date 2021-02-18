include<extrusions.scad>

include<connectors.scad>

include<screws.scad>

include<gpu.scad>

include<mainboard.scad>

include<chassis.scad>

module lineup(num, space) {
    for (i = [0 : num - 1]) {
        translate([space * i, 0, 0]) children(0);
    }
}

// mITX, mDTX, mATX, ATX, EATX
atxmobo("ATX");
translate([ 162.26 , 57.1, 16.15 ]) {
    lineup(2, 60.96) {
        graphics_card();
    }
}

