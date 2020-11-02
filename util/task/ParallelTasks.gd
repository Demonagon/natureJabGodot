extends Task

class_name ParallelTasks

var tasks : Array

func _init(array = []):
  tasks = array
  
func spend(credits : float):
  
  var activeTasks = 0
  for task in tasks:
    if task is Task and task.isActive() :
        activeTasks += 1
  
  var leftovers = 0
  for task in tasks:
    if task is Task  and task.isActive() :
      leftovers += task.spend(credits / activeTasks)
      
  return leftovers

func isActive():
  for task in tasks:
    if task is Task and task.isActive() :
      return true
  return false
