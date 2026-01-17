extends Inventory

@export var install_button : Button
@export var score_label : Label
#@export var power_values : Dictionary[ItemData,int]
@export var power_predict : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	check_server()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	score_label.text = str(PlayerInventory.botnet_servers)
	pass

func _notification(what: int) -> void:
	super(what)
	if what == Node.NOTIFICATION_DRAG_END:
		check_server()
		pass

func check_server():
	if slots[0].item:
		if slots[0].item.botnet_power > 0:
			install_button.disabled = false
			power_predict.text = "[color=green][wave]Device Power: " + str(slots[0].item.botnet_power) 
		else:
			install_button.disabled = true
			power_predict.text = "[pulse]Insert a device to predict power"
	else:
		install_button.disabled = true
		power_predict.text = "[pulse]Insert a device to predict power"
	


func _on_button_pressed() -> void:
	PlayerInventory.botnet_servers += slots[0].item.botnet_power
	PlayerInventory.botnet.append(slots[0].item)
	install_button.disabled = true
	power_predict.text = "[pulse]Insert a device to predict power"
	slots[0].item = null
	slots[0].update_ui()
	
