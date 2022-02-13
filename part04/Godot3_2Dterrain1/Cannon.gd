extends Node2D

export var left:bool = true

export var muzzle_velocity = 1500
export var gravity = 250

var can_shoot = true

onready var Bullet = preload("res://Cannonball.tscn")
onready var Muzzle = get_node("Barrel/Muzzle")
onready var Barrel = get_node("Barrel")
onready var Main = get_tree().get_root().get_node("MainGame")

onready var labAngel = Main.find_node("labAngel")
onready var labPower = Main.find_node("labPower")


func _ready():
	## Kannonen umdrehen, wenn auf der rechten Seite
	pass

func _unhandled_input(event):
	if event.is_action_released("cannon_shoot") and can_shoot:
		var b = Bullet.instance()
		Main.add_child(b)
		b.connect("exploded", Main, "_on_Bullet_exploded")
		b.transform = Muzzle.global_transform
		b.velocity = b.transform.x * muzzle_velocity
		b.g = gravity
	if event.is_action_released("cannon_power_plus"):
		muzzle_velocity = clamp(muzzle_velocity+100, 1500, 6000)
	if event.is_action_released("cannon_power_minus"):
		muzzle_velocity = clamp(muzzle_velocity-100, 1500, 6000)
#		can_shoot = false


func _process(_delta):
	if can_shoot:
		Barrel.look_at(get_global_mouse_position())
		Barrel.rotation_degrees = clamp(Barrel.rotation_degrees, -75, -15)
		labAngel.text = str(Barrel.rotation_degrees)
		labPower.text = str(muzzle_velocity)
