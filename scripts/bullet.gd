extends Area2D

@export var damage: int = 10
var speed: float
var direction: Vector2

func _physics_process(delta: float) -> void:
	position += speed * direction * delta

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("_take_damage"):
		body._take_damage(damage)
		
	queue_free()
