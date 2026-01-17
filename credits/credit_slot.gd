extends ItemSlot

@export var link : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	block_taking = true
	if link != "":
		label.text = "🌐"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gui_input(event: InputEvent) -> void:
	if event.is_pressed() and link != "":
		OS.shell_open(link)
		#print("slot clicked")
