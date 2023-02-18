class_name Boss
extends Node

onready var gamestate = $"/root/System/Gamestate"
onready var gather = load("res://Game/Actions/Gather.gd")

var tier = 1

export var max_health = 1000.0
var health = max_health

var damage = 0.0
var damage_increase = 0.0

var attack_timer = 0
