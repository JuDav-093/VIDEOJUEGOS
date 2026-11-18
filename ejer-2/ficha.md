# Ficha del dispositivo: Teclado

| Campo | Descripción |
|---|---|
| **Dispositivo** | Teclado de computadora (USB, dispositivo HID) |
| **Tecnología de captura** | Debajo de las teclas hay una matriz de contactos (membrana o interruptores mecánicos). Al pulsar una tecla se cierra un circuito; el microcontrolador del teclado recorre la matriz, detecta qué fila y columna se cerró y envía un informe HID con el código de la tecla al sistema operativo. |
| **Tipo de señal** | **Digital.** Cada tecla solo tiene dos estados, pulsada o suelta (1 o 0); no existen valores intermedios, por eso `get_action_strength` solo devuelve 0.00 o 1.00. |
| **Ventaja** | Muchas teclas distintas a la vez, respuesta rápida y precisa; ideal para asignar muchas acciones (atajos, movimiento, habilidades). |
| **Limitación** | No mide intensidad: no se puede caminar "un poco" hacia la derecha como con un stick analógico. Además, algunos teclados baratos tienen *ghosting* (no registran varias teclas a la vez). |
| **Juego ejemplo** | *Celeste* (plataformas 2D jugable con teclado: flechas/WASD para moverse, tecla para saltar). |
| **Fuente** | [Computer keyboard – Wikipedia](https://en.wikipedia.org/wiki/Computer_keyboard) · [Documentación de Godot: Input examples](https://docs.godotengine.org/en/stable/tutorials/inputs/input_examples.html) |

**R6:** al pulsar una tecla en el juego, el Hud muestra `InputEventKey`, `Teclado` y `Digital`, lo mismo que dice esta ficha.
