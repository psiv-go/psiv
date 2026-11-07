extends CharacterBody2D
signal im_died()
@export var max_health: int = 50
@export var speed: float = 400.0
@onready var health: int = max_health:
	set(value):
		health = max(0, value)
		if health <= 0:
			im_died.emit()
			
var vector: Vector2
var damage_tween: Tween = null

func _take_damage(damage: int) -> void: 
	health -= damage
	
	if damage_tween:
		damage_tween.kill()
		
	damage_tween = create_tween()
	
	damage_tween.tween_property($ColorRect, "modulate", Color(1, 0, 0, 0.5), 0.1)
	damage_tween.tween_property($ColorRect, "modulate", Color(1, 1, 1), 0.1)
	

func _physics_process(_delta: float) -> void:
	vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = vector * speed
	
	move_and_slide() 
	
