extends Inventory

@export var sell_label : Label
@export var sell_button : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	calculate_sell_value()
	Clock.new_day.connect(calculate_sell_value)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pass

func _notification(what: int) -> void:
	super(what)
	if what == Node.NOTIFICATION_DRAG_END:
		calculate_sell_value()
		pass

func calculate_sell_value():
	if slots[0].item:
		sell_label.text = str(floori(slots[0].item.buy_value / float(2)))
		sell_button.disabled = false
	else:
		sell_label.text = "Place an item"
		sell_button.disabled = true
	if not Clock.has_time(15):
		sell_button.disabled = true


func _on_sell_button_pressed() -> void:
	if slots[0].item and Clock.has_time(15):
		var sell_value : int = floori(slots[0].item.buy_value / float(2))
		slots[0].item = null
		slots[0].update_ui()
		PlayerInventory.money += sell_value
		Clock.use_time(15)
	calculate_sell_value()
	
