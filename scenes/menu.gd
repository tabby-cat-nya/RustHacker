extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerInventory.hide()
	Clock.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	PlayerInventory.money = 0
	PlayerInventory.botnet_servers = 0
	PlayerInventory.inventory_panel.empty_grid()
	Clock.days_left = 6
	Clock.time_left = 200
	PlayerInventory.botnet.clear()
	PlayerInventory.show()
	Clock.show()
	Locations.show()
	Locations.goto_ewaste()
	#Locations.current_location = Locations.Location.workshop
	#get_tree().change_scene_to_file("res://scenes/workshop.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
