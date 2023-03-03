extends Node

onready var gamestate = $"/root/System/Gamestate"
onready var resources = $"resources"
onready var stats = $"stats"

func _ready():
	resources.add_item(str("People: ", gamestate.people, " / ", gamestate.people_cap))
	resources.add_item(str("Food: ", gamestate.food, "  (-", gamestate.people / 10, ")"))
	resources.add_item(str("Culture: ", gamestate.culture, " / ", gamestate.required_culture))
	resources.add_item(str("Wood: ", gamestate.inventory["wood"]))
	resources.add_item(str("Stone: ", gamestate.inventory["stone"]))
	resources.add_item(str("Ore: ", gamestate.inventory["ore"]))
	resources.add_item(str("Plank: ", gamestate.inventory["plank"]))
	resources.add_item(str("Brick: ", gamestate.inventory["brick"]))
	resources.add_item(str("Ingot: ", gamestate.inventory["ingot"]))

	stats.add_item(str("Damage: ", gamestate.stats["damage"]), load("res://Assets/Art/Icons/damage1.png"))
	stats.add_item(str("Defense: ", gamestate.stats["defense"]), load("res://Assets/Art/Icons/defense1.png"))
	stats.add_item(str("Woodcutting: ", gamestate.stats["woodcutting"]), load("res://Assets/Art/Icons/axe1.png"))
	stats.add_item(str("Mining: ", gamestate.stats["mining"]), load("res://Assets/Art/Icons/pickaxe1.png"))
	stats.add_item(str("Farming: ", gamestate.stats["farming"]), load("res://Assets/Art/Icons/sickle1.png"))

func display_resources():
	resources.set_item_text(0, str("People: ", gamestate.people, " / ", gamestate.people_cap))
	resources.set_item_text(1, str("Food: ", gamestate.food, "  (-", gamestate.people / 10, ")"))
	resources.set_item_text(2, str("Culture: ", gamestate.culture, " / ", gamestate.required_culture))
	resources.set_item_text(3, str("Wood: ", gamestate.inventory["wood"]))
	resources.set_item_text(4, str("Stone: ", gamestate.inventory["stone"]))
	resources.set_item_text(5, str("Ore: ", gamestate.inventory["ore"]))
	resources.set_item_text(6, str("Plank: ", gamestate.inventory["plank"]))
	resources.set_item_text(7, str("Brick: ", gamestate.inventory["brick"]))
	resources.set_item_text(8, str("Ingot: ", gamestate.inventory["ingot"]))

func display_stats():
	stats.set_item_text(0, str("Damage: ", gamestate.stats["damage"]))
	stats.set_item_text(1, str("Defense: ", gamestate.stats["defense"]))
	stats.set_item_text(2, str("Woodcutting: ", gamestate.stats["woodcutting"]))
	stats.set_item_text(3, str("Mining: ", gamestate.stats["mining"]))
	stats.set_item_text(4, str("Farming: ", gamestate.stats["farming"]))
	
func update_display():
	gamestate.stats["damage"] = (gamestate.people/5.0)+(gamestate.inventory["t1_weapon"]*10)+(gamestate.inventory["t2_weapon"]*30)
	gamestate.stats["defense"] = (gamestate.inventory["t1_armor"]*10)+(gamestate.inventory["t2_armor"]*30)
	gamestate.stats["woodcutting"] = (gamestate.people/10.0)+(gamestate.inventory["t1_axe"]*10)+(gamestate.inventory["t2_axe"]*30)
	gamestate.stats["mining"] = (gamestate.people/10.0)+(gamestate.inventory["t1_pickaxe"]*10)+(gamestate.inventory["t2_pickaxe"]*30)
	gamestate.stats["farming"] = (gamestate.people/10.0)+(gamestate.inventory["t1_sickle"]*10)+(gamestate.inventory["t2_sickle"]*30)
	gamestate.material_cap = 100+(gamestate.structures["warehouse"]*100)
	gamestate.people_cap = 100+(gamestate.structures["house"]*50)
	$"attack".set_text(str("Attack boss for ", gamestate.stats["damage"], " damage"))
	display_resources()
	display_stats()
