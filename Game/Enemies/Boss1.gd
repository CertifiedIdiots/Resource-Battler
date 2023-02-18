class_name Boss1
extends Boss

onready var display = $"Display/ItemList"

func load_display():
	display.add_item(str("Health: ", health, " / ", max_health))
	display.add_item(str("Damage: ", clamp(damage - gamestate.stats["defense"], 0, damage - gamestate.stats["defense"])))
	display.add_item(str("NEXT ATTACK IN: ", attack_timer, " turns"))
	
func update():
	display.set_item_text(0, str("Health: ", health, " / ", max_health))
	display.set_item_text(1, str("Damage: ", clamp(damage - gamestate.stats["defense"], 0, damage - gamestate.stats["defense"])))
	display.set_item_text(2, str("NEXT ATTACK IN: ", attack_timer, " turns"))
	
func _ready():
	attack_timer = 10
	damage = 10
	load_display()
	
func power_increase():
	damage_increase = (gamestate.turn_count * 2) + 10
	damage = clamp(damage_increase, 0, damage_increase)
	
func attack():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	if attack_timer == 1:
		gamestate.people = gamestate.people - clamp((damage - gamestate.stats["defense"]), 0, 100000)
		attack_timer = rng.randi_range(5, 10)
		power_increase()
	else:
		attack_timer -= 1
