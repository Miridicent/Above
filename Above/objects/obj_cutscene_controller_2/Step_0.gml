// obj_cutscene_controller - Step Event

if (!global.cutscene_active) exit;

// If finished all steps, end cutscene and destroy controller
if (current_step >= array_length(cutscene_steps)) {
    global.cutscene_active = false;
    instance_destroy();
    exit;
}

var step = cutscene_steps[current_step];

// Initialize the 'ran' flag for this step if it doesn't exist yet
if (!variable_struct_exists(step, "ran")) {
    cutscene_steps[current_step].ran = false;
}

// Run the step's action exactly once
if (!cutscene_steps[current_step].ran) {
    if (!is_undefined(step.action)) {
        step.action();
    }
    cutscene_steps[current_step].ran = true;
}

// Determine if we should wait for textbox to close before proceeding
var wait_for_text = false;
if (variable_struct_exists(step, "wait_for_textbox")) {
    wait_for_text = step.wait_for_textbox && instance_exists(obj_textbox);
}

// Progress to next step if not waiting for textbox, or textbox closed
if (wait_for_text) {
    // Wait until textbox is gone
    if (!instance_exists(obj_textbox)) {
        current_step++;
        step_timer = 0;
        step_started = false;
    }
} else {
    // Proceed based on timer
    step_timer++;
    if (step_timer >= step.time) {
        current_step++;
        step_timer = 0;
        step_started = false;
    }
}

// Reset 'ran' flag for the new step if it exists
if (current_step < array_length(cutscene_steps)) {
    if (!variable_struct_exists(cutscene_steps[current_step], "ran")) {
        cutscene_steps[current_step].ran = false;
    }
}


	



