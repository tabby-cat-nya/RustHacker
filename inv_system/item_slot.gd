extends Panel
class_name ItemSlot

@export var icon : TextureRect
@export var item: ItemData
@export var label : Label

func _ready() -> void:
	update_ui()

func update_ui():
	if not item:
		icon.texture = null
		label.text = ""
		return
		
	icon.texture = item.icon
	tooltip_text = item.item_name
	label.text = item.value
		

func _get_drag_data(at_position: Vector2) -> Variant:
	if not item:
		return
	
	var preview = duplicate()
	var c = Control.new()
	c.add_child(preview)
	preview.position -= Vector2(32,32)
	preview.self_modulate = Color.TRANSPARENT
	c.modulate = Color(c.modulate,0.5)
	set_drag_preview(c)
	icon.hide()
	return self

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var temp = item
	item = data.item
	data.item = temp
	icon.show()
	data.icon.show()
	update_ui()
	data.update_ui()


func _on_mouse_entered() -> void:
	print("im real?")
	if item:
		Tooltip.show_tip(item.item_name)
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	Tooltip.hide_tip()
	pass # Replace with function body.
