dice_size = 12;

module base() {
    cube([(dice_size * 3) + (dice_size * 2) + ((dice_size / 3) * 2),
          (dice_size * 3) + (dice_size * 2) + ((dice_size / 3) * 2),
          dice_size / 4]);
}

module depressions() {
    for (row=[0:2:4]) {
        for (column=[0:2:4]) {
            translate([(row * dice_size) + (dice_size / 3),
                       (column * dice_size) + (dice_size / 3),
                       (dice_size / 4) - (1 + 1)]) {
                cube([dice_size + 0.5, dice_size + 0.5, 1 + 1]);
            }
        }
    }
}

difference() {
    // The pad.
    base();
    // Rows and columns of dice outlines.
    depressions();
}
