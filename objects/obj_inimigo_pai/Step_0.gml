depth = -y;

// Recuperando poise
poise =	min(poise_max, poise + poise_max * 0.001);

if (gerado) exit;
// Rodando Estado
roda_estado();