class_name Structures
extends Craft

onready var structure = {
	"house": preload("res://Game/Tiles/HouseTile.tscn").instance(),
	"farm": preload("res://Game/Tiles/FarmTile.tscn").instance(),
	"sawmill": preload("res://Game/Tiles/SawmillTile.tscn").instance(),
	"stonemason": preload("res://Game/Tiles/StonemasonTile.tscn").instance(),
	"foundry": preload("res://Game/Tiles/FoundryTile.tscn").instance(),
	"warehouse": preload("res://Game/Tiles/WarehouseTile.tscn").instance(),
	"monument": preload("res://Game/Tiles/MonumentTile.tscn").instance(),
}

var pressed

func select_house(button_pressed):
	if button_pressed:
		gamestate.selected["house"] = true
	else:
		gamestate.selected["house"] = false

func select_warehouse(button_pressed):
	if button_pressed:
		gamestate.selected["warehouse"] = true
	else:
		gamestate.selected["warehouse"] = false

func place_structure():
	if gamestate.selected["house"] and gamestate.tile_empty:
		if gamestate.materials["wood"] >= 2 and gamestate.materials["stone"] >= 1:
			gamestate.materials["wood"] -= 2
			gamestate.materials["stone"] -= 1
			self.add_child(structure["house"])
			gamestate.structures["house"] += 1
			update_display()
		else:
			print("not enough material")
	elif gamestate.selected["warehouse"] and gamestate.tile_empty:
		if gamestate.materials["wood"] >= 2 and gamestate.materials["stone"] >= 1:
			gamestate.materials["wood"] -= 2
			gamestate.materials["stone"] -= 1
			self.add_child(structure["warehouse"])
			gamestate.structures["warehouse"] += 1
			update_display()
		else:
			print("not enough material")
	else: return
