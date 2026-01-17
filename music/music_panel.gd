extends Control

@export var ambient_player : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_h_slider_value_changed(0.3)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_h_slider_value_changed(value: float) -> void:
	#var new_db = linear_to_db(value)
	AudioServer.set_bus_volume_linear(1, value)


func _on_audio_stream_player_finished() -> void:
	ambient_player.play()
