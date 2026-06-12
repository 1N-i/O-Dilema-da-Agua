if (global.jogo_pausado || (variable_global_exists("interagindo") && global.interagindo)) {
    exit;
}

var mover_cima = keyboard_check(ord("W")) || keyboard_check(vk_up);
var mover_baixo = keyboard_check(ord("S")) || keyboard_check(vk_down);
var mover_esquerda = keyboard_check(ord("A")) || keyboard_check(vk_left);
var mover_direita = keyboard_check(ord("D")) || keyboard_check(vk_right);

var atacar = mouse_check_button_pressed(mb_left);

if (!instance_exists(obj_dialogo)) {
	//Calcula a velocidade resultante nos eixos X e Y
	var velocidade_x = (mover_direita - mover_esquerda) * velocidade_movimento;
	var velocidade_y = (mover_baixo - mover_cima) * velocidade_movimento;

	//Move o player
	x += velocidade_x;
	y += velocidade_y;

	var parado_frente = false;
	var andando_frente = false;
	var parado_esquerda = false;
	var andando_esquerda = false;
	var parado_cima = false;
	var andando_cima = false;
	var parado_direita = false;
	var andando_direita = false;

	var movendo = (velocidade_x != 0 || velocidade_y != 0);
	
	if (movendo) { //Se estiver andando, descobrimos a direção
	    if (velocidade_y > 0) {
	        andando_frente = true;
	        direcao_olhando = 0; //Baixo
	    } else if (velocidade_y < 0) {
	        andando_cima = true;
	        direcao_olhando = 2; //Cima
	    } else if (velocidade_x < 0) {
	        andando_esquerda = true;
	        direcao_olhando = 1; //Esquerda
	    } else if (velocidade_x > 0) {
	        andando_direita = true;
	        direcao_olhando = 3; //Direita
	    }
	
	} else { //Se não estiver se movendo, olha para a última direção gravada
	    if (direcao_olhando == 0) { parado_frente = true; }
	    if (direcao_olhando == 1) { parado_esquerda = true; }
	    if (direcao_olhando == 2) { parado_cima = true; }
	    if (direcao_olhando == 3) { parado_direita = true; }
	}

	//Sistema de mudança de sprite
	if (parado_frente) {
		image_xscale = 2; //Deixa o sprite normal
	    quadro_inicio = 0;
	    quadro_fim = 3; //Quadros 0, 1, 2 e 3
	} else if (andando_frente) {
		image_xscale = 2; //Deixa o sprite normal
	    quadro_inicio = 12;
	    quadro_fim = 15 ; //Quadros 12, 13, 14 e 15
	} else if (parado_esquerda) {
		image_xscale = -2; //Inverte o sprite
	    quadro_inicio = 4;
	    quadro_fim = 7; //Quadros 4, 5, 6 e 7
	} else if (andando_esquerda) {
		image_xscale = -2; //Inverte o sprite
	    quadro_inicio = 16;
	    quadro_fim = 19; //Quadros 16, 17, 18 e 19
	} else if (parado_cima) {
		image_xscale = 2; //Deixa o sprite normal
	    quadro_inicio = 8;
	    quadro_fim = 11; //Quadros 8, 9, 10 e 11
	} else if (andando_cima) {
		image_xscale = 2; //Deixa o sprite normal
	    quadro_inicio = 20;
	    quadro_fim = 23; //Quadros 20, 21, 22 e 23
	} else if (parado_direita) {
		image_xscale = 2; //Deixa o sprite normal
	    quadro_inicio = 4;
	    quadro_fim = 7; //Quadros 4, 5, 6 e 7
	} else if (andando_direita) {
		image_xscale = 2; //Deixa o sprite normal
	    quadro_inicio = 16;
	    quadro_fim = 19; //Quadros 16, 17, 18 e 19
	}
}

//Controle da animação
if (quadro_inicio != quadro_fim) {
    //Avança os quadros com a velocidade que escolhemos
    image_index += velocidade_animacao;
    if (image_index > quadro_fim + 1 || image_index < quadro_inicio) {
        image_index = quadro_inicio;
    }
} else { //Se for uma "animação" parada, trava nela
    image_index = quadro_inicio;
}

if (nome_da_room == "Dsala_roguelike") { //Condição de room pro ataque
	if (atacar && pode_atacar) { //Ataque da "espada"
	    pode_atacar = false; 
	    // Cria o objeto da espada exatamente onde o player está
	    var espada = instance_create_layer(x, y, "Instances", obj_ataque_espada);
	    var angulo_mouse = point_direction(x, y, mouse_x, mouse_y);
    
	    // Aplica o ângulo exato na espada
	    espada.image_angle = angulo_mouse; 
	}
	//Se a espada sumiu da tela, o player pode atacar de novo
	if (!instance_exists(obj_ataque_espada)) {
	    pode_atacar = true;
	}
}

// tempo de invencibilidade
if (invencivel) {
    tempo_invencibilidade -= 1;
    
    // Faz o player piscar
    if (tempo_invencibilidade % 2 == 0) { visible = false; } 
	else { visible = true; }
    
    // Quando o tempo acabar, desliga a invencibilidade e volta a ficar visível
    if (tempo_invencibilidade <= 0) {
        invencivel = false;
        visible = true;
    }
}

//averigua se tem algum inimigo encostando no player
var inimigo_colisao = instance_place(x, y, obj_inimigo);

if (inimigo_colisao != noone && !invencivel) {
    vida_atual -= 25; // Qtd de dano que o inimigo dá
    
    // Ativa a invencibilidade do player
    invencivel = true;
    tempo_invencibilidade = 90;
}

//agora averigua se o boss tá encostando no player
var boss_colisao = instance_place(x, y, obj_boss);

if (boss_colisao != noone && !invencivel) {
	if (boss_colisao.sprite_index == spr_boss && floor(boss_colisao.image_index) == 7) {
    vida_atual -= 25; // qtd de dano que o boss dá
    
    invencivel = true;
    tempo_invencibilidade = 90;
	}
}

//Ao tomar dano, animação da barra diminuindo
if (vida_atraso > vida_atual) {
    //Barra "fantasma" diminui suavemente em direção à barra real
    vida_atraso = lerp(vida_atraso, vida_atual, velocidade_queda_atraso);
    if (vida_atraso - vida_atual < 0.1) {
        vida_atraso = vida_atual;
    }
}

// Sistema de morte
if (vida_atual <= 0) {
    // n sei como vai ser a morte ent só botei pra reiniciar a sala
    room_restart(); 
}

//Camera
var cam = view_camera[0]; //Pega o ID da câmera na room

var cam_larga = camera_get_view_width(cam);
var cam_alta  = camera_get_view_height(cam);

var alvo_x = x - (cam_larga / 2);
var alvo_y = y - (cam_alta / 2);

alvo_x = clamp(alvo_x, 0, room_width - cam_larga);
alvo_y = clamp(alvo_y, 0, room_height - cam_alta);

var cam_atual_x = camera_get_view_x(cam);
var cam_atual_y = camera_get_view_y(cam);

var nova_pos_x = lerp(cam_atual_x, alvo_x, 0.05); //0.05 -> 5% em direção ao player por frame
var nova_pos_y = lerp(cam_atual_y, alvo_y, 0.05);
camera_set_view_pos(cam, nova_pos_x, nova_pos_y); //Aplica a nova posição na câmera

// Música Roguelike
if (room_get_name(room) == "Aquarto_inicial" && !musica_iniciada) {
    if (global.player != noone && !instance_exists(obj_dialogo)) { 
        audio_sound_gain(background, 1, 0); // Garante volume max
        audio_play_sound(background, 10, true);
        musica_iniciada = true;
    }
}

// Para a música se todos os inimigos forem derrotados
if (audio_is_playing(roguelike) && !fade_iniciado) {
    
    if (!instance_exists(obj_spawn_point) && !instance_exists(obj_boss)) {
        audio_sound_gain(roguelike, 0, 1500); // Abaixa o volume suavemente
        fade_iniciado = true;
    }
}

