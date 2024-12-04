// Inherit the parent event
event_inherited();

sprite =
{
	attack : spr_slime3_attack,	
	death : spr_slime3_death,
	hurt : spr_slime3_hurt,
	idle : spr_slime3_idle,	
	walk : spr_slime3_walk	
};

// Direção
dir = 0;

filhos = [];

// Image index anterior
image_index_prev = 0;

contador_ataque = 0;

image_xscale = 1.5;
image_yscale = 1.5;

#region estado_hunt

estado_hunt.inicia = function()
{

	// Definindo Sprite
	sprite_index = sprite.walk;
	image_index = 0;
	
	// Criando meu aviso
	
	cria_aviso();
	
	if (instance_exists(obj_player))
	{
		alvo = obj_player.id;
		dir = point_direction(alvo.x, alvo.y, x, y);
	}
}

estado_hunt.roda = function()
{
	if (!instance_exists(alvo))
	{
		troca_estado(estado_idle);
		exit;
	}
	
	// Fugindo do Player
	// Definindo velocidade para fugir
	velh = lengthdir_x(1, dir);
	velv = lengthdir_y(1, dir);
	
	// Olhando para o lado certo
	if (velh != 0) xscale = sign(velh);
	
	// Vendo se o player esta longe o suficiente
	var _dist = point_distance(x, y, alvo.x, alvo.y);
	
	if (_dist >= 120)
	{
		troca_estado(estado_attack);	
	}
}

estado_hunt.finaliza = function()
{
	velh = 0;
	velv = 0;
}

#endregion

#region estado_attack

estado_attack.inicia = function()
{
	sprite_index = sprite.attack;
	image_index = 0;
}

estado_attack.roda = function()
{
	
	if (image_index >= image_index_prev)
	{
		// Criando o inimigo na hora do pulo
		if (image_index_prev == 0)
		{
			// Criando gerador de inimigos
			var _filho = instance_create_depth(x, y, depth, obj_gera_inimigo);
			_filho.criador = id;
		}
		
		image_index_prev = image_index;	
	}
	else
	{
		contador_ataque++;
		image_index_prev = 0;	
	}
	
	// Fazendo me mover quando estiver no ar
	if (image_index >= 7)
	{
		velh = lengthdir_x(1, dir);	
		velv = lengthdir_y(1, dir);	
	}
	else
	{
		velh = 0;
		velv = 0;
	}
	
	// Saindo do estado
	// Se meu contador chegou em 2 entao saio do estado
	if (contador_ataque >= 2)
	{
		troca_estado(estado_idle);	
	}
}

estado_attack.finaliza = function()
{
	contador_ataque = 0;	
	
	// Criando metodo que avisa aos filhos que eles podem atacar
	var _avisa_filhos = function(_elemento)
	{
		_elemento.alvo = alvo;
		_elemento.gerado = false;
		
		with(_elemento)
		{
			troca_estado(estado_hunt);	
		}
	}
	
	// Avisando aos filhos para atacar o player
	// Rodando pelo meu vetor dos filhos
	array_foreach(filhos, _avisa_filhos)
	
	// Zerar array de filhos
	array_resize(filhos, 0);
	
}

#endregion

inicia_estado(estado_idle);