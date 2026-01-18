extends Control

@export var node_ewaste : Control
@export var node_workshop : Control
@export var node_room : Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Locations.moved.connect(move_detected)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	node_ewaste.visible = Locations.current_location == Locations.Location.ewaste
	node_workshop.visible = Locations.current_location == Locations.Location.workshop
	node_room.visible = Locations.current_location == Locations.Location.room

func move_detected():
	if Locations.current_location == Locations.Location.ewaste:
		node_ewaste._ready()
	elif Locations.current_location == Locations.Location.workshop:
		node_workshop._ready()
	elif Locations.current_location == Locations.Location.room:
		node_room._ready()
