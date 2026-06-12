if (visible) {
    var shader_index = asset_get_index("sh_inverter");

    if (shader_index != -1) {
        draw_set_shader(shader_index);
        draw_self();
        draw_set_shader(shader_default);
    } else {
        draw_self();
    }
}
