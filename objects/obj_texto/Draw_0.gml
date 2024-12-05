// Tamanho da caixa de texto
var box_width = 400;
var box_height = 50;

// Centraliza a caixa de texto na tela
var box_x = (window_get_width() - box_width) / 2;  // Centraliza horizontalmente
var box_y = (window_get_height() - box_height) / 2;  // Centraliza verticalmente

// Desenha a caixa de texto (cor de fundo cinza)
draw_set_color(c_white);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);  // Caixa de texto (sem preenchimento)

// Define a cor do texto para algo visível (preto)
draw_set_color(c_black);

// Desenha o texto dentro da caixa
draw_set_font(fnt_game_over);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);  // Alinha o texto verticalmente ao centro

// Verifica se o texto está dentro dos limites da caixa
var text_width = string_width(text_input);
if (text_width > box_width - 10) {
    // Se o texto ultrapassar a largura da caixa, ajusta a exibição
    var visible_text = string_copy(text_input, 1, floor((box_width - 10) / string_width("a")));
    draw_text(box_x + 5, box_y + box_height / 2, visible_text);  // Desenha texto cortado
} else {
    // Caso contrário, desenha o texto normalmente
    draw_text(box_x + 5, box_y + box_height / 2, text_input);
}

if (mensagem_erro) {
    draw_set_color(c_red);
    draw_set_font(fnt_game_over);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(box_x + box_width / 2, box_y - 10, "Senha errada, tente novamente!");
}
