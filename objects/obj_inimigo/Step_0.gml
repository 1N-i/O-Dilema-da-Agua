if (global.jogo_pausado) {
    exit; // interrompe o Step enquanto pausado
}

//Verifica se o obj_player existe na sala
if (instance_exists(obj_player)) {
    //Inicializa as velocidades locais
    var velocidade_x = 0;
    var velocidade_y = 0;
    
    var distancia_parada = 4; //Distância mínima para o inimigo parar
    
    //Calcula a distância exata em linha reta e o ângulo até o player
    var distancia_total = point_distance(x, y, obj_player.x, obj_player.y);
    var direcao_para_o_player = point_direction(x, y, obj_player.x, obj_player.y);
    
    //Movimentação
    if (distancia_total > distancia_parada  && tempo_congelado <= 0) {
        //lengthdir decompõe a velocidade no ângulo certo
        velocidade_x = lengthdir_x(velocidade_movimento, direcao_para_o_player);
        velocidade_y = lengthdir_y(velocidade_movimento, direcao_para_o_player);
    }
    //Aplica o movimento na posição do inimigo
    x += velocidade_x;
    y += velocidade_y;

    //Animação
    var parado_frente = false;
    var andando_frente = false;
    var parado_esquerda = false;
    var andando_esquerda = false;
    var parado_cima = false;
    var andando_cima = false;
    var parado_direita = false;
    var andando_direita = false;

    var movendo = (velocidade_x != 0 || velocidade_y != 0);
    if (movendo) { 
        //Usa o ângulo para saber para onde ir
        //0° = Direita; 90° = Cima; 180° = Esquerda; 270° = Baixo;
        if (direcao_para_o_player >= 45 && direcao_para_o_player < 135) {
            andando_cima = true;
            direcao_olhando = 2; //Cima
        } else if (direcao_para_o_player >= 135 && direcao_para_o_player < 225) {
            andando_esquerda = true;
            direcao_olhando = 1; //Esquerda
        } else if (direcao_para_o_player >= 225 && direcao_para_o_player < 315) {
            andando_frente = true;
            direcao_olhando = 0; //Baixo
        } else {
            andando_direita = true;
            direcao_olhando = 3; //Direita
        }
    } else { 
        //Mantém a última direção quando o inimigo parar
        if (direcao_olhando == 0) { parado_frente = true; }
        if (direcao_olhando == 1) { parado_esquerda = true; }
        if (direcao_olhando == 2) { parado_cima = true; }
        if (direcao_olhando == 3) { parado_direita = true; }
    }


    //Mudança de sprites
    if (parado_frente) {
        quadro_inicio = 0;
        quadro_fim = 0;
    } else if (andando_frente) {
        quadro_inicio = 0;
        quadro_fim = 0; 
    } else if (parado_esquerda) {
        quadro_inicio = 3;
        quadro_fim = 3;
    } else if (andando_esquerda) {
        quadro_inicio = 3;
        quadro_fim = 3; 
    } else if (parado_cima) {
        quadro_inicio = 2;
        quadro_fim = 2;
    } else if (andando_cima) {
        quadro_inicio = 2;
        quadro_fim = 2; 
    } else if (parado_direita) {
        quadro_inicio = 1;
        quadro_fim = 1;
    } else if (andando_direita) {
        quadro_inicio = 1;
        quadro_fim = 1;
    }

    //Controle da animação
    if (quadro_inicio != quadro_fim) {
        image_index += velocidade_animacao;
        if (image_index > quadro_fim + 1 || image_index < quadro_inicio) {
            image_index = quadro_inicio;
        }
    } else { 
        image_index = quadro_inicio;
    }
    
} else {
    //Se o obj_player sumir, o inimigo fica parado olhando para frente
    quadro_inicio = 0;
    image_index = quadro_inicio;
}

if (vida_atual <= 0) {
	global.inimigos_derrotados += 1;
    instance_destroy();
} 

if (tempo_congelado > 0) {
    tempo_congelado -= 1;
}

if (invencivel) {
    tempo_invencibilidade -= 1;
    
    //faz piscar transitando durantes os frames ímpares e pares
    if (tempo_invencibilidade % 2 == 0) {
        visible = false;
    } else {
        visible = true;
    }
    
    // Quando o tempo da invencibilidade acabar, volta ao normal
    if (tempo_invencibilidade <= 0) {
        invencivel = false;
        visible = true;
    }
}
