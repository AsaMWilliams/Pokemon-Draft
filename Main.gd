extends Node

var pokepaste = ""

func load_regulation():
	# Take regulation letter and run switch statement based on letter. Open corresponding regulation file.
	# Currently defaults to regulation D instead of telling the player to select a valid option. Probably fix this.
	var file = FileAccess.open("res://regulations/regulation_d.txt", FileAccess.READ)
	match $UI/SelectRegulation.get_selected_id():
		0:
			pass
		1:
			file = FileAccess.open("res://regulations/regulation_d.txt", FileAccess.READ)
		2:
			file = FileAccess.open("res://regulations/regulation_e.txt", FileAccess.READ)
		3:
			file = FileAccess.open("res://regulations/regulation_f.txt", FileAccess.READ)
	
	var content = file.get_as_text()
	
	var pokemon_list = content.split("\n")
	
	return pokemon_list


func roll_draft_box(pokemon_list: Array):
	
	pokemon_list.shuffle()
	var box_list = []
	box_list.resize(24)
	var selection_number = min(pokemon_list.size(), box_list.size())
	
	for i in selection_number:
		box_list[i] = pokemon_list[i].strip_edges()
		
	return box_list


func new_roll():
	pokepaste = ""
	var box = roll_draft_box(load_regulation())
	
	for i in box.size():
		
		pokepaste += box[i]
		pokepaste += "\nLevel: 50\n\n"
	
	print(pokepaste)
	#$UI/PokepasteOutput.text = pokepaste
	
	$SpriteGrid.render(box)


func _ready():
	pass


func _on_ui_copy_pokepaste():
	DisplayServer.clipboard_set(pokepaste)
