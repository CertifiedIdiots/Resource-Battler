class_name Structures
extends Craft

export(ButtonGroup) var group

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
		gamestate.build_mode = true
	else:
		gamestate.selected[str(self.name)] = false
		gamestate.build_mode = false
		


func place_structure():
	if gamestate.selected["house"] and self.tile_empty:
		if gamestate.materials["wood"] >= 20 and gamestate.materials["stone"] >= 10:
			gamestate.materials["wood"] -= 20
			gamestate.materials["stone"] -= 10
			self.add_child(structure["house"])
			gamestate.structures["house"] += 1
			system.next_turn()
		else:
			print("not enough material")
			
	elif gamestate.selected["farm"] and self.tile_empty:
		if gamestate.materials["wood"] >= 10 and gamestate.materials["stone"] >= 20:
			gamestate.materials["wood"] -= 10
			gamestate.materials["stone"] -= 20
			self.add_child(structure["farm"])
			gamestate.structures["farm"] += 1
			system.farm_tiles.append(self.get_child(1))
			system.next_turn()
		else:
			print("not enough material")
			
	elif gamestate.selected["sawmill"] and self.tile_empty:
		if gamestate.materials["wood"] >= 10 and gamestate.materials["stone"] >= 20:
			gamestate.materials["wood"] -= 10
			gamestate.materials["stone"] -= 20
			self.add_child(structure["sawmill"])
			gamestate.structures["sawmill"] += 1
			system.next_turn()
		else:
			print("not enough material")
			
	elif gamestate.selected["stonemason"] and self.tile_empty:
		if gamestate.materials["wood"] >= 10 and gamestate.materials["stone"] >= 20:
			gamestate.materials["wood"] -= 10
			gamestate.materials["stone"] -= 20
			self.add_child(structure["stonemason"])
			gamestate.structures["stonemason"] += 1
			system.next_turn()
		else:
			print("not enough material")
			
	elif gamestate.selected["foundry"] and self.tile_empty:
		if gamestate.materials["wood"] >= 10 and gamestate.materials["stone"] >= 20:
			gamestate.materials["wood"] -= 10
			gamestate.materials["stone"] -= 20
			self.add_child(structure["foundry"])
			gamestate.structures["foundry"] += 1
			system.next_turn()
		else:
			print("not enough material")
			
	elif gamestate.selected["warehouse"] and self.tile_empty:
		if gamestate.materials["wood"] >= 20 and gamestate.materials["stone"] >= 10:
			gamestate.materials["wood"] -= 20
			gamestate.materials["stone"] -= 10
			self.add_child(structure["warehouse"])
			gamestate.structures["warehouse"] += 1
			system.next_turn()
		else:
			print("not enough material")
			
	elif gamestate.selected["monument"] and self.tile_empty:
		if gamestate.materials["wood"] >= 20 and gamestate.materials["stone"] >= 20 and gamestate.materials["ore"] >= 20:
			gamestate.materials["wood"] -= 20
			gamestate.materials["stone"] -= 20
			gamestate.materials["ore"] -= 20
			self.add_child(structure["monument"])
			gamestate.structures["monument"] += 1
			system.next_turn()
		else:
			print("not enough material")
			
	else: return
