defmodule Module do
  

  @test "it is a string"

  def show do
    IO.puts @test
  end

  # change Module attribute
  def change(val) do
    @test = val
  end
end


Module.show

# try change Module Attribute
try do
  Module.change("it is a new String")
rescue
  _ -> IO.puts "has one error!"
end