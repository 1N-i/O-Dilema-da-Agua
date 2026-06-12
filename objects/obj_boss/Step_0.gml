// Verifica se o obj_player existe na sala
if (instance_exists(obj_player)) {
    // Inicializa as velocidades locais
    var velocidade_x = 0;
    var velocidade_y = 0; 
    
    var distancia_parada = 50; // Distância mínima para o inimigo parar
    
    // Calcula a distância exata em linha reta e o ângulo até o player
    var distancia_total = point_distance(x, y, obj_player.x, obj_player.y);
    var direcao_para_o_player = point_direction(x, y, obj_player.x, obj_player.y);
    
    // Diminui os timers se estiverem ativos
    if (tempo_espera > 0) {
        tempo_espera -= 1;
        
        // Quando o tempo de espera zerar ativa a recuperação
        if (tempo_espera <= 0) {
            tempo_recuperacao = 0.5 * game_get_speed(gamespeed_fps); // Ex: 2 segundos levantando
        }
    }
    
    if (tempo_recuperacao > 0) {
        tempo_recuperacao -= 1;
    }
    
    // SE CHEGOU PERTO DO PLAYER E NÃO ESTÁ ESPERANDO: Ativa o timer e gruda uma vez
    if (distancia_total <= distancia_parada && tempo_espera <= 0) {
        tempo_espera = 3 * game_get_speed(gamespeed_fps); // Ativa os 5 segundos
        

    }
    
    // 3. MOVIMENTAÇÃO (Só anda se todos os timers tiverem terminado)
    if (tempo_espera <= 0 && tempo_recuperacao <= 0) {
        if (distancia_total > distancia_parada) {
            velocidade_x = lengthdir_x(velocidade_movimento, direcao_para_o_player);
            velocidade_y = lengthdir_y(velocidade_movimento, direcao_para_o_player);
            
            // Aplica o movimento na posição do inimigo
            x += velocidade_x;
            y += velocidade_y;
        }
    }

    // Animação
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
        // Usa o ângulo para saber para onde ir
        // 0° = Direita; 90° = Cima; 180° = Esquerda; 270° = Baixo;
        if (direcao_para_o_player >= 45 && direcao_para_o_player < 135) {
            andando_cima = true;
            direcao_olhando = 2; // Cima
        } else if (direcao_para_o_player >= 135 && direcao_para_o_player < 225) {
            andando_esquerda = true;
            direcao_olhando = 1; // Esquerda
        } else if (direcao_para_o_player >= 225 && direcao_para_o_player < 315) {
            andando_frente = true;
            direcao_olhando = 0; // Baixo
        } else {
            andando_direita = true;
            direcao_olhando = 3; // Direita
        }
    } else { 
        // Mantém a última direção quando o inimigo parar
        if (direcao_olhando == 0) { parado_frente = true; }
        if (direcao_olhando == 1) { parado_esquerda = true; }
        if (direcao_olhando == 2) { parado_cima = true; }
        if (direcao_olhando == 3) { parado_direita = true; }
    }

    // Mudança de sprites
    if (tempo_espera > 0) {
        quadro_inicio = 1;
        quadro_fim = 7;
	} else if (tempo_recuperacao > 0) {
		quadro_inicio = 4;
        quadro_fim = 7; 
	} else if (parado_frente) {
        quadro_inicio = 0;
        quadro_fim = 0;
    } else if (andando_frente) {
        quadro_inicio = 0;
        quadro_fim = 0; 
    } else if (parado_esquerda) {
        quadro_inicio = 0;
        quadro_fim = 0;
    } else if (andando_esquerda) {
        quadro_inicio = 0;
        quadro_fim = 0; 
    } else if (parado_cima) {
        quadro_inicio = 0;
        quadro_fim = 0;
    } else if (andando_cima) {
        quadro_inicio = 0;
        quadro_fim = 0; 
    } else if (parado_direita) {
        quadro_inicio = 0;
        quadro_fim = 0;
    } else if (andando_direita) {
        quadro_inicio = 0;
        quadro_fim = 0;
    }

    // Controle da animação 
    if (quadro_inicio != quadro_fim) {
        if (tempo_espera > 0 && image_index >= quadro_fim) {
            image_index = quadro_fim; 
        } 
        // Se estiver recuperando, roda a animação de trás para frente pra economizar sprites
        else if (tempo_recuperacao > 0) {
            image_index -= velocidade_animacao; 
            
            // Se passar do quadro inicial (que agora é o menor valor), volta para o fim (maior valor)
            if (image_index < quadro_inicio || image_index > quadro_fim) {
                image_index = quadro_fim;
            }
        } 
        // Animação normal para frente
        else {
            image_index += velocidade_animacao;
            if (image_index > quadro_fim + 1 || image_index < quadro_inicio) {
                image_index = quadro_inicio;
            }
        }
    } else { 
        image_index = quadro_inicio;
    }

    
} else {
    quadro_inicio = 0;
    image_index = quadro_inicio;
}

//vida e tals
if (vida_atraso > vida_atual) { //Ao tomar dano, animação da barra diminuindo
    //Barra "fantasma" diminui suavemente em direção à barra real
    vida_atraso = lerp(vida_atraso, vida_atual, velocidade_queda_atraso);
    if (vida_atraso - vida_atual < 0.1) {
        vida_atraso = vida_atual;
    }
}

if (vida_atual <= 0) {
	global.boss_derrotado = true;
    instance_destroy();
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