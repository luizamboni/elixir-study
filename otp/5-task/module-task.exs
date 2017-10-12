defmodule TaskModule do

  use Task

  def start_link(arg) do
    Task.start_link(__MODULE__, :run, [arg])
  end

  def run(arg) do
    # IO.inspect arg
    IO.puts arg + 2
  end

end


Supervisor.start_link([
  # { module, argumnet }
  { TaskModule, 3 }], 
  strategy: :one_for_one
)
