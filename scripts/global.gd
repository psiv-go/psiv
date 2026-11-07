extends Node
const SAVE_PATH = "user://savegame.json"


var score: int = 0
var high_score: int = 0

func _ready() -> void:
	load_game()

func save_game() -> void:
	var save: Dictionary = {"high_score": max(high_score, score)}
	
	var json_string: String = JSON.stringify(save)
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(json_string)
		file.close()
		print("Сохранено")
		
func load_game() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
		
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var json_string: String = file.get_as_text()
		file.close()
		
		var json: JSON = JSON.new()
		
		var parse_result: Error = json.parse(json_string)
		
		if parse_result == OK:
			var data: Dictionary = json.get_data()
			
			if "high_score" in data:
				high_score = data["high_score"]
			
		
func _pay_score(payment: int): score += payment
