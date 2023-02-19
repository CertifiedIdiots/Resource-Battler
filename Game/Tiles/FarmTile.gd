extends Area2D

onready var system = $"/root/System"
onready var gamestate = $"/root/System/Gamestate"
onready var board = $"/root/System/Gamestate/Boardstate/Board"

var adjacent_tiles = []
var available_tiles = []

func generate_wheat():
	adjacent_tiles = get_parent().get_overlapping_areas()
	
	var rng = RandomNumberGenerator.new()
	
	for tile in adjacent_tiles:
		tile.hover_tile()
		
		if tile.tile_empty == true:
			available_tiles.append(tile)
			
	var wheat = preload("res://Game/Tiles/WheatTile.tscn").instance()
		
	rng.randomize()
	var random = rng.randi() % available_tiles.size()
	var selected = available_tiles[random]
	selected.add_child(wheat)
