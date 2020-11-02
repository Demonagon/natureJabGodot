extends Spatial

class_name TreePart

signal size_change(newSize)
signal distance_change(newDistance)

var parent : TreePart
var size : float

var growTask : Task = null

func _init(p = null, s = 0, d = 0) :
  parent = p
  size = s
  translate(Vector3(0, d, 0))
  
func affectSize(value):
  size += value
  self.emit_signal("size_change", size)
  
func affectDistance(value):
  translate(Vector3(0, value, 0))
  self.emit_signal("distance_change", translation.y)
  
func getDistance() :
  return translation.y
  
func grow(credits) :
  if growTask == null:
    print("ERROR : running a null TreePart task")
  return growTask.spend(credits)

func setGrowTask(task) :
  growTask = task
