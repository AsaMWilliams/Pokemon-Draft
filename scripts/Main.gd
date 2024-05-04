extends Node

var pokepaste = ""

func new_roll():
	var pokemon_box = PokemonBox.new($UI/SelectRegulation.get_selected_id())
	pokemon_box.roll()
	$SpriteGrid.render(pokemon_box.box)
	pokepaste = pokemon_box.pokepaste


func _ready():
	pass

# Copys the formatted pokepaste list to the clipboard when the "copy to clipboard" button is clicked
func _on_ui_copy_pokepaste():
	DisplayServer.clipboard_set(pokepaste)
