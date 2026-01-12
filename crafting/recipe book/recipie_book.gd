extends PanelContainer

@export var vbox : VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	var test_card = load("res://crafting/recipe book/recipe_card.tscn").instantiate() as RecipeCard
	var recipe : CraftRecipe = load("res://crafting/crafts/computer_craft.tres")
	print(recipe)
	test_card.show_recipe(recipe)
	vbox.add_child(test_card)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
