//Limite: Só cria o inimigo se existirem 5 ou menos obj_inimigo na sala
if (instance_number(obj_inimigo) <= 5) {
	var angulo = random(360); //Escolhe um ângulo aleatório
	var distance = random_range(400, 600); // Escolhe uma distância aleatória fora da tela
        
    //Calcula a posição X e Y baseada no player
	var spawn_x = obj_player.x + lengthdir_x(distance, angulo);
	var spawn_y = obj_player.y + lengthdir_y(distance, angulo);
	spawn_x = clamp(spawn_x, 50, room_width - 50);
	spawn_y = clamp(spawn_y, 50, room_height - 50);
        
    //Cria o inimigo
	instance_create_layer(spawn_x, spawn_y, "Instances", obj_inimigo);
}

//Reseta o alarme para criar outro inimigo
alarm[0] = tempo_spawn;