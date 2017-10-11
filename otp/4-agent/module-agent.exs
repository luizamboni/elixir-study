defmodule ModuleAgent do
  
  def start_link() do
    Agent.start_link(fn -> %{} end)
  end

  def get(bucket, value) do 
    Agent.get(bucket, fn map -> Map.get(map, value) end)
  end

  def get(bucket) do 
    Agent.get(bucket, fn map -> map end)
  end
  
  def add(bucket, key , value) do 
    Agent.update(bucket, fn map -> Map.put(map, key, value) end)
  end

  def del(bucket, key) do
    Agent.update(bucket, fn map -> Map.delete(map, key) end)
  end

  def kill(bucket) do
    Agent.stop(bucket)
  end
end


{ :ok, bucket } = ModuleAgent.start_link

IO.puts "\nfirst 'instance' of agent"

ModuleAgent.add(bucket, "a", "b")
ModuleAgent.add(bucket, "b", "3")

# list entire map
IO.inspect ModuleAgent.get(bucket)

# get a value from specific key
IO.inspect ModuleAgent.get(bucket, "b")

# delete b key
ModuleAgent.del(bucket, "b")
IO.inspect ModuleAgent.get(bucket)


# 
IO.puts "\nsecond 'instance' of agent"

{ :ok, bucket2 } = ModuleAgent.start_link

IO.inspect ModuleAgent.add(bucket2, "a", "b")

IO.inspect ModuleAgent.add(bucket2, "b", "3")


IO.inspect ModuleAgent.get(bucket2)



IO.puts "\n\ninstances are diff states"
IO.puts "\nfirst:"
IO.inspect ModuleAgent.get(bucket)
IO.puts "\nsecond:"
IO.inspect ModuleAgent.get(bucket2)
