extends PanelContainer
class_name Inventory

@export var inventory_name : String = "Inventory"
@export var slots : Array[ItemSlot]
@export var type: String
@export_group("Node References")
@export var grid : GridContainer
@export var inv_label : Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slots.assign(grid.get_children())
	inv_label.text = inventory_name
	for slot in slots:
		slot.type = type
	if type == "Inventory":
		MouseTweaks.player_inventory = self
	elif type != "Install":
		MouseTweaks.other_inventory = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.get_current_cursor_shape() == CURSOR_FORBIDDEN:
		DisplayServer.cursor_set_shape(DisplayServer.CURSOR_ARROW)

var data_bk
func _notification(what: int) -> void:
	if what == Node.NOTIFICATION_DRAG_BEGIN:
		data_bk = get_viewport().gui_get_drag_data()
	if what == Node.NOTIFICATION_DRAG_END:
		if not is_drag_successful():
			if data_bk:
				data_bk.icon.show()
				data_bk = null

#attempts to add the provided item to the inventory, returns true on success
func add_item(item : ItemData) -> bool:
	for slot in slots:
		if slot.item == null:
			slot.item = item
			slot.update_ui()
			return true # item placed successfully
	return false # theres no space to add the item
	
func filled_slots() -> int:
	var count : int = 0
	for slot in slots:
		if slot.item:
			count += 1
	return count

func empty_grid():
	for slot in slots:
		slot.item = null
		slot.update_ui()
