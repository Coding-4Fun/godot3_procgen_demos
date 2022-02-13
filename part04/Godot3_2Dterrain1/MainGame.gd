extends Node2D

onready var TerrainLine = $"TerrainLine"

onready var Players = $Players
onready var PlayerLeft = $Players/Player1
onready var PlayerRight = $Players/Player2

#onready var castle = preload("res://Castle2d.tscn")
#onready var castleleft = castle.instance()
#onready var castleright = castle.instance()

onready var cannon = preload("res://Cannon.tscn")

onready var cannonLeft = cannon.instance()
onready var cannonBarrelLeft = cannonLeft.get_node("Barrel")
onready var cannonBarrelLeftMuzzle = cannonBarrelLeft.get_node("Muzzle")

#onready var cannonRight = cannon.instance()
#onready var cannonBarrelRight = cannonRight.get_node("Barrel")
#onready var cannonBarrelRightMuzzle = cannonBarrelRight.get_node("Muzzle")

onready var line = $TrajectoryLine
var Explosion = preload("res://Explosion.tscn")


func _ready():
	TerrainLine.init_line()
	#add_Castles()
	add_cannon_left()


func add_cannon_left():
	cannonLeft.position = TerrainLine.points[0]
	cannonLeft.position.x = TerrainLine.castlewidth / 2
	PlayerLeft.add_child(cannonLeft)
#	pass

func update_trajectory():
#	line.clear_points()
#	var v = barrel.global_transform.x * tank.bullet_speed
#	var p = muzzle.global_position
#	for i in num_points:
#		line.add_point(p)
#		v.y += tank.gravity * dt
#		p += v * dt
#		if p.y > $Ground.position.y - 25:
#			break
	pass


func _on_Bullet_exploded(pos):
	var e = Explosion.instance()
	add_child(e)
	e.position = pos
#	tank.can_shoot = true
#	line.hide()


func add_Castles():
#	castleleft.position = TerrainLine.points[0]
#	castleleft.modulate = Color.red
#
#	castleright.position = TerrainLine.points[TerrainLine.points.size()-2]
#	castleright.modulate = Color.green
#
#	add_child(castleleft)
#	add_child(castleright)
	pass


