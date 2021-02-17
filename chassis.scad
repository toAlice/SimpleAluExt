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