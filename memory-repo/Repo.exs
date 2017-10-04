defmodule User do 
  defstruct  [:id, :name, :username]
end

defmodule Repo do
  
  def all(User) do
    
    [
      %User{id: 1, name: "Luiz", username: "lz" },
      %User{id: 2, name: "Ludmila", username: "ld" },
      %User{id: 3, name: "Carlos", username: "cl" },
    ]
  end

  def all(_module) do 
    []
  end

  def find(module, id) do
    Enum.find all(module), fn el -> el.id == id end 
  end

  def find_by(module, params) do 
    # pega todos 
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, value} -> 
        # teste o valor da chave de cada elemento
        # com o valor dado
        Map.get(map, key) == value
      end)
    end
  end
end

IO.puts "\nAll Users"
IO.inspect Repo.all User

IO.puts "\nAll Other"
IO.inspect Repo.all Other

IO.puts "\nfind user with id: 2"
IO.inspect Repo.find User,2


IO.puts "\nfind user by name: Carlos"
IO.inspect Repo.find_by User, name: "Carlos"
