// This is the actual board.
// Originally spaced for small 12mm dice which comes 36 to a container from Chessex.
// You could reduce the empty spacing between the dice but this gives you room to
// pick them up or manipulate them.
//
// The spacing assumes a die whose dimensions are an even number. If that does not
// hold up them maybe this needs more parameters.
module base(die_size, rows, columns) {
    cube([(die_size * rows) + (die_size * (rows - 1)) + ((die_size / 3) * 2),
          (die_size * columns) + (die_size * (columns - 1)) + ((die_size / 3) * 2),
          die_size / 4]);
}

// The dice sit in shallow depressions on the board. Same as above, assumptions about
// the dimensions of the die hold here too.
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

// Roll it all together and define a gameboard as a base with depressions carved into it.
module gameboard(die_size, rows, columns) {
    difference() {
        // The pad.
        base(die_size, rows, columns);
        // Rows and columns of dice outlines.
        depressions(die_size, rows, columns);
    }
}

// Default values.
die_size = 12;
rows = 3;
columns = 3;

gameboard(die_size, rows, columns);
