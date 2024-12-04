instance_destroy();

obj_screenshake.ang = 2;
obj_screenshake.valor += 2;

// show_message("voce perdeu " + string(dano) + " de vida");

with(other)
{
	//troca_estado(estado_hit);	
	
	// Lidando com o dano
	lida_dano(other.dano);
}