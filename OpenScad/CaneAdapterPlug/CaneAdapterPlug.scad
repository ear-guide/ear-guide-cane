// CC BY-SA 4.0, FHNW (University of Applied Sciences and Arts Northwestern Switzerland)

module plug(d) {
    difference() {
        cube([35, 47, 9.5]);
        translate([d, d, d]) cube([35 - 2 * d, 47 - 2 * d, 9.5 - d]);
    }
}

plug(1.6);