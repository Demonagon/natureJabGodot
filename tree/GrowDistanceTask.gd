extends Task

class_name GrowDistanceTask

var part
var objective : float

func _init(p = null, obj = 0):
  part = p
  objective = obj
  
func spend(credits : float):
  var progress = min(credits, objective - part.getDistance())
  part.affectDistance(progress)
  return credits - progress

func isActive():
  return part.getDistance() < objective
