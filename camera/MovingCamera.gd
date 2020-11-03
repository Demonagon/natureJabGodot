extends Camera

export(float) var move_speed = 2
export(float) var rotation_speed = 0.01

class_name MovingCamera

var angleX = 0
var angleY = 0

func _ready():
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
  var speed = delta * move_speed
  if Input.is_action_pressed("ui_cancel"):
    get_tree().quit()
  if Input.is_action_pressed("ui_forward"):
    .translate(Vector3(0, 0, -speed))
  if Input.is_action_pressed("ui_backward"):
    .translate(Vector3(0, 0, speed))
  if Input.is_action_pressed("ui_left"):
    .translate(Vector3(-speed, 0, 0))
  if Input.is_action_pressed("ui_right"):
    .translate(Vector3(speed, 0, 0))
  if Input.is_action_pressed("ui_up"):
    .translate(Vector3(0, speed, 0))
  if Input.is_action_pressed("ui_down"):
    .translate(Vector3(0, -speed, 0))

func _input(event):
  if event is InputEventMouseMotion:
    var mouseEvent = event as InputEventMouseMotion
    angleX += mouseEvent.relative.x * rotation_speed
    angleY += mouseEvent.relative.y * rotation_speed
    if angleY < -PI/2:
      angleY = -PI/2
    if angleY > PI/2:
      angleY = PI/2
    transform.basis = Basis()
    rotate_object_local(Vector3(0, -1, 0), angleX)
    rotate_object_local(Vector3(-1, 0, 0), angleY)
