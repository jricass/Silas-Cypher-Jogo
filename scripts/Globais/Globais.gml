
global.game_over = false;

function reinicia_jogo()
{
	game_restart();
	
	global.game_over = false;
}

// Variavel para saber se estou na fogueira
global.fogueira = false;

// Variavel com as minhas rooms
global.rooms_info = array_create(array_length(asset_get_ids(asset_room)), noone);

// Criando estrutura de dados para salvar as infos dos inimigos
function inimigo_info(_id) constructor
{
	x		= _id.x;
	y		= _id.y;
	vida	= _id.vida;
	obj		= _id.object_index;
	
	// Funçao para instanciar
	static instancia = function()
	{
		var _inst = instance_create_layer(x, y, "inimigos", obj);	
		_inst.vida = vida;
	}
}

function finaliza_room()
{
	// Avisando que a room possui um array
	global.rooms_info[room] = [];

	// Somente se existe inimigo na room
	if (instance_exists(obj_inimigo_pai))
	{
		var _i = 0;
	
		with(obj_inimigo_pai)
		{
			// Salvando informações
			var _inf = new inimigo_info(id);
		
			// Colocando as informações no array
			// Me colocando na minha posição na room
			global.rooms_info[room][_i] = _inf;
			_i++;
		}	
	}	
}

function inicia_room()
{
	// Checando se eu realmente preciso iniciar a room
	if (global.rooms_info[room] != -4)
	{
		// Criar os inimigos, mas antes, limpar a room
		if (instance_exists(obj_inimigo_pai)) instance_destroy(obj_inimigo_pai)	
		
		// Criando os inimigos
		// Passando pela array de inimigos da room
		for (var i = 0; i < array_length(global.rooms_info[room]); i++)
		{
			// Instanciando os inimigos que eu preciso
			var _inst = global.rooms_info[room][i];
			_inst.instancia();
		}
	}
	else
	{
			
	}
}