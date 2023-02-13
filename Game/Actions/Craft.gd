class_name Craft
extends Gather

func plank():
	if gamestate.materials["wood"] >= 3:
		gamestate.materials["wood"] -= 3
		gamestate.materials["plank"] += 1
		update_display()
	else: print("not enough materials!")

func brick():
	if gamestate.materials["stone"] >= 2:
		gamestate.materials["stone"] -= 2
		gamestate.materials["brick"] += 1
		update_display()
	else: print("not enough materials!")

func ingot():
	if gamestate.materials["ore"] >= 2:
		gamestate.materials["ore"] -= 2
		gamestate.materials["ingot"] += 1
		update_display()
	else: print("not enough materials!")

func t1_weapon():
	if gamestate.materials["ore"] >= 3:
		gamestate.materials["ore"] -= 3
		gamestate.items["t1_weapon"] += 1
		update_display()
	else: print("not enough materials!")

func t1_armor():
	if gamestate.materials["ore"] >= 3:
		gamestate.materials["ore"] -= 3
		gamestate.items["t1_armor"] += 1
		update_display()
	else: print("not enough materials!")

func t1_axe():
	if gamestate.materials["wood"] >= 3 and gamestate.materials["ore"] >= 1:
		gamestate.materials["wood"] -= 3
		gamestate.materials["ore"] -= 1
		gamestate.items["t1_axe"] += 1
		update_display()
	else: print("not enough materials!")

func t1_pickaxe():
	if gamestate.materials["wood"] >= 3 and gamestate.materials["ore"] >= 1:
		gamestate.materials["wood"] -= 3
		gamestate.materials["ore"] -= 1
		gamestate.items["t1_pickaxe"] += 1
		update_display()
	else: print("not enough materials!")

func t1_sickle():
	if gamestate.materials["wood"] >= 3 and gamestate.materials["ore"] >= 1:
		gamestate.materials["wood"] -= 3
		gamestate.materials["ore"] -= 1
		gamestate.items["t1_sickle"] += 1
		update_display()
	else: print("not enough materials!")
