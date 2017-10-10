defmodule Namespace.Module do
  

  @test "it is a string"

  def show do
    IO.puts @test
  end

end

# is the same "alias Namespace.Module, as: Module"
alias Namespace.Module

Module.show
