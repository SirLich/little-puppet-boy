extends Node2D
class_name Joy

var phase = JoyPhase.MOVE

@export var move_speed = 200

enum JoyPhase {
	IDLE,
	MOVE
}

func _physics_process(delta: float) -> void:
	if phase == JoyPhase.IDLE:
		do_idle(delta)
	elif phase == JoyPhase.MOVE:
		do_move(delta)

func do_idle(delta):
	pass

func do_move(delta):
	var player_direction = global_position.direction_to(Utils.get_player().global_position)
	global_position += player_direction * delta * move_speed
	
		
		
