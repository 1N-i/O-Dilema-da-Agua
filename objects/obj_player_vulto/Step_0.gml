// Só funciona na sala Ccozinha
if (room_get_name(room) != "Ccozinha") {
    exit;
}

if (visible && instance_exists(obj_player)) {
    // Mantém o mesmo tamanho do player
    image_xscale = obj_player.image_xscale;
    image_yscale = obj_player.image_yscale;

    // Move em direção ao player
    move_towards_point(obj_player.x, obj_player.y, velocidade);

    // Calcula diferença de posição para decidir direção
    var dx = obj_player.x - x;
    var dy = obj_player.y - y;

    var parado_frente = false;
    var andando_frente = false;
    var parado_esquerda = false;
    var andando_esquerda = false;
    var parado_cima = false;
    var andando_cima = false;
    var parado_direita = false;
    var andando_direita = false;

    var movendo = (dx != 0 || dy != 0);

    if (movendo) {
        if (abs(dy) > abs(dx)) {
            if (dy > 0) {
                andando_frente = true;
                direcao_olhando = 0; // baixo
            } else {
                andando_cima = true;
                direcao_olhando = 2; // cima
            }
        } else {
            if (dx < 0) {
                andando_esquerda = true;
                direcao_olhando = 1; // esquerda
            } else {
                andando_direita = true;
                direcao_olhando = 3; // direita
            }
        }
    } else {
        if (direcao_olhando == 0) parado_frente = true;
        if (direcao_olhando == 1) parado_esquerda = true;
        if (direcao_olhando == 2) parado_cima = true;
        if (direcao_olhando == 3) parado_direita = true;
    }

    // Sistema de mudança de sprite (igual ao player)
    if (parado_frente) {
        quadro_inicio = 0;
        quadro_fim = 3;
    } else if (andando_frente) {
        quadro_inicio = 12;
        quadro_fim = 15;
    } else if (parado_esquerda) {
        quadro_inicio = 4;
        quadro_fim = 7;
    } else if (andando_esquerda) {
        quadro_inicio = 16;
        quadro_fim = 19;
    } else if (parado_cima) {
        quadro_inicio = 8;
        quadro_fim = 11;
    } else if (andando_cima) {
        quadro_inicio = 20;
        quadro_fim = 23;
    } else if (parado_direita) {
        quadro_inicio = 4;
        quadro_fim = 7;
    } else if (andando_direita) {
        quadro_inicio = 16;
        quadro_fim = 19;
    }

    // Controle da animação
    if (quadro_inicio != quadro_fim) {
        image_index += velocidade_animacao;
        if (image_index > quadro_fim + 1 || image_index < quadro_inicio) {
            image_index = quadro_inicio;
        }
    } else {
        image_index = quadro_inicio;
    }

    // Colisão com player
    if (place_meeting(x, y, obj_player)) {
        global.tela_preta_timer = 120; // tela preta por 2 segundos
		global.agua_benta = true
        instance_destroy(); // vulto desaparece
    }
}
