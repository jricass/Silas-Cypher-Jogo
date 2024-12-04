/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Criando timer para mudar de estado
tempo_estado = game_get_speed(gamespeed_fps) * 15;
timer_estado = tempo_estado;

range = 10

// Criando uma estrutura com as sprites dele
sprite =
{
	attack : spr_slime_blue_attack,	
	death : spr_slime_blue_death,
	hurt : spr_slime_blue_hurt,
	idle : spr_slime_blue_idle,	
	walk : spr_slime_blue_walk	
};

destino_x = 0;
destino_y = 0;

alvo = noone;

// Inherit the parent event
event_inherited();

estado_hunt = new estado();

// Códigos sobrescritos a partir daqui
#region estado_idle

estado_idle.inicia = function()
{
	image_blend = c_white
	// Definir qual sprite ele usará
	sprite_index = sprite.idle;
	
	// Inicia a animação do começo
	image_index = 0;
	
	timer_estado = tempo_estado;
}

estado_idle.roda = function()
{
	// Diminuindo tempo do estado para troca
	timer_estado--;
	
	var _tempo = irandom(timer_estado);
	
	if (_tempo <= tempo_estado * .01)
	{
		var _estado_novo = choose(estado_idle, estado_walk, estado_walk);
		
		troca_estado(estado_walk);	
	}
}

#endregion

#region estado_walk

estado_walk.inicia = function()
{
	sprite_index = sprite.walk;
	image_index = 0;
	
	// Resetando timer do estado
	timer_estado = tempo_estado;
	
	// Escolhendo um local do mapa e indo até ele
	
	// Escolhendo ponto aleatorio no mapa
	destino_x = irandom(room_width)
	destino_y = irandom(room_height)
	
	// Definindo meu xscale com base no destino x
	xscale = sign(destino_x -x);
	
}

estado_walk.roda = function()
{
	// Diminuindo tempo do estado para troca
	timer_estado--;
	
	var _tempo = irandom(timer_estado);
	
	if (_tempo <= 5)
	{
		var _estado_novo = choose(estado_idle, estado_walk);
		
		troca_estado(estado_idle);	
	}
	
	// Indo até o destino enquanto desvia dos colizores
	mp_potential_step_object(destino_x, destino_y, 1, obj_colisor);
}

#endregion

#region estado_attack

estado_attack.inicia = function()
{
	sprite_index = sprite.attack;
	image_index	= 0;
}

estado_attack.roda = function()
{
	
	// Saindo do estado de attack
	if (image_index >= image_number - .5)
	{
		troca_estado(estado_idle);	
	}
	
}

estado_attack.finaliza = function()
{
	alvo = noone; 	
}

#endregion

#region estado_hurt

estado_hurt.inicia = function()
{
	sprite_index = sprite.hurt;
	image_index = 0;
}

estado_hurt.roda = function()
{
	
	
	// Saindo do estado
	//Checando se animação acabou
	if (image_index >= image_number - .5)
	{	
		if (vida > 0)
		{
			troca_estado(estado_hunt);
		}
		else
		{
			troca_estado(estado_death);	
		}
	}
}

estado_hurt.finaliza = function()
{
	if (poise < 1)
	{
		poise = poise_max;	
	}
}

#endregion

#region estado_death

estado_death.inicia = function()
{
	sprite_index = sprite.death;
	image_index = 0;
	
	dead = true;
}

estado_death.roda = function()
{
	// Morrendo, matando sprite
	if (image_index >= image_number - .5)
	{
		instance_destroy();	
	}
}

#endregion

#region estado_hunt

estado_hunt.inicia = function()
{
	sprite_index = sprite.walk;
	image_index = 0;
	
	if (instance_exists(obj_player))
	{
		alvo = obj_player.id;	
	}
}

estado_hunt.roda = function()
{
	// se alvo nao existe mais
	if (!instance_exists(obj_player))
	{
		alvo = noone;	
		troca_estado(estado_idle);
	}
	// Seguindo alvo
	mp_potential_step_object(alvo.x, alvo.y, 1, obj_colisor);
	
	// Attacando Player
	// Checando distancia
	var _dist = point_distance(x, y, alvo.x, alvo.y);
	
	if (_dist <= range)
	{
		troca_estado(estado_attack);	
	}
	
	xscale = sign(alvo.x);
	
	 // Avisando outros inimigos
	 // Checando quantidade de inimigos
	 var _n = instance_number(object_index);
	 
	 // Passando por todos os objetos iguais a mim
	 for (var i = 0; i < _n; i++)
	 {
		// Checando se não estou olhando para mim mesmo
		var _slime = instance_find(object_index, i);
		
		if (_slime == id)
		{
			// Nada, esse sou eu	
		}
		else
		{
			// Checar se ja esta perseguindo
			if (_slime.alvo != alvo)
			{
				// Checando a distância
				var _dist = point_distance(x, y, _slime.x, _slime.y);
				
				if (_dist < 80)
				{
					// Ajuda
					with(_slime)
					{
						troca_estado(estado_hunt);
					}
				}
			}
		}
	 }
}

#endregion

// Iniciando estado com as modificações
inicia_estado(estado_idle);