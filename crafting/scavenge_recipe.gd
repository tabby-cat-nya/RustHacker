extends Resource
class_name ScavengeRecipe

@export var input : ItemData
@export var rolls : int = 3
@export var loot_pool : Dictionary[int, ItemData]
