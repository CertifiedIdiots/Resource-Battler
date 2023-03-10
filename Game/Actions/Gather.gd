class_name Gather
extends Node

onready var system = $"/root/System"
onready var gamestate = $"/root/System/Gamestate"
onready var interface = $"/root/System/Gamestate/Interface"

func tree(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		if gamestate.inventory["wood"] != gamestate.material_cap:
			gamestate.inventory["wood"] += clamp(gamestate.stats["woodcutting"], 0, (gamestate.material_cap-gamestate.inventory["wood"]))
			self.queue_free()
			system.next_turn()
		else: 
			print("wood is full capacity!")
	else:
		return

func rock(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		if gamestate.inventory["stone"] != gamestate.material_cap:
			gamestate.inventory["stone"] += clamp(gamestate.stats["mining"], 0, (gamestate.material_cap-gamestate.inventory["stone"]))
			self.queue_free()
			system.next_turn()
		else: 
			print("stone is full capacity!")
	else:
		return

func ore(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		if gamestate.inventory["ore"] != gamestate.material_cap:
			gamestate.inventory["ore"] += clamp(gamestate.stats["mining"], 0, (gamestate.material_cap-gamestate.inventory["ore"]))
			self.queue_free()
			system.next_turn()
		else: 
			print("ore is full capacity!")
	else:
		return

func wheat(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		gamestate.food += (gamestate.stats["farming"])
		self.queue_free()
		system.next_turn()

func animal(viewport, event, shape_idx):
	if (event.is_action_pressed("left_click")):
		gamestate.food += (gamestate.stats["damage"])
		self.queue_free()
		system.next_turn()

func people(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		if gamestate.people != gamestate.people_cap:
			gamestate.people += clamp(50, 0, (gamestate.people_cap-gamestate.people))

			self.queue_free()
			system.next_turn()
		else:
			print("people are full capacity!")

func temp_tree():
	if gamestate.inventory["wood"] != gamestate.material_cap:
		gamestate.inventory["wood"] += clamp(gamestate.stats["woodcutting"], 0, (gamestate.material_cap-gamestate.inventory["wood"]))
	else: 
		print("wood is full capacity!")

func temp_rock():
	if gamestate.inventory["stone"] != gamestate.material_cap:
		gamestate.inventory["stone"] += clamp(gamestate.stats["mining"], 0, (gamestate.material_cap-gamestate.inventory["stone"]))
	else: 
		print("stone is full capacity!")
		
func temp_ore():
	if gamestate.inventory["ore"] != gamestate.material_cap:
		gamestate.inventory["ore"] += clamp(gamestate.stats["mining"], 0, (gamestate.material_cap-gamestate.inventory["ore"]))
	else: 
		print("ore is full capacity!")
		

func temp_wheat():
	gamestate.food += (gamestate.stats["farming"])


func temp_animal():
	gamestate.food += (gamestate.stats["damage"])


func temp_people():
	if gamestate.people != gamestate.people_cap:
		gamestate.people += clamp(50, 0, (gamestate.people_cap-gamestate.people))
	else:
		print("people are full capacity!")
