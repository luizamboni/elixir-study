number = try do
            1/0
          rescue
            _ ->
             1
          end

IO.puts number