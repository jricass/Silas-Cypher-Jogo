/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Desenha a caixa de texto
draw_self();

if (input_active) {
    draw_set_color(c_white);
    draw_rectangle(x - 100, y - 50, x + 100, y, false);  // Desenha um retângulo para a caixa de input
    draw_text(x - 90, y - 40, "Digite a frase:");          // Texto informando o que o jogador deve fazer
    draw_text(x - 90, y - 20, input_text);                // Exibe o que o jogador digitou
}