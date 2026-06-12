//Para a animação automática do Sprite
image_speed = 0; 

global.player = id;

//Quadro da animação
quadro_inicio = 0;
quadro_fim = 0;

velocidade_animacao = 0.05; //Velocidade com que os quadros mudam
velocidade_movimento = 2.5; //Velocidade de movimento do player

direcao_olhando = 0 //0 = Baixo, 1 = Esquerda, 2 = Cima, 3 = Direita

//sistema de vida e invencibilidade
vida_maxima = 100;
vida_atual = 100;

invencivel = false;
tempo_invencibilidade = 0;

//Barra "fantasma"
vida_atraso = 100; 
velocidade_queda_atraso = 0.05;

fade_iniciado = false;

nome_da_room = room_get_name(room);
musica_iniciada = false; //Nova variável de controle
dialogo = noone; //Vai guardar a identidade do diálogo

//Converte a room em uma String
nome_da_room = room_get_name(room);
if (nome_da_room == "Aquarto_inicial") {
	dialogo = instance_create_layer(0, 0, "Instances", obj_dialogo, {
	    falas: [
	        "Cara, que sono!",
	        "Sinto a boca seca, preciso de um copo d'água."
	    ]
	});
}
if (nome_da_room == "Ccozinha") {
	dialogo = instance_create_layer(0, 0, "Instances", obj_dialogo, {
	    falas: [
	        "Caramba, a cozinha tá mais escura que tudo.",
	        "Tenho que ligar essa luz para pegar essa água logo."
	    ]
	});
}

if (nome_da_room == "Dsala_roguelike") {
	dialogo = instance_create_layer(0, 0, "Instances", obj_dialogo, {
	    falas: [
	        "Isso não era tão grande assim...",
	        "O que é aquilo se movendo...? E por que está vindo na minha direção?!",
			"(Aperte o botão direito do mouse para atacar.)"
	    ]
	});
}