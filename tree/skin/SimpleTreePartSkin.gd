extends TreePartSkin

var branch
var end

func setDistance(distance : float):
  setBranchHeight(distance)
  
func setSize(size : float):
  setBranchRadius(size)
  setEndRadius(size)
  
func _ready():
  branch = $Model/Branch
  end = $Model/End

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
