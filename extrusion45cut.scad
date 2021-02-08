include <extrusion.scad>


module extrusion45cut(
    sidelen,
    height,
    notch,
    thickness,
    center_diameter,
    center_sidelen,
    long_base,
    center=false) {
    module prism(sidelen, height, sidelen_offset=0, height_offset=0) {
        polyhedron(
            points=[
                // 0
                [sidelen_offset, sidelen_offset, 
                height + height_offset],
                // 1
                [sidelen + sidelen_offset, sidelen_offset, 
                height + height_offset],
                // 2
                [sidelen + sidelen_offset, sidelen + sidelen_offset, 
                height + height_offset],
                // 3
                [sidelen_offset, sidelen + sidelen_offset, 
                height + height_offset],
                // 4 
                [sidelen + sidelen_offset, sidelen + sidelen_offset, 
                height + height_offset - sidelen],
                // 5
                [sidelen_offset, sidelen + sidelen_offset, 
                height + height_offset - sidelen],
            ],
            faces=[
                [3, 2, 1, 0],
                [2, 3, 5, 4],
                [4, 5, 0, 1],
                [3, 0, 5],
                [1, 2, 4],
            ]
        );
    }
    difference() {
        extrusion(
            sidelen, 
            height,
            notch, 
            thickness, 
            center_diameter,
            center_sidelen,
            long_base,
            center);

        if (center) {
            prism(sidelen, height, -sidelen / 2, -height / 2);
        } else {
            prism(sidelen, height);
        }
    }
}

// extrusion45cut(sidelen=20, 
//           height=40, 
//           notch=6.2, 
//           thickness=1.5, 
//           center_diameter=6.0, 
//           center_sidelen=10,
//           long_base=14,
//           center=true);
