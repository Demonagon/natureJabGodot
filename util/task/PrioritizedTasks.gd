extends Task

class_name PrioritizedTasks

var tasks : Array

func _init(array = []):
  tasks = array
  
func spend(credits : float):
  
  var leftovers = 0
  for task in tasks:
    if task is Task  and task.isActive() :
      credits = task.spend(credits)
      if credits <= 0:
        break
      
  return credits

func isActive():
  for task in tasks:
    if task is Task and task.isActive() :
      return true
  return false

