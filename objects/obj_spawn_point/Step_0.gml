if (global.inimigos_derrotados >= 5) {
	global.inimigos_derrotados = 0;
	instance_create_layer(x, y, "Instances", obj_boss, {depth: -100});
	instance_destroy();
}