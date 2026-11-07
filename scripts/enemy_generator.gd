extends Node2D


@export var enemy_template: PackedScene 

@onready var target: CharacterBody2D = get_tree().current_scene.get_node_or_null("player")

func _enemy_fabric() -> void:
	if not is_instance_valid(target): return
	
	var enemy: CharacterBody2D = enemy_template.instantiate()
	
	enemy.enemy_died.connect(Global._pay_score)
	
	enemy.global_position = global_position
	
	get_parent().add_child(enemy)
	
func _ready() -> void:
	if not target: return
	
	$Timer.timeout.connect(_enemy_fabric)
	
