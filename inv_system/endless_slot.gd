extends ItemSlot
# broken experiement, do not use in current state
var duplicate_item : ItemData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if item and not duplicate_item:
		duplicate_item = item
	
	if duplicate_item:
		item = duplicate_item
