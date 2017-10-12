

routine = fn -> :timer.sleep(2000); 3 end

task = Task.async(routine)

IO.puts '\nuntil sleeps'

IO.puts 1 + Task.await(task)



IO.inspect Task.yield_many(
  [
    Task.async(routine),
    Task.async(routine),
    Task.async(routine)
  ], 2000)
# [ 
#   { %Task{owner: #PID<0.46.0>, pid: #PID<0.50.0>, ref: #Reference<0.0.4.67> }
# ...
# ]

# cancel a task
task2 = Task.async(routine)

Task.shutdown(task2, :brutal_kill)
IO.puts '\ntask 3 canceled'

# timeout in seconds miliseconds
# throw an error if was timeouted
task3 = Task.async(routine)
IO.puts 2 + Task.await(task3, 1000)



