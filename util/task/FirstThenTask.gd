extends Task

class_name FirstThenTask

var first : Task
var then  : Task

func _init(f = null, t = null):
  first = f
  then = t
  
func spend(credits):
  if first.isActive() :
    credits = first.spend(credits)
    if not first.isActive() :
      return then.spend(credits)
    else : return credits
  return then.spend(credits)

func isActive():
  return first.isActive() or then.isActive()

