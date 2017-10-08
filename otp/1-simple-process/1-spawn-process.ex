defmodule DummyProcess do 

  def listen do 
    receive do
      { :ok, "hello" } -> IO.puts "world"
      { :ok, _ } -> IO.puts "unknow message"
    end
    # recursive,
    # if not this, it only responds a first message
    listen()
  end
end

# spwn process
pid = spawn(DummyProcess, :listen, [])

send pid, { :ok, "hello"}
send pid, { :ok, "saluton" }

