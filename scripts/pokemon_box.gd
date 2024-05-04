class_name PokemonBox

var regulation = ''
var pokemon_main: Array = []
var pokemon_sub: Array = []
var box = []
var is_restricted = false
# Currently statically assigned in code, can later be selectable by linking to UI
var restriced_num = 0
var size = 24
var pokepaste = ""


func _init(reg_id):
	
	match reg_id:
		0:
			regulation = 'd'
		1:
			regulation = 'd'
		2:
			regulation = 'e'
		3:
			regulation = 'f'
		4:
			regulation = 'g'
			is_restricted = true
			restriced_num = 2
	
	var file = FileAccess.open("res://regulations/regulation_" + regulation + ".tres", FileAccess.READ)
	var content = file.get_as_text()
	pokemon_main = content.split("\n")
	
	if is_restricted:
		file = FileAccess.open("res://regulations/restricteds.tres", FileAccess.READ)
		content = file.get_as_text()
		pokemon_sub = content.split("\n")

# Generates a pokepaste property for this object based on the date from the box property
func gen_paste():
	pokepaste = ""
	for i in box.size():
		pokepaste += box[i]
		pokepaste += "\nLevel: 50\n\n"

# Randomly populates the box property based on certain perameters
func roll():
	box.resize(size)
	pokemon_main.shuffle()
	pokemon_sub.shuffle()
	
	var selection_number = min(pokemon_main.size(), box.size())
	
	for i in selection_number:
		box[i] = pokemon_main[i].strip_edges()
	
	if is_restricted:
		selection_number = min(restriced_num, box.size())
		for i in selection_number:
			box[i] = pokemon_sub[i].strip_edges()
	
	gen_paste()
