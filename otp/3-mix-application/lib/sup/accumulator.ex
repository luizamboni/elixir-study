defmodule Sup.Accumulator do
  
  use GenServer

  def start_link(state) do
    IO.puts "init state: #{state}"
    # start_link(module, args, options \\ [])
    # the second parameter is init state, used in counter below
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def loop(func) do
    case :rand.uniform(3) do
      3 -> func.("is not a number! will raise an error!") 
      x -> func.(x)
    end
    loop(func)
  end

  ## Public API
  def add(n) do
    GenServer.call(__MODULE__, {:add, n})
    loop(fn (value)-> add(value) end)
  end

  ## GenServer callbacks

  def init(start_counter) do
    {:ok, start_counter}
  end

  def handle_call({:add, n }, _from, state) do
    new_state = state + n
    IO.puts "New state is #{new_state}"
    # need return the new state
    {:reply, :noproc, new_state}
  end
  
end