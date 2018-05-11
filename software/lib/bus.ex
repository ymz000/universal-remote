defmodule Bus do
  use GenStage
  require Logger

  def start_link() do
    GenStage.start_link(__MODULE__, :ok, [name: __MODULE__])
  end

  def init(:ok) do
    {:producer_consumer, :ok, subscribe_to: [CEC.Producer, LIRC.Producer]}
  end

  def handle_events(events, _from, thing) do
    {:noreply, events, thing}
  end
end