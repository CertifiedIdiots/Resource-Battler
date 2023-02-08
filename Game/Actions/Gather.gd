class_name Gather
extends Gamestate

func tree(viewport, event, shape_idx):
	if (event.is_pressed()):
		materials["wood"] += 1
		print("+1 wood")
		print(materials["wood"])

func rock(viewport, event, shape_idx):
	if (event.is_pressed()):
		materials["stone"] += 1
		materials["ore"] += 1
		print("+1 stone")
		print("+1 ore")
		print(materials["stone"])
		print(materials["ore"])

func wheat(viewport, event, shape_idx):
	if (event.is_pressed()):
		get_node(".").food += 1
		print("+1 food")
		print(get_node(".").food)

func animal(viewport, event, shape_idx):
	if (event.is_pressed()):
		food += 2
		print("+2 food")
		print(food)

func people(viewport, event, shape_idx):
	if (event.is_pressed()):
		people += 5
		print("+5 people")
		print(people)
