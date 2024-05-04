extends CanvasLayer

signal start_game
signal copy_pokepaste


func _on_roll_pressed():
	start_game.emit()

func _ready():
	pass


func _on_copy_to_clipboard_pressed():
	copy_pokepaste.emit()
