extends Node2D

@export var speed = 400
@export var animation_player: AnimationPlayer
@export var health_component: HealthComponent

func _physics_process(delta: float) -> void:
	global_position += Vector2.DOWN.rotated(rotation) * delta * speed
	
func died():
	queue_free()
	
func _ready() -> void:
	health_component.died.connect(died)
	await animation_player.animation_finished
	queue_free()
