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

func select_structure(button_pressed):
	if button_pressed:
		gamestate.selected[str(self.name)] = true
	else:
		gamestate.selected[str(self.name)] = false

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
			
	elif gamestate.selected["farm"] and gamestate.tile_empty:
		if gamestate.materials["wood"] >= 2 and gamestate.materials["stone"] >= 3:
			gamestate.materials["wood"] -= 2
			gamestate.materials["stone"] -= 3
			self.add_child(structure["farm"])
			gamestate.structures["farm"] += 1
			update_display()
		else:
			print("not enough material")
			
	elif gamestate.selected["sawmill"] and gamestate.tile_empty:
		if gamestate.materials["wood"] >= 2 and gamestate.materials["stone"] >= 3:
			gamestate.materials["wood"] -= 2
			gamestate.materials["stone"] -= 3
			self.add_child(structure["sawmill"])
			gamestate.structures["sawmill"] += 1
			update_display()
		else:
			print("not enough material")
			
	elif gamestate.selected["stonemason"] and gamestate.tile_empty:
		if gamestate.materials["wood"] >= 2 and gamestate.materials["stone"] >= 3:
			gamestate.materials["wood"] -= 2
			gamestate.materials["stone"] -= 3
			self.add_child(structure["stonemason"])
			gamestate.structures["stonemason"] += 1
			update_display()
		else:
			print("not enough material")
			
	elif gamestate.selected["foundry"] and gamestate.tile_empty:
		if gamestate.materials["wood"] >= 2 and gamestate.materials["stone"] >= 3:
			gamestate.materials["wood"] -= 2
			gamestate.materials["stone"] -= 3
			self.add_child(structure["foundry"])
			gamestate.structures["foundry"] += 1
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
			
	elif gamestate.selected["monument"] and gamestate.tile_empty:
		if gamestate.materials["wood"] >= 2 and gamestate.materials["stone"] >= 2 and gamestate.materials["ore"] >= 2:
			gamestate.materials["wood"] -= 2
			gamestate.materials["stone"] -= 2
			gamestate.materials["ore"] -= 2
			self.add_child(structure["monument"])
			gamestate.structures["monument"] += 1
			update_display()
		else:
			print("not enough material")
			
	else: return
