extends PanelContainer

@export var listing_grid : GridContainer
@export var block_buy : Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#RecipeManager.recipes_loaded.connect(make_listings)
	make_listings()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	block_buy.visible = PlayerInventory.inventory_panel.empty_spots() <= 0

func make_listings():
	#print("building meowbay")
	for item in RecipeManager.items:
		if item.can_buy:
			var new_listing = load("res://shop/listing.tscn").instantiate()
			new_listing.prepare(item)
			listing_grid.add_child(new_listing)
