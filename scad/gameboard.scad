module base(die_size, rows, columns) {
    cube([(die_size * rows) + (die_size * (rows - 1)) + ((die_size / 3) * 2),
          (die_size * columns) + (die_size * (columns - 1)) + ((die_size / 3) * 2),
          die_size / 4]);
}

module depressions(die_size, rows, columns) {
    for (row=[0:2:(rows - 1) * 2]) {
        for (column=[0:2:(columns - 1) * 2]) {
            translate([(row * die_size) + (die_size / 3),
                       (column * die_size) + (die_size / 3),
                       (die_size / 4) - (1 + 1)]) {
                cube([die_size + 0.5, die_size + 0.5, 1 + 1]);
            }
        }
    }
}

module gameboard(die_size, rows, columns) {
    difference() {
        // The pad.
        base(die_size, rows, columns);
        // Rows and columns of dice outlines.
        depressions(die_size, rows, columns);
    }
}
    
die_size = 12;
rows = 3;
columns = 3;

gameboard(die_size, rows, columns);
