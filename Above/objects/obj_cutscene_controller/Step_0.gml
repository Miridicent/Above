// obj_cutscene_controller Step Event

if (!global.cutscene_active) exit;

if (current_step >= array_length(cutscene_steps)) {
    global.cutscene_active = false;
    instance_destroy(); // Cutscene finished
    exit;
}

var step = cutscene_steps[current_step];

if (!variable_global_exists("step_started")) step_started = false;
if (!step_started) {
    if (is_undefined(step.action) == false) {
        step.action();
    }
    step_started = true;
}

var wait_for_text = false;
if (variable_struct_exists(step, "wait_for_textbox")) {
    wait_for_text = step.wait_for_textbox && instance_exists(obj_textbox);
}

if (wait_for_text) {
    if (!instance_exists(obj_textbox)) {
        current_step++;
        step_timer = 0;
        step_started = false;
    }
} else {
    step_timer++;
    if (step_timer >= step.time) {
        current_step++;
        step_timer = 0;
        step_started = false;
    }
}