var _objeto_no_mesmo_lugar = instance_position(964.5, 757, obj_interagivel)

if (global.agua_benta == true) {
	var porta = instance_create_layer(x, y, layer, obj_trocaRoom);
    porta.image_xscale = image_xscale;
    porta.image_yscale = image_yscale;
	instance_destroy(_objeto_no_mesmo_lugar);
	instance_destroy()
}