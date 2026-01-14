extends Inventory

@export var install_button : Button
@export var score_label : Label

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
		if slots[0].item.item_name == "Server":
			install_button.disabled = false
		else:
			install_button.disabled = true
	else:
		install_button.disabled = true
	


func _on_button_pressed() -> void:
	slots[0].item = null
	slots[0].update_ui()
	PlayerInventory.botnet_servers += 1
