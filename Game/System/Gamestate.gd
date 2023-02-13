class_name Gamestate
extends Node

var tile_empty: bool = false
var selected = {
	"house": false,
	"farm": false,
	"sawmill": false,
	"stonemason": false,
	"foundry": false,
	"warehouse": false,
	"monument": false
}

var people_cap = 20
var material_cap = 10

var people = 10
var food = 10
var culture = 0

var stats = {
	"damage": 0.0,
	"defense": 0.0,
	"woodcutting": 0.0,
	"mining": 0.0,
	"farming": 0.0
}

var materials = {
	"wood": 0,
	"stone": 0,
	"ore": 0,
	"plank": 0,
	"brick": 0,
	"ingot": 0
}

var items = {
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

func _init():
	people_cap = 20+(structures["house"]*5)
	material_cap = 10+(structures["warehouse"]*10)
	stats["damage"] = (people/5.0)+(items["t1_weapon"]*1)+(items["t2_weapon"]*2)
	stats["defense"] = (items["t1_armor"]*1)+(items["t2_armor"]*2)
	stats["woodcutting"] = (people/5.0)+(items["t1_axe"]*2)+(items["t2_axe"]*4)
	stats["mining"] = (people/10.0)+(items["t1_pickaxe"]*1)+(items["t2_pickaxe"]*2)
	stats["farming"] = (people/10.0)+(items["t1_sickle"]*1)+(items["t2_sickle"]*2)
	
