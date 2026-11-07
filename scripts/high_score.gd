extends RichTextLabel

func _process(_delta: float) -> void: text = "HighScore: " + str(Global.high_score)
