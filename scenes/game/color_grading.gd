extends ColorRect

@export var color_map : Dictionary[Global.EnemyType, Color]
@export var fade_time = 1

func _ready() -> void:
	Global.fight_started.connect(fight_started)

func fight_started(phase : Global.EnemyType):
	var tween = create_tween()
	tween.tween_property(self, "color", color_map[phase], fade_time)
	
