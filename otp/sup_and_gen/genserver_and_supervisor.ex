
defmodule MyFancyProcess do
  use GenServer

  def start_link(state) do
    IO.puts "init state: #{state}"
    # start_link(module, args, options \\ [])
    # the second parameter is init state, used in counter below
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  ## Public API

  def hello(message) do
    GenServer.call(__MODULE__, {:hello, message})
  end

  def counter do
    GenServer.call(__MODULE__, :counter)
  end

  ## GenServer callbacks

  def init(start_counter) do
    {:ok, start_counter}
  end

  def handle_call({:hello, message}, _from, state) do
    case message do
      "kill" -> raise("ops... kill message")
      any -> IO.puts "Hello, #{any}"
    end
    # need return the new state
    {:reply, :noproc, state}
  end

  def handle_call(:counter, _from, state) do
    new_state = state + 1
    IO.puts "New state is #{new_state}"
    # need return the new state
    {:reply, :noproc, new_state}
  end
end


defmodule MyFancySupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  # call this automatic after start_link above
  def init(_) do
  
    children = [
      worker(MyFancyProcess, [0])
    ]

    opts = [strategy: :rest_for_one]

    supervise(children, opts)
  end
end

# Process.flag(:trap_exit, true)
# # Receive the trapped exit message
# receive do
#   {:EXIT, pid, :normal} ->
#     IO.inspect "Normal exit from #{inspect pid}"
#   {:EXIT, pid, msg} ->
#     IO.inspect ":EXIT received from #{inspect pid}"
#     IO.inspect msg
# end


{:ok, sup_pid} = MyFancySupervisor.start_link

MyFancyProcess.hello("foo")
MyFancyProcess.counter
MyFancyProcess.counter

MyFancyProcess.hello("kill")
MyFancyProcess.hello("foo")

MyFancyProcess.counter
MyFancyProcess.counter

:timer.sleep 5000

