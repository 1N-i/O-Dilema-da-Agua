//Para a animação automática do Sprite (velocidade 0)
image_speed = 0; 

//Define em qual quadro a animação atual começa e termina
quadro_inicio = 0;
quadro_fim = 0;

//Velocidade com que os quadros vão mudar
velocidade_animacao = 0.1;

//Velocidade de perseguição (Um pouco mais lento que os do player)
velocidade_movimento = 3.7; 

//Guarda a última direção do inimigo: 0 = Baixo, 1 = Esquerda, 2 = Cima, 3 = Direita
direcao_olhando = 0;

tempo_espera = 0;

tempo_recuperacao = 4;

//sistema de vida e invencibilidade
vida_maxima = 200;
vida_atual = 200;

invencivel = false;
tempo_invencibilidade = 0;

//Barra "fantasma"
vida_atraso = 100; 
velocidade_queda_atraso = 0.05;