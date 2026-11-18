# Respuestas

## 1. Mantén D dos segundos y suéltala: ¿qué contador subió más y por qué?

Subió mucho más el contador de **sondeo (cuadros pulsados)**: unos **120** (2 s × 60 cuadros de física por segundo), mientras que el de **eventos** solo subió **2** (uno al pulsar y otro al soltar).

El sondeo pregunta en cada `_physics_process` si `move_right` está activa, así que suma 1 en cada cuadro mientras la tecla esté abajo. En cambio `_input` solo recibe un evento cuando el estado **cambia**; los eventos de eco (repetición por mantener la tecla) se ignoran con `is_echo()`.

## 2. Mantén A: ¿qué valor muestran `get_axis` y `get_action_strength("move_right")`, y por qué difieren?

- `get_axis("move_left", "move_right")` = **-1.00**
- `get_action_strength("move_right")` = **0.00**

Difieren porque `get_axis` combina **dos** acciones (fuerza de `move_right` − fuerza de `move_left`) y devuelve un valor entre -1 y 1 que indica la dirección; al pulsar A da -1. `get_action_strength` solo mide **una** acción, entre 0 y 1, y como `move_right` (D) no está pulsada devuelve 0. Además, como el teclado es digital, los valores solo son enteros (-1, 0, 1), nunca intermedios.

## 3. Gira la rueda del ratón: ¿qué clase de evento aparece y por qué su rama va antes que la del clic?

Aparece **`InputEventMouseButton`**, la misma clase que un clic. Godot trata cada "paso" de la rueda como si fuera un botón del ratón (`MOUSE_BUTTON_WHEEL_UP` / `MOUSE_BUTTON_WHEEL_DOWN`).

Por eso la rama de la rueda (que revisa `button_index`) debe ir **antes** que la del clic: si pusiéramos primero `elif event is InputEventMouseButton`, esa condición también sería verdadera para la rueda y la rama de la rueda nunca se ejecutaría, y el Hud mostraría "clic" al girarla.
