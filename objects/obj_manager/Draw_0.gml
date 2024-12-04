var _videoData = video_draw() // Processa o video
var _videoStatus = _videoData[0]
if (_videoStatus == 0){
	
	draw_surface_stretched(_videoData[1],0,0,1280,720)
}
if (video_get_status() == video_status_playing){
	draw_text(32, 640, "Video status: playing")
}
