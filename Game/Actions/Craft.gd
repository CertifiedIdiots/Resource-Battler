class_name Craft
extends Gather

# MATERIALS ----------------------------------------------

func plank():
	if gamestate.materials["wood"] >= 20:
		gamestate.materials["wood"] -= 20
		gamestate.materials["plank"] += 1 + (gamestate.structures["sawmill"] * 1)
		system.next_turn()
	else: print("not enough materials!")

func brick():
	if gamestate.materials["stone"] >= 20:
		gamestate.materials["stone"] -= 20
		gamestate.materials["brick"] += 1 + (gamestate.structures["stonemason"] * 1)
		system.next_turn()
	else: print("not enough materials!")

func ingot():
	if gamestate.materials["ore"] >= 20:
		gamestate.materials["ore"] -= 20
		gamestate.materials["ingot"] += 1 + (gamestate.structures["foundry"] * 1)
		system.next_turn()
	else: print("not enough materials!")

# COMBAT -------------------------------------------------

func t1_weapon():
	if gamestate.materials["ore"] >= 30:
		gamestate.materials["ore"] -= 30
		gamestate.items["t1_weapon"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t2_weapon():
	if gamestate.items["t1_weapon"] >= 1 and gamestate.materials["ingot"] >= 2:
		gamestate.items["t1_weapon"] -= 1
		gamestate.materials["ingot"] -= 2
		gamestate.items["t2_weapon"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t1_armor():
	if gamestate.materials["ore"] >= 30:
		gamestate.materials["ore"] -= 30
		gamestate.items["t1_armor"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t2_armor():
	if gamestate.items["t1_armor"] >= 1 and gamestate.materials["ingot"] >= 2:
		gamestate.items["t1_armor"] -= 1
		gamestate.materials["ingot"] -= 2
		gamestate.items["t2_armor"] += 1
		system.next_turn()
	else: print("not enough materials!")

# TOOLS -------------------------------------------------

func t1_axe():
	if gamestate.materials["wood"] >= 20 and gamestate.materials["ore"] >= 10:
		gamestate.materials["wood"] -= 20
		gamestate.materials["ore"] -= 10
		gamestate.items["t1_axe"] += 1
		system.next_turn()
	else: print("not enough materials!")
	
func t2_axe():
	if gamestate.items["t1_axe"] >= 1 and gamestate.materials["plank"] >= 1 and gamestate.materials["ingot"] >= 1:
		gamestate.items["t1_axe"] -= 1
		gamestate.materials["plank"] -= 1
		gamestate.materials["ingot"] -= 1
		gamestate.items["t2_axe"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t1_pickaxe():
	if gamestate.materials["wood"] >= 20 and gamestate.materials["ore"] >= 10:
		gamestate.materials["wood"] -= 20
		gamestate.materials["ore"] -= 10
		gamestate.items["t1_pickaxe"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t2_pickaxe():
	if gamestate.items["t1_pickaxe"] >= 1 and gamestate.materials["plank"] >= 1 and gamestate.materials["ingot"] >= 1:
		gamestate.items["t1_pickaxe"] -= 1
		gamestate.materials["plank"] -= 1
		gamestate.materials["ingot"] -= 1
		gamestate.items["t2_pickaxe"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t1_sickle():
	if gamestate.materials["wood"] >= 20 and gamestate.materials["ore"] >= 10:
		gamestate.materials["wood"] -= 20
		gamestate.materials["ore"] -= 10
		gamestate.items["t1_sickle"] += 1
		system.next_turn()
	else: print("not enough materials!")

func t2_sickle():
	if gamestate.items["t1_sickle"] >= 1 and gamestate.materials["plank"] >= 1 and gamestate.materials["ingot"] >= 1:
		gamestate.items["t1_sickle"] -= 1
		gamestate.materials["plank"] -= 1
		gamestate.materials["ingot"] -= 1
		gamestate.items["t2_sickle"] += 1
		system.next_turn()
	else: print("not enough materials!")
