extends Control

## Handle Signals for UI Updates

var _shots : int = 0

func _ready() -> void:
	$IngameUIBottom/vBoxContainer/hBoxShots/labShots.text = str(_shots)
	pass


# Update UI Label Text when the shootpower changed
func _on_Cannon_CannonAngelChange(newPower : int) -> void:
	$IngameUIBottom/vBoxContainer/hBoxAngel/labAngel.text = str(newPower)
	pass


# Update UI Label when the shootangel changed
func _on_Cannon_CannonPowerChange(newAngel : int) -> void:
	$IngameUIBottom/vBoxContainer/hBoxPower/labPower.text = str(newAngel)
	pass


func _on_Cannon_Shot() -> void:
	_shots += 1
	$IngameUIBottom/vBoxContainer/hBoxShots/labShots.text = str(_shots)
