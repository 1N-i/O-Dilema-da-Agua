var distancia = point_distance(x, y, obj_player.x, obj_player.y);
perto_do_player = (distancia <= 64);

// Se estiver perto e apertar "E"
if (perto_do_player && keyboard_check_pressed(ord("E"))) {
    
    // Adiciona o sprite na lista global do inventário
    array_push(global.inventario, sprite_index);
    
    // Destrói o item (agora está na mochila)
    instance_destroy();
    
    // Verifica se o jogador pegou todos os itens
    if (array_length(global.inventario) == global.total_itens_sala) {
        // Mostra a mensagem
        falas_interacao = ["A porta se abriu!"];
        
        // Destroi o objeto interagível (porta)
        with (obj_interagivel) {
            instance_destroy();
        }
    }
}
