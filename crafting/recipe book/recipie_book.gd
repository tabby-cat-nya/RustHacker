extends PanelContainer

@export var vbox : VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RecipeManager.recipes_loaded.connect(recipes_loaded)
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func recipes_loaded():
	for recipe in RecipeManager.craft_recipes:
		var new_card = load("res://crafting/recipe book/recipe_card.tscn").instantiate() as RecipeCard
		new_card.show_recipe(recipe)
		vbox.add_child(new_card)
