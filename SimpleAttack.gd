extends Area2D

class_name SimpleAttack

# Set your damage value
@export var damage_value: float = 10.0

# Set your reload time
@export var reload_time: float = 0.25

# Can't attack while reloading
var is_reload: bool = false

## This method applies damage to the character's HP
func attack(attacked_hp: SimpleHp) -> void:
	if is_reload:
		return
	attacked_hp.apply_damage(damage_value)
	reload()

## This method reloads your weapon
# You can delete it if you need ONLY melee attacks
func reload() -> void:
	is_reload = true
	await get_tree().create_timer(reload_time).timeout
	is_reload = false

#region Getters and Setters
## When you need to get the reload time
func get_reload_time() -> float:
	return reload_time

## When you need to get the damage value
func get_damage_value() -> float:
	return damage_value
#endregion
