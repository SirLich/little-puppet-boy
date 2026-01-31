extends VBoxContainer

@export var name_label: Label
@export var animation_player: AnimationPlayer
@export var hud_animation: AnimationPlayer
@export var health_pip : PackedScene
@export var pip_texture : Texture
@export var dead_pip_texture : Texture
@export var health_row: HBoxContainer

func _ready() -> void:
	Global.fight_started.connect(fight_started)
	Global.enemy_died.connect(enemy_died)
	Global.player_health_changed.connect(player_health_changed)
	Global.player_dead.connect(player_died)
	
	for i in range(10):
		var new_health_pip = health_pip.instantiate()
		new_health_pip.texture = pip_texture
		health_row.add_child(new_health_pip)

func player_died():
	hud_animation.play("death")
	
func player_health_changed(new, max):
	for i in range(max):
		var child = health_row.get_child(i)
		if i >= new:
			child.texture = dead_pip_texture
		else:
			child.texture = pip_texture
	
	
func fight_started(new_enemy : Global.EnemyType):
	var text = ""
	
	if new_enemy == Global.EnemyType.JOY:
		text = "Joy"
	if new_enemy == Global.EnemyType.ANGER:
		text = "Anger"
	if new_enemy == Global.EnemyType.SADNESS:
		text = "Sadness"
	if new_enemy == Global.EnemyType.APATHY:
		text = "Apathy"
	name_label.text = text
	animation_player.play("slide_in", 1, 0.2)
	
	if (new_enemy != Global.EnemyType.JOY):
		hud_animation.play_backwards("curtains")
	
func enemy_died():
	animation_player.play("slide_in", -1, -0.2, true)
	hud_animation.play("curtains")
