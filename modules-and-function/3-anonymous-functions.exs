# anonymous
increment = fn (x) -> x+1 end

IO.puts increment.(2)

# anonymous with capture operator
twocrement = &(&1+1)
IO.puts twocrement.(3)