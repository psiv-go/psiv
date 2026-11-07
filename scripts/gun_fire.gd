extends Node2D

@export var gun_power: float = 400.0

func _create_bullet(bullet_scene: PackedScene, parent: Node2D) -> void:
	var bullet: Area2D = bullet_scene.instantiate()
	
	bullet.direction = transform.x
	bullet.speed = gun_power
	bullet.global_position = global_position
	bullet.global_position += global_transform.x * 39
	
	parent.add_child(bullet)
	
