defmodule ExampleModule do

  @test "it is a string"

  def show do
    IO.puts @test
  end
end

defmodule OtherModule do
  # the functions of ModuleExample are private functions here
  import ExampleModule

  def show_2 do
    show()
  end

  def other_method do
    IO.puts "other method"
  end
end

defmodule ThirdModule do 
  import OtherModule, only: [ other_method: 0 ]

  def only_imported do
    other_method()
  end
end

# imported function
OtherModule.show_2

OtherModule.other_method

ThirdModule.only_imported
