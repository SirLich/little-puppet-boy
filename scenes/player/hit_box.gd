extends Area2D
class_name HitBox

func _ready() -> void:
	area_entered.connect(on_took_damage)
	
func on_took_damage(area: Area2D) -> void:
	var attack = area as Attack
	var damage = attack.damage
	var health_component = Utils.get_component_by_type(get_parent(), HealthComponent) as HealthComponent
	health_component.take_damage(damage)
