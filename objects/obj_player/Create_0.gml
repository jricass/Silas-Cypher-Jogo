// Iniciar Variáveis

meu_dano = noone;
dano_poise = 4;

// Iniciando primeiro estado
estado_idle = new estado();

// Iniciando estado walk
estado_walk = new estado();

// Iniciando estado de ataque;
estado_attack = new estado(); 

#region estado_idle

// Estado idle precisa de um "inicia"
estado_idle.inicia = function()
{
	
	// Definindo sprite atual com base na direção que o player olha
	var _sprite = define_sprite(dir, spr_player_idle_side, spr_player_idle_front, spr_player_idle_back);
	
	// Ajustando sprite
	sprite_index = _sprite;
	
	// Garantindo que a animação começa do primeiro frame
	image_index = 0;
}

estado_idle.roda = function()
{
	// Achando a condição para sair deste estado
	
	// SE estiver em movimento, então estado = walk
	if (up xor down or left xor right) 
	{
		troca_estado(estado_walk);
	}
	
	// Condição para ir para o estado de attack
	if (attack)
	{
		troca_estado(estado_attack);	
	}
}

#endregion

#region estado_walk

estado_walk.inicia = function()
{
	dir = (point_direction(0, 0, right - left, down - up) div 90);
	// Definindo Sprite
	var _sprite = define_sprite(dir, spr_player_walk_side, spr_player_walk_front, spr_player_walk_back);	

	sprite_index = _sprite;
	
	image_index = 0;
	
}

estado_walk.roda = function()
{
	
	dir = (point_direction(0, 0, velh, velv) div 90);
	// Condição para sair do estado
	// Se estou parado, eu vou para idle
	
	// Ajustando o lado que ele olha
	if (velh != 0)
	{
		image_xscale = sign(velh)
	}
	
	// Definindo sprite
	sprite_index = define_sprite(dir, spr_player_walk_side, spr_player_walk_front, spr_player_walk_back);
	
	// Aplicando inputs à velocidade
	// Resultado vai ser 0, -1 ou 1
	velv = (down - up) * vel;

	// velocidade horizontal
	velh = (right - left) * vel;
	
	if (velh == 0 and velv == 0)
	{
		troca_estado(estado_idle);	
	}
	
	// Indo para o estado de ataque
	if (attack)
	{
		troca_estado(estado_attack);	
	}
	
}

#endregion

#region estado_attack

estado_attack.inicia = function()
{
	// Definindo a sprite
	sprite_index = define_sprite(dir, spr_player_attack_side, spr_player_attack_front, spr_player_attack_back);
	
	image_index = 0;
	
	velh = 0;
	velv = 0;
	
	// Criando dano
	var _x = x + lengthdir_x(16, dir * 90);
	var _y = y + lengthdir_y(16, dir * 90)
	
	meu_dano = instance_create_depth(_x, _y, depth, obj_dano_player);
	
	// Passando poise para o dano
	meu_dano.dano_poise = dano_poise;
}

// Configurando estado de attaque
estado_attack.roda = function()
{
		
	// Saindo do ataque quando ele acabar
	if (image_index >= image_number - 0.4)
	{
		// Indo para o estado de parado
		troca_estado(estado_idle);
	}
		
}

estado_attack.finaliza = function()
{
	
	// Encerro meu dano
	instance_destroy(meu_dano);
	
}

#endregion

#region iniciando_variaveis
// Controles iniciados sem valor
up = noone;
down = noone;
left = noone;
right = noone;
attack = noone;

// Variáveis de movimento
// Iniciado Parado
velh = 0;
velv = 0;

// Velocidade do Jogador
vel = 2;

// Controlando direção que o player olha
dir = 0;

#endregion

// Iniciando minha maquina de estados
inicia_estado(estado_idle);
