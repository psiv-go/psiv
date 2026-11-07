extends CharacterBody2D

signal enemy_died(payment: int)

@export var health: int = 30:
	set(value):
		health = value
		if value <= 0:
			enemy_died.emit(price)
			queue_free()
			
@export var speed: float = 150.0
@export var price: int = 10

var target: CharacterBody2D = null
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	target = get_tree().current_scene.get_node_or_null("player")

func _physics_process(_delta: float) -> void:
	if target:
		direction = (target.global_position - global_position).normalized()
		
	
	velocity = speed * direction
	
	move_and_slide()


func _take_damage(damage: int) -> void: health -= damage

	
