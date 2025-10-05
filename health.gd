extends Node2D

signal max_health_changed(diff: int)
signal health_changed(diff: int)
signal health_depleted

@export var max_health: int = 5 : set = set_max_health, get = get_max_health
@export var immunity: bool = false : set = set_immunity, get = get_immunity

var immunity_timer: Timer = null

@onready var health: int = max_health : set = set_health, get = get_health

func set_max_health(value: int):
	var clamped_value = 1 if value <= 0 else value
	
	if not clamped_value == max_health:
		var difference = clamped_value - max_health
		max_health = clamped_value
		max_health_changed.emit(difference)
		
		if health >= max_health:
			health = max_health
		
func get_max_health() -> int:
	return max_health

func set_immunity(value: bool):
	immunity = value

func get_immunity() -> bool:
	return immunity
	
func set_temp_immunity(time):
	if immunity_timer == null:
		immunity_timer = Timer.new()
		immunity_timer.one_shot = true
		add_child(immunity_timer)
	
	if immunity_timer.timeout.is_connected(set_immunity):
		immunity_timer.timeout.disconnect(set_immunity)
		
	immunity_timer.set_wait_time(time)
	immunity_timer.timeout.connect(set_immunity.bind(false))
	immunity = true
	immunity_timer.start()
func set_health(value: int):
	if value < health and immunity:
		return
	
	var clamped_value = clamp(value, 0, max_health)
	
	if clamped_value != health:
		var difference = clamped_value - health
		health = clamped_value
		health_changed.emit(difference)
		
		if health == 0:
			health_depleted.emit()

func get_health() -> int:
	return max_health
