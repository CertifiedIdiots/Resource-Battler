extends Node

onready var gamestate = $"/root/System/Gamestate"
onready var resources = $"resources"
onready var stats = $"stats"

func _ready():
	resources.add_item(str("People: ", gamestate.people, " / ", gamestate.people_cap))
	resources.add_item(str("Food: ", gamestate.food, "  (-", gamestate.people / 10, ")"))
	resources.add_item(str("Culture: ", gamestate.culture, " / ", gamestate.required_culture))
	resources.add_item(str("Wood: ", gamestate.materials["wood"]))
	resources.add_item(str("Stone: ", gamestate.materials["stone"]))
	resources.add_item(str("Ore: ", gamestate.materials["ore"]))
	resources.add_item(str("Plank: ", gamestate.materials["plank"]))
	resources.add_item(str("Brick: ", gamestate.materials["brick"]))
	resources.add_item(str("Ingot: ", gamestate.materials["ingot"]))

	stats.add_item(str("Damage: ", gamestate.stats["damage"]), load("res://Assets/Art/Icons/damage1.png"))
	stats.add_item(str("Defense: ", gamestate.stats["defense"]), load("res://Assets/Art/Icons/defense1.png"))
	stats.add_item(str("Woodcutting: ", gamestate.stats["woodcutting"]), load("res://Assets/Art/Icons/axe1.png"))
	stats.add_item(str("Mining: ", gamestate.stats["mining"]), load("res://Assets/Art/Icons/pickaxe1.png"))
	stats.add_item(str("Farming: ", gamestate.stats["farming"]), load("res://Assets/Art/Icons/sickle1.png"))

func display_resources():
	resources.set_item_text(0, str("People: ", gamestate.people, " / ", gamestate.people_cap))
	resources.set_item_text(1, str("Food: ", gamestate.food, "  (-", gamestate.people / 10, ")"))
	resources.set_item_text(2, str("Culture: ", gamestate.culture, " / ", gamestate.required_culture))
	resources.set_item_text(3, str("Wood: ", gamestate.materials["wood"]))
	resources.set_item_text(4, str("Stone: ", gamestate.materials["stone"]))
	resources.set_item_text(5, str("Ore: ", gamestate.materials["ore"]))
	resources.set_item_text(6, str("Plank: ", gamestate.materials["plank"]))
	resources.set_item_text(7, str("Brick: ", gamestate.materials["brick"]))
	resources.set_item_text(8, str("Ingot: ", gamestate.materials["ingot"]))

func display_stats():
	stats.set_item_text(0, str("Damage: ", gamestate.stats["damage"]))
	stats.set_item_text(1, str("Defense: ", gamestate.stats["defense"]))
	stats.set_item_text(2, str("Woodcutting: ", gamestate.stats["woodcutting"]))
	stats.set_item_text(3, str("Mining: ", gamestate.stats["mining"]))
	stats.set_item_text(4, str("Farming: ", gamestate.stats["farming"]))
	
func update_display():
	gamestate.stats["damage"] = (gamestate.people/5.0)+(gamestate.items["t1_weapon"]*10)+(gamestate.items["t2_weapon"]*40)
	gamestate.stats["defense"] = (gamestate.items["t1_armor"]*10)+(gamestate.items["t2_armor"]*40)
	gamestate.stats["woodcutting"] = (gamestate.people/10.0)+(gamestate.items["t1_axe"]*10)+(gamestate.items["t2_axe"]*40)
	gamestate.stats["mining"] = (gamestate.people/10.0)+(gamestate.items["t1_pickaxe"]*10)+(gamestate.items["t2_pickaxe"]*40)
	gamestate.stats["farming"] = (gamestate.people/10.0)+(gamestate.items["t1_sickle"]*10)+(gamestate.items["t2_sickle"]*40)
	gamestate.material_cap = 100+(gamestate.structures["warehouse"]*100)
	gamestate.people_cap = 100+(gamestate.structures["house"]*50)
	$"attack".set_text(str("Attack boss for ", gamestate.stats["damage"], " damage"))
	display_resources()
	display_stats()
