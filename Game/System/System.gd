class_name System
extends TileGrid


var initial_tiles = 30
var board = []

var rng = RandomNumberGenerator.new()

func generate_board():
	for tile in self.get_children():
		board.append(tile)

func _ready():
	generate_board()
	for tile_gen in board:
	
		var resources = [
			preload("res://Game/Tiles/TreeTile.tscn").instance(),
			preload("res://Game/Tiles/RockTile.tscn").instance(),
			preload("res://Game/Tiles/WheatTile.tscn").instance(),
			preload("res://Game/Tiles/AnimalTile.tscn").instance(),
			preload("res://Game/Tiles/PeopleTile.tscn").instance()
			]
		
		rng.randomize()
		tile_gen.hover_tile()
		rng.randi_range(0, board.size())
		if tile_gen.gamestate.tile_empty and (rng.randi_range(0, board.size()) <= 34):
			tile_gen.add_child(resources[(rng.randi_range(0, 4))])
	
