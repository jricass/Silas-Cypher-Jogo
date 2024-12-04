window_set_size(1280, 720) // Deixa o tamanho da janela em HD
window_center() // Centraliza a janela


video = video_open("videoplayback.mp4") // Prepara o video
// Pode usar url
// Começa o vídeo
// É preciso desenhar frames manualmente
video_enable_loop(false)

