extends PanelContainer
class_name RecipeCard

@export var grid_container : GridContainer
var ingredient_slots : Array[ItemSlot]
@export var output_slot : ItemSlot
@export var output_label : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ingredient_slots.assign(grid_container.get_children())
	#slots.assign(grid.get_children())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_recipe(recipe : CraftRecipe):
	ingredient_slots.assign(grid_container.get_children())
	for x in range(9):
		#if recipe.ingredients[x]:
		ingredient_slots[x].item = recipe.ingredients[x]
		ingredient_slots[x].update_ui()
		ingredient_slots[x].block_taking = true
	output_slot.item = recipe.output
	#if (PlayerInventory.power_values.has(recipe.output)):
		#output_slot.extra_data = "Botnet Power: " + str(PlayerInventory.power_values.get(recipe.output))
	
	output_slot.update_ui()
	output_slot.block_taking = true
	output_label.text = recipe.output.item_name
