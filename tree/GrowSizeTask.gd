extends Task

class_name GrowSizeTask

var part
var objective : float

func _init(p = null, obj = 0):
  part = p
  objective = obj
  
func spend(credits : float):
  var progress = min(credits, objective - part.size)
  part.affectSize(progress)
  return credits - progress

func isActive():
  return part.size < objective
