class_name Gamestate
extends Node

var turn_count = 1
var level = 0
var required_culture = 100

var people_cap = 100
var material_cap = 100

var people = 100
var food = 200
var culture = 0

var stats = {
	"damage": 0.0,
	"defense": 0.0,
	"woodcutting": 0.0,
	"mining": 0.0,
	"farming": 0.0
}

var inventory = {
	"wood": 0,
	"stone": 0,
	"ore": 0,
	"plank": 0,
	"brick": 0,
	"ingot": 0,
	
	"t1_weapon": 0,
	"t2_weapon": 0,
	
	"t1_armor": 0,
	"t2_armor": 0,
	
	"t1_axe": 0,
	"t2_axe": 0,
	
	"t1_pickaxe": 0,
	"t2_pickaxe": 0,
	
	"t1_sickle": 0,
	"t2_sickle": 0
}

var structures = {
	"house": 0,
	"farm": 0,
	"sawmill": 0,
	"stonemason": 0,
	"foundry": 0,
	"warehouse": 0,
	"monument": 0
}

var tile_empty: bool = false
var build_mode = false

var selected = {
	"house": false,
	"farm": false,
	"sawmill": false,
	"stonemason": false,
	"foundry": false,
	"warehouse": false,
	"monument": false
}
