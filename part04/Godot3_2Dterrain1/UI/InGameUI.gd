extends Control

## Handle Signals for UI Updates

func _ready() -> void:
	pass


# Update UI Label Text when the shootpower changed
func _on_Cannon_CannonAngelChange(newPower : int) -> void:
	$IngameUIBottom/vBoxContainer/hBoxAngel/labAngel.text = str(newPower)
	pass


# Update UI Label when the shootangel changed
func _on_Cannon_CannonPowerChange(newAngel : int) -> void:
	$IngameUIBottom/vBoxContainer/hBoxPower/labPower.text = str(newAngel)
	pass
