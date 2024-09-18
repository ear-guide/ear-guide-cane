// CC BY-SA 4.0, FHNW (University of Applied Sciences and Arts Northwestern Switzerland)

$fn = 360;

module pipe(h, ri, ro) {
    difference() {
        cylinder(h, ro, ro);
        #translate([0, 0, 0]) cylinder(h, ri, ri);
    }
}

module breadboard() {
    translate([-35/2, 0, 0]) cube([35, 47, 9.5]);
}

module block() {
    difference() {
        hull() {
            pipe(20, 12.2, 14.2);
            translate([-19.5, 12, 0]) cube([39, 47 + 4, 20]);
        }
        translate([0, 0, -1]) cylinder(20 + 2, 12.2, 12.2);
        translate([0, 14 + 47/2 - 6, -1]) cylinder(40 + 2, 6, 6); // pen hole
        #translate([0, 14, 20 - 9.5 + .1]) breadboard();
        #translate([0, 24, -30]) rotate([45, 0, 0]) breadboard();
        translate([-19.5 - 1, 55, -30]) rotate([45, 0, 0]) cube([39 + 2, 38, 20]);
    }
}

module base() {
    difference() {
        union() {
            translate([0, 0, 6]) pipe(20 + 6, 10, 12);
            pipe(6, 10, 14);
        }
        #translate([-15, -2, 2]) cube([30, 4, 4]);
        #translate([0, 0, 2]) pipe(2, 13, 15);
        #translate([-13, -2, 26]) cube([26, 4, 4]);
        #translate([0, 0, 28]) pipe(2, 11, 13);
    }
}

translate([0, 0, 6]) block();
//translate([0, 2 * 14 + 2, 0]) block();
base();
