extends PanelContainer

@export var tooltip_label : Label
@export var exdata_box : VBoxContainer
@export var exdata_label : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position() + Vector2(12,-6)

func show_tip(text : String, extra : String = ""):
	tooltip_label.text = text
	if extra != "":
		exdata_box.show()
		exdata_label.text = extra
	else:
		exdata_box.hide()
	reset_size()
	show()

func hide_tip():
	hide()
	pass
