// CC BY-SA, FHNW (University of Applied Sciences and Arts Northwestern Switzerland)

$fn = 360;
d = 3;
bb_wx = 47;
bb_wy = 35;
bb_h = 10;

module cane() {
    translate([-2, 0, -50]) cylinder(h=250, d=10.5);
}

module breadboard() {
    color("white") cube([bb_wx, bb_wy, bb_h]);
}

module inlay() {
    color("black") difference() {
        translate([-25, -(bb_wy - 2 * d)/2, 0]) cube([bb_wx + 25, bb_wy - 2 * d, bb_h - 2]);
        translate([-1 - 25, 0, 20]) rotate([0, 90, 0]) cylinder(h=bb_wx + 25 + 2, r=18);
    }
}

module spacer() {
    color("black") difference() {
        translate([0, -(bb_wy - 2 * d)/2, 0]) cube([12, bb_wy - 2 * d, bb_h - 2]);
        translate([-1, 0, 20]) rotate([0, 90, 0]) cylinder(h=12 + 2, r=18);
    }
}

module nrf() {
    color("grey") cube([51, 23, 6]);
}

module nicla() {
    color("grey") cube([23, 23, 6]);
}

module side() {
    rotate([90, 0, 0]) {
        hull() {
            translate([8.6, 8.6, 0]) cylinder(h=d, r=d);
            translate([bb_h + 7.4, 0, 0]) cylinder(h=d, r=d);
            translate([bb_h + 7.4 + bb_wx, 0, 0]) cylinder(h=d, r=d);
            translate([bb_h + 7.4 + bb_wx, bb_h + 7.4 + bb_wx, 0]) cylinder(h=d, r=d);
            translate([bb_h + 7.4 + 1 + bb_wx + bb_h, bb_h + 7.4 - 1 + bb_wx - bb_h, 0]) cylinder(h=d, r=d);
        }
    }
}

//view = 0; // just wood
//view = 1; // with cane
//view = 2; // with electronics
//view = 3; // with 3d-printed inlays

module assembly(view) {
    if (view >= 1) {
        rotate([0, 45, 0]) cane();
    }
    difference() {
        union() {
            translate([0, bb_wy/2, 0]) side();
            translate([0, -bb_wy/2 + d, 0]) side();
        }
        translate([bb_h + 7.4, -bb_wy/2, 0]) breadboard();
        rotate([0, -45, 0]) {
            translate([bb_wx - d - 14, -bb_wy/2, -15 + 10 - d]) cube([2 * d, bb_wy, d]);
            translate([bb_wx - d, -bb_wy/2, -15]) breadboard();
        }
    }
    if (view >= 2) {
        rotate([0, -45, 0]) {
            translate([bb_wx - d, +0.1 - bb_wy/2, -15]) breadboard();
            translate([bb_wx - d -0.5, - 23/2, -21]) nrf();
            if (view >= 3) {
                translate([bb_wx - d, 0, -5]) inlay();
            }
        }
        translate([bb_h + 7.4, +0.1 - bb_wy/2, 0]) breadboard();
        translate([bb_h + 7.4, +0.1 - 23/2, -6]) nicla();
        if (view >= 3) {
            translate([52.5, 0, 10]) spacer();
        }
    }
}

module laser_parts() {
    projection() {
        rotate([90, 0, 0]) assembly(0);
        rotate([90, 0, 180]) translate([-80, 0, -92]) assembly(0);
    }
}

module 3d_parts() {
    inlay();
    translate([-40, 0, 0]) spacer();
}

module render_all() {
    assembly(3);
}

render_all();
//laser_parts();
//3d_parts();