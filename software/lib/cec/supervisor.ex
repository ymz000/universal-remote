defmodule CEC.Supervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, %{}, [name: __MODULE__])
  end

  def init(_) do
    children = [
      worker(CEC.Producer, []),
      worker(CEC.Process, [])
    ]
    supervise(children, strategy: :one_for_one)
  end
end
