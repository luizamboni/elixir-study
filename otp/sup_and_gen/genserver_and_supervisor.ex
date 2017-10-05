
defmodule MyProcess do
  use GenServer

  def start_link(state) do
    IO.puts "init state: #{state}"
    # start_link(module, args, options \\ [])
    # the second parameter is init state, used in counter below
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  ## Public API
  def add(n) do
    GenServer.call(__MODULE__, {:add, n})
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


defmodule MySupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  # call this automatic after start_link above
  def init(_) do
  
    children = [
      worker(MyProcess, [0])
    ]

    opts = [strategy: :rest_for_one]

    supervise(children, opts)
  end
end


{:ok, sup_pid} = MySupervisor.start_link

MyProcess.add 2
MyProcess.add 2

MyProcess.add "cat"

MyProcess.add 2

MyProcess.add 2

