extends Node2D

var grid_sprites = []
var default_texture: Texture

func _ready():

	for i in range(get_child_count()):
		var child = get_child(i)
		if child is Sprite2D:
			child.texture = load("res://art/pokemon_sprites/default.png")
			grid_sprites.append(child)
	
	default_texture = load("res://art/pokemon_sprites/default.png")
	
# Loop through the pokemon box and load each pokemon's sprite
func render(pokemon_box: Array):
	for i in pokemon_box.size():
		var path = "res://art/pokemon_sprites/" + str(pokemon_box[i]) + ".png"
		var texture = load(path.to_lower())
		
		if texture == null:
			texture = default_texture

		grid_sprites[i].texture = texture
