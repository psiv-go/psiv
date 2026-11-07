extends Node2D

const BULLET_TEMPLATE: PackedScene = preload("res://scenes/bullet.tscn")

@onready var player: CharacterBody2D = $player
@onready var hands: Node2D = player.get_node("Hands")
@onready var gun: Node2D = hands.get_node("gun")

func _restart_game():
	Global.save_game()
	
	Global.high_score = max(Global.score, Global.high_score)
	
	Global.score = 0
	
	get_tree().call_deferred("reload_current_scene")

func _ready() -> void:
	
	hands.im_fired.connect(func(): gun._create_bullet(BULLET_TEMPLATE, self))
	player.im_died.connect(_restart_game)
	
	
	
