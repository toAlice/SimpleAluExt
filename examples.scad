include<extrusions.scad>

include<connectors.scad>

include<screws.scad>

include<gpu.scad>

include<mainboard.scad>

include<chassis.scad>

// mITX, mDTX, mATX, ATX, EATX
atxmobo("ATX");
for (i = [0: 6]) {
    translate([ 162.26 + 20.32 * i, 57.1, 16.15 ]) {
        graphics_card(slots = 1);
    }
}
