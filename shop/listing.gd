extends HBoxContainer

@export var item_slot : ItemSlot
@export var button : Button
var item_cost : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item_slot.block_taking = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if item_slot.item:
		button.disabled = PlayerInventory.money <= item_cost

func prepare(item : ItemData):
	item_slot.item = item
	button.text = "Buy $" + str(item.buy_value)
	item_cost = item.buy_value


func _on_button_pressed() -> void:
	if PlayerInventory.money >= item_cost:
		PlayerInventory.money -= item_cost
		PlayerInventory.inventory_panel.add_item(item_slot.item)
