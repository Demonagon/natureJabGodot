extends Task

class_name GrowChildTask

var parent
var init_function
var child : TreePart = null

func _init(p = null, init = null):
  parent = p
  init_function = init
  
func spend(credits : float):
  if child == null:
    child = parent.call(init_function)
    parent.add_child(child)
  return child.grow(credits)

func isActive():
  return child == null or child.growTask.isActive()
