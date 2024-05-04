extends CanvasLayer

signal start_game
signal copy_pokepaste


func _on_roll_pressed():
	start_game.emit()

func _ready():
	$SelectRegulation.add_item("Select Regulation")
	$SelectRegulation.add_item("Regulation D")
	$SelectRegulation.add_item("Regulation E")
	$SelectRegulation.add_item("Regulation F")


func _on_copy_to_clipboard_pressed():
	copy_pokepaste.emit()
