extends Node2D
@export var animation_player: AnimationPlayer
@export var spike_sound : AudioStream

func _ready() -> void:
	animation_player.play("spawn")
	await Utils.wait(1.0)
	if randf() > 0.7:
		SoundManager.play_sound(spike_sound)

	await animation_player.animation_finished
	
	
	self.queue_free()
