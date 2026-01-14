extends PanelContainer

@export var listing_grid : GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#RecipeManager.recipes_loaded.connect(make_listings)
	make_listings()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func make_listings():
	print("building meowbay")
	for item in RecipeManager.items:
		if item.can_buy:
			var new_listing = load("res://shop/listing.tscn").instantiate()
			new_listing.prepare(item)
			listing_grid.add_child(new_listing)
