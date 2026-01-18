extends PanelContainer

@export var tooltip_label : RichTextLabel
@export var exdata_box : VBoxContainer
@export var exdata_label : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position() + Vector2(12,-6)

func show_tip(item : ItemData, extra : String = ""):
	tooltip_label.text = item.item_name
	if item.buy_value > 200:
		tooltip_label.text += "\n[color=gold]Sell Value: $"+str(floori(item.buy_value/float(2))) + "[/color]"
	elif item.buy_value > 0:
		tooltip_label.text += "\nSell Value: $"+str(floori(item.buy_value/float(2)))
	if item.botnet_power > 0:
		tooltip_label.text += "\n[color=orchid]Botnet Power: " + str(item.botnet_power) +"[/color]"
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
