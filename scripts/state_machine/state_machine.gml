//Iniciando maquina de estados

function estado() constructor
{
	//Iniciando estado
	static inicia = function() {};
	//Rodando estado
	static roda = function() {};
	//Finalizando estado
	static finaliza = function() {};
}

//Funcoes para controlar a maquina de estados
//Iniciando estado
function inicia_estado(_estado)
{
	//Salvando o estado passado em uma variavel	
	estado_atual = _estado;
	
	//Iniciando o estado atual
	estado_atual.inicia();
}

//Rodando estado atual
function roda_estado()
{
	estado_atual.roda();	
}

//Trocando de estado
function troca_estado(_estado)
{
	//Finalizando estado atual
	estado_atual.finaliza();
	
	//Rodando proximo estado
	estado_atual = _estado;
	
	//Iniciando estado atual
	estado_atual.inicia();
}

// Definindo a sprite

function define_sprite(_dir = 0, sprite_side, sprite_front, sprite_back)
{
	var _sprite;
	
	switch(dir)
	{
		case 0: _sprite = sprite_side; break;	
		case 1: _sprite = sprite_back; break;	
		case 2: _sprite = sprite_side; break;	
		case 3: _sprite = sprite_front; break;	
	}
	
	return _sprite;
}