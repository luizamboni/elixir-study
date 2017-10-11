
# return create agent with init state agent_pid
{:ok, agent } = Agent.start_link fn -> [] end

IO.inspect agent

Agent.update agent, fn list -> [ "abc" | list ] end

list = Agent.get agent, fn list -> list end
IO.inspect list

# shorther with capture operator
Agent.update agent, &([ "3" | &1 ])
Agent.update agent, fn list -> [ "2" | list ] end

list = Agent.get agent, fn list -> list end

IO.inspect list

# return state more one element (not altered state, like a getter)
list = Agent.get agent, fn list -> [ "mais 1" | list ] end

IO.inspect list

# get with capture operator
list = Agent.get agent, &(&1)

IO.inspect list


# stop agent
Agent.stop(agent)