// Iniciando Variaveis padrão dos inimigos
xscale = 1;
dead = false;
// Definindo equilibrio atual
poise = poise_max;

// Lidando com dano
lida_dano = function(_dano = 1, _poise = 1)
{
	// Tirando vida
	vida -= _dano;
	// Diminuindo poise
	poise = max(poise - _poise, 0);
	
	// Condicao para troca de estado
	// So ir para o estado de hurt se o poise for zerado
	if (poise <= 0 or estado_atual != estado_attack)
	{
		// Vou para estado de hurt
		troca_estado(estado_hurt)
	}
}

// Iniciando Estados Padrão de Inimigos

estado_idle = new estado();
estado_walk = new estado();
estado_attack = new estado();
estado_hurt = new estado();
estado_death = new estado();

// Iniciando Estado Idle por Padrão

inicia_estado(estado_idle);