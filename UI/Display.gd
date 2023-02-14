extends ItemList

onready var gamestate = $"/root/System/Gamestate"

func load_resources():
	add_item(str("People: ", gamestate.people))
	add_item(str("Food: ", gamestate.food))
	add_item(str("Culture: ", gamestate.culture))
	add_item(str("Wood: ", gamestate.materials["wood"]))
	add_item(str("Stone: ", gamestate.materials["stone"]))
	add_item(str("Ore: ", gamestate.materials["ore"]))
	add_item(str("Plank: ", gamestate.materials["plank"]))
	add_item(str("Brick: ", gamestate.materials["brick"]))
	add_item(str("Ingot: ", gamestate.materials["ingot"]))

func load_stats():
	add_item(str("Damage: ", gamestate.stats["damage"]), load("res://Assets/Art/Icons/damage1.png"))
	add_item(str("Defense: ", gamestate.stats["defense"]), load("res://Assets/Art/Icons/defense1.png"))
	add_item(str("Woodcutting: ", gamestate.stats["woodcutting"]), load("res://Assets/Art/Icons/axe1.png"))
	add_item(str("Mining: ", gamestate.stats["mining"]), load("res://Assets/Art/Icons/pickaxe1.png"))
	add_item(str("Farming: ", gamestate.stats["farming"]), load("res://Assets/Art/Icons/sickle1.png"))
	
func display_resources():
	set_item_text(0, str("People: ", gamestate.people))
	set_item_text(1, str("Food: ", gamestate.food))
	set_item_text(2, str("Culture: ", gamestate.culture))
	set_item_text(3, str("Wood: ", gamestate.materials["wood"]))
	set_item_text(4, str("Stone: ", gamestate.materials["stone"]))
	set_item_text(5, str("Ore: ", gamestate.materials["ore"]))
	set_item_text(6, str("Plank: ", gamestate.materials["plank"]))
	set_item_text(7, str("Brick: ", gamestate.materials["brick"]))
	set_item_text(8, str("Ingot: ", gamestate.materials["ingot"]))
	
func display_stats():
	set_item_text(0, str("Damage: ", gamestate.stats["damage"]))
	set_item_text(1, str("Defense: ", gamestate.stats["defense"]))
	set_item_text(2, str("Woodcutting: ", gamestate.stats["woodcutting"]))
	set_item_text(3, str("Mining: ", gamestate.stats["mining"]))
	set_item_text(4, str("Farming: ", gamestate.stats["farming"]))
