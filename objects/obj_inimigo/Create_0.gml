//Para a animação automática do Sprite (velocidade 0)
image_speed = 0; 

//Define em qual quadro a animação atual começa e termina
quadro_inicio = 0;
quadro_fim = 0;

//Velocidade com que os quadros vão mudar
velocidade_animacao = 0.2;

//Velocidade de perseguição (Um pouco mais lento que os do player)
velocidade_movimento = 1; 

//Guarda a última direção do inimigo: 0 = Baixo, 1 = Esquerda, 2 = Cima, 3 = Direita
direcao_olhando = 0;

//Sistema de Vida
vida_maxima = 125;
vida_atual = vida_maxima

//Tempo de invencibilidade do inimigo após levar paulada 
invencivel = false;
tempo_invencibilidade = 0;
tempo_congelado = 0;

