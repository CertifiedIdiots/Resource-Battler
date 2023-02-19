class_name System
extends Node

onready var gamestate = $"Gamestate"
onready var interface = $"Gamestate/Interface"
onready var boss = $"Gamestate/Boss".get_child(0)

onready var timer = load("res://Game/System/timer.tscn").instance()

var initial_tiles = 30
var board = []
var farm_tiles = []
var rng = RandomNumberGenerator.new()

func _process(delta):
	interface.update_display()
	boss.update()
	if gamestate.people <= 0:
		end_game()
	if boss.health <= 0:
		end_game()

func end_game():
	if gamestate.people <= 0:
		print("GAME OVER!")
		get_tree().paused = true
	if boss.health <= 0:
		print("YOU WIN!")
		get_tree().paused = true
	
func generate_board():
	for tile in $Gamestate/Boardstate/Board.get_children():
		board.append(tile)

func _ready():
	generate_board()
	for current_tile in board:
	
		var resources = [
			preload("res://Game/Tiles/TreeTile.tscn").instance(),
			preload("res://Game/Tiles/RockTile.tscn").instance(),
			preload("res://Game/Tiles/OreTile.tscn").instance(),
			preload("res://Game/Tiles/WheatTile.tscn").instance(),
			preload("res://Game/Tiles/AnimalTile.tscn").instance(),
			preload("res://Game/Tiles/PeopleTile.tscn").instance()
			]
		
		rng.randomize()
		current_tile.hover_tile()
		rng.randi_range(0, board.size())
		if current_tile.tile_empty and (rng.randi_range(0, 100) <= 45):
			current_tile.add_child(resources[(rng.randi_range(0, 5))])
	print("~~ TURN ", gamestate.turn_count, " ~~")
			
func generate_tiles():
	for current_tile in board:
	
		var random = rng.randi_range(0, 100)
	
		var resources = [
			preload("res://Game/Tiles/TreeTile.tscn").instance(),
			preload("res://Game/Tiles/RockTile.tscn").instance(),
			preload("res://Game/Tiles/OreTile.tscn").instance(),
			preload("res://Game/Tiles/WheatTile.tscn").instance(),
			preload("res://Game/Tiles/AnimalTile.tscn").instance(),
			preload("res://Game/Tiles/PeopleTile.tscn").instance()
			]
		
		rng.randomize()
		current_tile.hover_tile()
		rng.randi_range(0, board.size())
		if current_tile.tile_empty and (random == 0):
			current_tile.add_child(resources[(rng.randi_range(0, 5))])
			
func hunger():
	if gamestate.food == 0:
		gamestate.people = 0
	else:
		gamestate.food = clamp((gamestate.food - (gamestate.people / 10.0)), 0, (gamestate.food - (gamestate.people / 10.0)))
		
func level_up():
	gamestate.culture = 0
	gamestate.level += 1
	gamestate.required_culture *= 2
	print("level ", gamestate.level," - choose perk")
	print("next level: ", gamestate.required_culture)
		
func culture():
	gamestate.culture += ((gamestate.people / 5) + (gamestate.structures["monument"] * 100))
	if gamestate.culture >= gamestate.required_culture:
		level_up()
			
func attack_boss():
	boss.health = clamp((boss.health - gamestate.stats["damage"]), 0, (boss.health - gamestate.stats["damage"]))
	next_turn()

func farm():
	rng.randomize()
	for farm in farm_tiles:
		var chance = rng.randi() % 100
		if chance <= 60:
			farm.generate_wheat()
			rng.randomize()
	
func next_turn():
	gamestate.turn_count += 1
	print("~~ TURN ", gamestate.turn_count, " ~~")
	generate_tiles()
	hunger()
	culture()
	farm()
	interface.update_display()
	boss.attack()
	return
	
