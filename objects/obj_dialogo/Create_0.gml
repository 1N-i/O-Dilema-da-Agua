// Garante que a variável "origem" exista
if (!variable_instance_exists(id, "origem")) {
    origem = noone;
}

nome_personagem = "????";

if (!variable_instance_exists(id, "falas")) {
    falas = [""];
}

fala_atual = 0;
texto_completo = falas[fala_atual];
texto_atual = "";
letra_atual = 0;
velocidade_texto = 0.5;
image_speed = 0;
depth = -10000;
