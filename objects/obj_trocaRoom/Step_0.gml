 // Se o player encostar no obj_trocaRoom
if (other.object_index == obj_player) {

    // Caso atual seja a Bsala_puzzle
    if (room == Bsala_puzzle) {
        // Verifica se ainda existem itens coletáveis não pegos
        if (instance_exists(obj_item_coletavel)) {
            // Bloqueia a passagem
            show_debug_message("Colete todos os itens antes de sair!");
            exit;
        }
    }

    // Se não estiver na Bsala_puzzle ou já coletou tudo, libera a troca
    fading = true 
}

if (fading) {
    alpha_fade += velocidade_fade; // Vai escurecendo a tela
    
    // Quando a tela ficar preta, muda a sala
    if (alpha_fade >= 1) {
        alpha_fade = 1;
        fading = false; 
        room_goto_next();
    }
}
