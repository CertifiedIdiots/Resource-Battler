class_name Craft
extends Node

onready var gamestate = get_node("/root/Gamestate")
onready var itemlist = get_node("/root/Gamestate/Control/ItemList")

func house_click(viewport, event, shape_idx):
	if (event.is_pressed()):
		if gamestate.materials["wood"] >= 2:
			gamestate.materials["wood"] -= 2
			gamestate.materials["plank"] += 1
			print(gamestate.materials["wood"], " wood")
			print(gamestate.materials["plank"], " planks")
			itemlist.set_item_text(3, str("Wood: ", gamestate.materials["wood"]))
			itemlist.set_item_text(6, str("Plank: ", gamestate.materials["plank"]))

#func brick():
#
#
#func ingot():
#
#
#func axe():
#
#
#func pickaxe():
#
#
#func plow():
#
#
#func house():
#
#
#func farm():
#
#
#func sawmill():
#
#
#func stonemason():
#
#
#func foundry():
#
#
#func warehouse():
#
#
#func monument():
