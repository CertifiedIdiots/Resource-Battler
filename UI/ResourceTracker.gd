extends ItemList

onready var gamestate = get_node("/root/Gamestate")

func start():
	self.add_item(str("People: ", gamestate.people))
	self.add_item(str("Food: ", gamestate.food))
	self.add_item(str("Culture: ", gamestate.culture))
	self.add_item(str("Wood: ", gamestate.materials["wood"]))
	self.add_item(str("Stone: ", gamestate.materials["stone"]))
	self.add_item(str("Ore: ", gamestate.materials["ore"]))
	self.add_item(str("Wood: ", gamestate.materials["plank"]))
	self.add_item(str("Brick: ", gamestate.materials["brick"]))
	self.add_item(str("Ingot: ", gamestate.materials["ingot"]))
