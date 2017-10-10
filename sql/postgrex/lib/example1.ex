defmodule Example1 do


  def start(_type, _args) do

    # connect in db, and generate a linked process 
    {:ok, pid} = Postgrex.start_link(
      hostname: "localhost", 
      username: "exercicios_resolvidos", 
      password: "123456", 
      database: "exercicios_resolvidos_development"
    )
    
    # query and extract rows
    %Postgrex.Result{ rows: x } = Postgrex.query!(pid, "SELECT name FROM users", [])

    # output rows value
    IO.inspect x

    {:ok , self()}
  end
end