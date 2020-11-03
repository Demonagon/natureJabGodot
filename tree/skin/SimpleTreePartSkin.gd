extends TreePartSkin

class_name SimpleTreePartSkin

var branch
var end
var skinColor

func _init(color : Color = Color.beige):
  skinColor = color

func setDistance(distance : float):
  setBranchHeight(distance)
  
func setSize(size : float):
  setBranchRadius(size)
  setEndRadius(size)
  
func _ready():
  print(get_children())
  branch = $Model/Branch
  end = $Model/End
  (($Model as GeometryInstance).material_override as ShaderMaterial).set_shader_param("color",skinColor)

func setBranchRadius(radius):
  if radius <= 0:
    branch.visible = false
    return
  branch.visible = true
  branch.radius = radius

func setBranchHeight(height):
  if height <= 0:
    branch.visible = false
    return
  branch.visible = true
  branch.height = height
  branch.translation.y = -height/2

func setEndRadius(radius):
  if radius <= 0:
    end.visible = false
    return
  end.visible = true
  end.radius = radius
