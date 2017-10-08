defmodule DummyProcess do 

  def listen do 
    receive do
      { pid , "hello" } -> IO.puts "world"
      { pid, _ } -> IO.puts "unknow message"
    end
    # recursive,
    # if not this, it only responds a first message
    listen()
  end

  def listen_one do 
    receive do
      { pid , "hello" } -> IO.puts "world // only"
      { pid, _ } -> IO.puts "unknow message // only"
    end
  end
end


parent_pid = self()
# spwn process
pid = spawn(DummyProcess, :listen, [])

send pid, { parent_pid, "hello"}
send pid, { parent_pid, "saluton" }

# only the first message es parsed
pid2 = spawn(DummyProcess, :listen_one, [])


send pid2, { parent_pid, "hello"}
send pid2, { parent_pid, "saluton" }