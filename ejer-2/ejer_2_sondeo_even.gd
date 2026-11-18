extends Node2D
# Script del panel (HUD). Va en el nodo Main.

@onready var hud: Label = $Hud

# R4: contadores para move_right
var cuadros_pulsados := 0
var eventos_recibidos := 0

# R3: datos del ultimo evento recibido
var ultima_clase := "-"
var dispositivo := "-"
var tipo_senal := "-"


func _physics_process(delta: float) -> void:
	# SONDEO: cada cuadro de fisica (60 por segundo) preguntamos si la accion esta activa
	if Input.is_action_pressed("move_right"):
		cuadros_pulsados += 1

	# R2: digital (true/false) y analogico (valores con 2 decimales)
	var salto := Input.is_action_pressed("jump")
	var eje := Input.get_axis("move_left", "move_right")
	var fuerza := Input.get_action_strength("move_right")

	hud.text = "jump: %s\nget_axis: %.2f\nget_action_strength(\"move_right\"): %.2f\n\nClase del evento: %s\nDispositivo: %s\nTipo de senal: %s\n\nmove_right -> Sondeo: %d cuadros pulsados\nmove_right -> Eventos: %d (pulsar y soltar)" % [salto, eje, fuerza, ultima_clase, dispositivo, tipo_senal, cuadros_pulsados, eventos_recibidos]


func _input(event: InputEvent) -> void:
	# EVENTOS: solo llega algo cuando cambia el estado (pulsar o soltar)
	if event.is_action("move_right") and not event.is_echo():
		eventos_recibidos += 1

	# R3: clase, dispositivo y tipo de senal
	if event is InputEventKey:
		if event.is_echo():
			return  # el eco del teclado (tecla mantenida) se ignora
		ultima_clase = event.get_class()
		dispositivo = "Teclado"
		tipo_senal = "Digital"
	elif event is InputEventMouseButton and (event.button_index == MOUSE_BUTTON_WHEEL_UP or event.button_index == MOUSE_BUTTON_WHEEL_DOWN):
		# la rueda va ANTES que el clic porque tambien es un InputEventMouseButton
		ultima_clase = event.get_class()
		dispositivo = "Raton (rueda)"
		tipo_senal = "Digital (pasos de la rueda)"
	elif event is InputEventMouseButton:
		ultima_clase = event.get_class()
		dispositivo = "Raton (clic)"
		tipo_senal = "Digital"
	elif event is InputEventMouseMotion:
		ultima_clase = event.get_class()
		dispositivo = "Raton (movimiento)"
		tipo_senal = "Posicion"
	elif event is InputEventJoypadButton:
		ultima_clase = event.get_class()
		dispositivo = "Mando (boton)"
		tipo_senal = "Digital"
	elif event is InputEventJoypadMotion:
		ultima_clase = event.get_class()
		dispositivo = "Mando (stick / gatillo)"
		tipo_senal = "Analogica"
	elif event is InputEventScreenTouch or event is InputEventScreenDrag:
		ultima_clase = event.get_class()
		dispositivo = "Pantalla tactil"
		tipo_senal = "Posicion"
