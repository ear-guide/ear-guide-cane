// CC BY-SA 4.0, FHNW (University of Applied Sciences and Arts Northwestern Switzerland)

translate([0, 0, 20]) rotate([0, 180, 0]) 
difference() {
    union() {
        translate([-2.5, 0, 15]) cube([21 + 2 * 2.5, 11, 5]);
        translate([0, 0, 5]) cube([21, 11, 10]);
        cube([18, 11, 5]);
    }
    translate([(18 - 10) / 2, 0, 0]) cube([10, 6, 20]);
    translate([(18 - 10) / 2, 5, 0]) cube([10, 6, 15]);
}