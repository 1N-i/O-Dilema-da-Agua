// Usa o sprite do player
if (instance_exists(obj_player)) {
    sprite_index = obj_player.sprite_index;
} else {
    sprite_index = spr_player_idle;
}

// Posição inicial
x = obj_player.xstart;
y = obj_player.ystart;

// Escala normal
image_xscale = 1;
image_yscale = 1;

// Começa invisível
visible = false;

// Velocidade de movimento
velocidade = 5;

// Velocidade da animação (igual ao player)
velocidade_animacao = 0.25;

// Direção inicial
direcao_olhando = 0; // 0=baixo, 1=esquerda, 2=cima, 3=direita
