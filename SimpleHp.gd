extends Node

class_name SimpleHp

# Set starting health points
@export var initial_hp: float = 100.0
var current_hp: float

## Called when:
# damaged
signal damaged
# died
signal died

## Set the initial HP
func _ready() -> void:
	current_hp = initial_hp

# Apply damage to the current HP
func apply_damage(damage_value: float) -> void:
	damaged.emit()
	current_hp -= damage_value
	if check_if_dead():
		die()

# Check if the entity is dead
func check_if_dead() -> bool:
	return current_hp <= 0.0

# Handle death
func die() -> void:
	died.emit()

# Use this when you need to retrieve the current HP
func get_health_points() -> float:
	return current_hp
