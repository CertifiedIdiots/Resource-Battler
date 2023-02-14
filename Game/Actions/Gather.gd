class_name Gather
extends Node

onready var gamestate = $"/root/System/Gamestate"
onready var resourcelist = get_node("/root/System/Gamestate/Interface/resources")
onready var statslist = get_node("/root/System/Gamestate/Interface/stats")

func update_display():
	gamestate.stats["damage"] = (gamestate.people/5.0)+(gamestate.items["t1_weapon"]*1)+(gamestate.items["t2_weapon"]*2)
	gamestate.stats["defense"] = (gamestate.items["t1_armor"]*1)+(gamestate.items["t2_armor"]*2)
	gamestate.stats["woodcutting"] = (gamestate.people/5.0)+(gamestate.items["t1_axe"]*2)+(gamestate.items["t2_axe"]*4)
	gamestate.stats["mining"] = (gamestate.people/10.0)+(gamestate.items["t1_pickaxe"]*1)+(gamestate.items["t2_pickaxe"]*2)
	gamestate.stats["farming"] = (gamestate.people/10.0)+(gamestate.items["t1_sickle"]*1)+(gamestate.items["t2_sickle"]*2)
	gamestate.material_cap = 10+(gamestate.structures["warehouse"]*10)
	gamestate.people_cap = 20+(gamestate.structures["house"]*5)
	resourcelist.display_resources()
	statslist.display_stats()

func tree(viewport, event, shape_idx):
	if (event.is_pressed()):
		if gamestate.materials["wood"] != gamestate.material_cap:
			gamestate.materials["wood"] += clamp(gamestate.stats["woodcutting"], 0, (gamestate.material_cap-gamestate.materials["wood"]))
			update_display()
			self.queue_free()
		else: 
			print("wood is full capacity!")

func rock(viewport, event, shape_idx):
	if (event.is_pressed()):
		if gamestate.materials["stone"] != gamestate.material_cap:
			gamestate.materials["stone"] += clamp(gamestate.stats["mining"], 0, (gamestate.material_cap-gamestate.materials["stone"]))
			update_display()
			self.queue_free()
		else:
			print("stone is full capacity!")
		if gamestate.materials["ore"] != gamestate.material_cap:
			gamestate.materials["ore"] += clamp(gamestate.stats["mining"], 0, (gamestate.material_cap-gamestate.materials["ore"]))
			update_display()
			self.queue_free()
		else:
			print("ore is full capacity!")

func wheat(viewport, event, shape_idx):
	if (event.is_pressed()):
		gamestate.food += (gamestate.stats["farming"])
		update_display()
		self.queue_free()

func animal(viewport, event, shape_idx):
	if (event.is_pressed()):
		gamestate.food += (gamestate.stats["damage"])
		update_display()
		self.queue_free()

func people(viewport, event, shape_idx):
	if (event.is_pressed()):
		if gamestate.people != gamestate.people_cap:
			gamestate.people += clamp(5, 0, (gamestate.people_cap-gamestate.people))
			resourcelist.display_resources()
			update_display()
			self.queue_free()
		else:
			print("people are full capacity!")
