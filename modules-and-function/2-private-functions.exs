defmodule Module do
  

  @test "it is a string"

  def show do
    IO.puts @test
  end

  # change Module attribute
  defp show_p(val) do
    IO.puts @test
  end
end


Module.show

# try call private method
try do
  Module.show_p
rescue
  UndefinedFunctionError ->
    IO.puts "not exists a public function with show_p name"
    
  x -> 
    IO.puts "other error"
end