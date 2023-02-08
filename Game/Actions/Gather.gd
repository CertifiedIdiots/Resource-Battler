class_name Gather
extends Node

onready var gamestate = get_node("/root/Gamestate")
onready var itemlist = get_node("/root/Gamestate/Control/ItemList")

func tree(viewport, event, shape_idx):
	if (event.is_pressed()):
		gamestate.materials["wood"] += 2
		print(gamestate.materials["wood"], " wood")
		itemlist.set_item_text(3, str("Wood: ", gamestate.materials["wood"]))

func rock(viewport, event, shape_idx):
	if (event.is_pressed()):
		gamestate.materials["stone"] += 1
		gamestate.materials["ore"] += 1
		print(gamestate.materials["stone"], " stone")
		print(gamestate.materials["ore"], " ore")
		itemlist.set_item_text(4, str("Stone: ", gamestate.materials["stone"]))
		itemlist.set_item_text(5, str("Ore: ", gamestate.materials["ore"]))

func wheat(viewport, event, shape_idx):
	if (event.is_pressed()):
		gamestate.food += 1
		print(gamestate.food, " food")
		itemlist.set_item_text(1, str("Food: ", gamestate.food))

func animal(viewport, event, shape_idx):
	if (event.is_pressed()):
		gamestate.food += 2
		print(gamestate.food, " food")
		itemlist.set_item_text(1, str("Food: ", gamestate.food))

func people(viewport, event, shape_idx):
	if (event.is_pressed()):
		gamestate.people += 5
		print("+5 people")
		print(gamestate.people, " people")
		itemlist.set_item_text(0, str("People: ", gamestate.people))
