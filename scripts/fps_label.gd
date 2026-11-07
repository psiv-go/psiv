extends RichTextLabel

func _process(_delta: float) -> void: 
	
	var fps: float = Engine.get_frames_per_second()
	
	if fps > 30:
		text = "FPS: [color=#00ff00]" + str(Engine.get_frames_per_second()) + "[/color]"
	elif fps > 15:
		text = "FPS: [color=#ffa500]" + str(Engine.get_frames_per_second()) + "[/color]"
	elif fps <= 15:
		text = "FPS: [color=#ff0000]" + str(Engine.get_frames_per_second()) + "[/color]"
