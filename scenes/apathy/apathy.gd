extends Node2D

@export var death_animation: AnimationPlayer
@export var next_enemy : PackedScene
@export var health_component: HealthComponent

var is_dead = false

func _ready() -> void:
	do_intro()
	health_component.died.connect(on_died)
	health_component.hurt.connect(on_hurt)
	
	await Utils.wait(1)
	#do_dash()
	
func do_intro():
	Global.fight_started.emit(Global.EnemyType.APATHY)
	Utils.get_first_of_type(VoiceOverManager).play_music()
	
func on_hurt():
	pass
	#hurt_animation.play("hurt")

func on_died():
	Global.enemy_died.emit()
	is_dead = true
	await Utils.wait(2.9)
	death_animation.play("die")
	await death_animation.animation_finished
	var new_enemy = next_enemy.instantiate()
	new_enemy.global_position = global_position
	add_sibling(new_enemy)
	self.queue_free()
