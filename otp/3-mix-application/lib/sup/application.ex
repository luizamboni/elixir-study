defmodule Sup.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  # def loop(func) do
  #   case :rand.uniform(3) do
  #     3 -> func.("is not a number! will raise an error!") 
  #     x -> func.(x)
  #   end
  #   loop(func)
  # end

  def stop(_app) do
    IO.puts "bye bye"
  end

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      worker(Sup.Accumulator, [3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [
      strategy: :one_for_one, 
      name: Sup.Supervisor,
      restart: :permanent
    ]
    Supervisor.start_link(children, opts)
    Sup.Accumulator.add(1)
    # loop(fn (value)-> Sup.Accumulator.add(value) end)
  end
end
