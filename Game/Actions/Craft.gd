class_name Craft
extends Gather

var recipes = load("res://Game/System/Recipes.gd").new()

# MATERIALS ----------------------------------------------

func plank():
	if gamestate.inventory["wood"] >= 20:
		gamestate.inventory["wood"] -= 20
		gamestate.inventory["plank"] += 1 + (gamestate.structures["sawmill"] * 1)
		system.next_turn()
	else: print("not enough materials!")

func brick():
	if gamestate.inventory["stone"] >= 20:
		gamestate.inventory["stone"] -= 20
		gamestate.inventory["brick"] += 1 + (gamestate.structures["stonemason"] * 1)
		system.next_turn()
	else: print("not enough materials!")

func ingot():
	if gamestate.inventory["ore"] >= 20:
		gamestate.inventory["ore"] -= 20
		gamestate.inventory["ingot"] += 1 + (gamestate.structures["foundry"] * 1)
		system.next_turn()
	else: print("not enough materials!")

# COMBAT -------------------------------------------------

func t1_weapon():
	if gamestate.inventory["ore"] >= 30:
		gamestate.inventory["ore"] -= 30
		gamestate.inventory["t1_weapon"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t2_weapon():
	if gamestate.inventory["t1_weapon"] >= 1 and gamestate.inventory["ingot"] >= 2:
		gamestate.inventory["t1_weapon"] -= 1
		gamestate.inventory["ingot"] -= 2
		gamestate.inventory["t2_weapon"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t1_armor():
	if gamestate.inventory["ore"] >= 30:
		gamestate.inventory["ore"] -= 30
		gamestate.inventory["t1_armor"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t2_armor():
	if gamestate.inventory["t1_armor"] >= 1 and gamestate.inventory["ingot"] >= 2:
		gamestate.inventory["t1_armor"] -= 1
		gamestate.inventory["ingot"] -= 2
		gamestate.inventory["t2_armor"] += 1
		system.next_turn()
	else: print("not enough materials!")

# TOOLS -------------------------------------------------

func t1_axe():
	if gamestate.inventory["wood"] >= 20 and gamestate.inventory["ore"] >= 10:
		gamestate.inventory["wood"] -= 20
		gamestate.inventory["ore"] -= 10
		gamestate.inventory["t1_axe"] += 1
		system.next_turn()
	else: print("not enough materials!")
	
func t2_axe():
	if gamestate.inventory["t1_axe"] >= 1 and gamestate.inventory["plank"] >= 1 and gamestate.inventory["ingot"] >= 1:
		gamestate.inventory["t1_axe"] -= 1
		gamestate.inventory["plank"] -= 1
		gamestate.inventory["ingot"] -= 1
		gamestate.inventory["t2_axe"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t1_pickaxe():
	if gamestate.inventory["wood"] >= 20 and gamestate.inventory["ore"] >= 10:
		gamestate.inventory["wood"] -= 20
		gamestate.inventory["ore"] -= 10
		gamestate.inventory["t1_pickaxe"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t2_pickaxe():
	if gamestate.inventory["t1_pickaxe"] >= 1 and gamestate.inventory["plank"] >= 1 and gamestate.inventory["ingot"] >= 1:
		gamestate.inventory["t1_pickaxe"] -= 1
		gamestate.inventory["plank"] -= 1
		gamestate.inventory["ingot"] -= 1
		gamestate.inventory["t2_pickaxe"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t1_sickle():
	if gamestate.inventory["wood"] >= 20 and gamestate.inventory["ore"] >= 10:
		gamestate.inventory["wood"] -= 20
		gamestate.inventory["ore"] -= 10
		gamestate.inventory["t1_sickle"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t2_sickle():
	if gamestate.inventory["t1_sickle"] >= 1 and gamestate.inventory["plank"] >= 1 and gamestate.inventory["ingot"] >= 1:
		gamestate.inventory["t1_sickle"] -= 1
		gamestate.inventory["plank"] -= 1
		gamestate.inventory["ingot"] -= 1
		gamestate.inventory["t2_sickle"] += 1
		system.next_turn()
	else: print("not enough materials!")
