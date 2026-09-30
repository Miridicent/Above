// Step Event of the Pressure Plate object

// Check if player is currently on the plate
if (place_meeting(x, y, Player)) {
    On = true;

    // Only increase progress the first time the player steps on
    if (!was_on) {
        Wrldinfo.one = true;
        Wrldinfo.Puzzle_progress++;
    }

    was_on = true; // Remember that the player was on the plate
}
else {
    On = false;
    was_on = false; // Reset state if player leaves
}

// Set sprite frame
if (On) {
    image_index = 1;
}
else {
    image_index = 0;
}

