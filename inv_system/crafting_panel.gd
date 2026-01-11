extends Inventory

@export var action_button : Button
@export var craft_recipes : Array[CraftRecipe]
#@export var no_style : StyleBox
@export var assemble_style : StyleBox
@export var assemble_style_hover : StyleBox
@export var assemble_style_pressed : StyleBox
@export var scavenge_style : StyleBox
@export var scavenge_style_hover : StyleBox
@export var scavenge_style_pressed : StyleBox


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	#style_scavenge()
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pass
	
func _notification(what: int) -> void:
	super(what)
	if what == Node.NOTIFICATION_DRAG_END:
		check_recipes()
		pass

func check_recipes():
	print("checking now")
	# write checking logic
	pass

func style_assemble():
	action_button.add_theme_stylebox_override("normal",assemble_style)
	action_button.add_theme_stylebox_override("hover",assemble_style_hover)
	action_button.add_theme_stylebox_override("pressed",assemble_style_pressed)
	
func style_scavenge():
	action_button.add_theme_stylebox_override("normal",scavenge_style)
	action_button.add_theme_stylebox_override("hover",scavenge_style_hover)
	action_button.add_theme_stylebox_override("pressed",scavenge_style_pressed)
	
func style_none():
	action_button.remove_theme_stylebox_override("normal")
	action_button.remove_theme_stylebox_override("hover")
	action_button.remove_theme_stylebox_override("pressed")
