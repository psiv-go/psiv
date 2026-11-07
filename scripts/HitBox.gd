extends Area2D

@export var damage: int = 10

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("_take_damage"):
		body._take_damage(damage)
