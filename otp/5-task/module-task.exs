defmodule TaskModule do

  use Task

  def start_link(arg) do
    Task.start_link(__MODULE__, :run, [arg])
  end

  def run(arg) do
    IO.puts arg + 2
  end

end
# not works

Supervisor.start_link([TaskModule])
