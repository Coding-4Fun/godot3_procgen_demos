extends Node2D

export var left:bool = true

export var muzzle_velocity = 3500
export var gravity = 250

var can_shoot = true

onready var Bullet = preload("res://Cannonball.tscn")
onready var Muzzle = get_node("Barrel/Muzzle")
onready var Barrel = get_node("Barrel")


func _ready():
	## Kannonen umdrehen, wenn auf der rechten Seite
	pass

func _unhandled_input(event):
	if event.is_action_released("cannon_shoot") and can_shoot:
		var b = Bullet.instance()   
		get_tree().get_root().add_child(b)
		b.transform = Muzzle.global_transform
		b.velocity = b.transform.x * muzzle_velocity
		b.g = gravity
#		can_shoot = false


func _process(_delta):
	if can_shoot:
		Barrel.look_at(get_global_mouse_position())
		Barrel.rotation_degrees = clamp(Barrel.rotation_degrees, -75, -15)


#func shoot():
#    var b = Bullet.instance()
#    owner.add_child(b)
#    b.transform = $Barrel/Position2D.global_transform
#    b.velocity = b.transform.x * muzzle_velocity
#    b.gravity = gravity
