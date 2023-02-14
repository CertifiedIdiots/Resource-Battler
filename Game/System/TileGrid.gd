class_name TileGrid
extends Structures

func hover_tile():
	if self.get_child_count() <= 1:
		gamestate.tile_empty = true
	else:
		gamestate.tile_empty = false

func click_tile(viewport, event, shape_idx):
	if event.is_pressed():
		place_structure()
		gamestate.tile_empty = false
