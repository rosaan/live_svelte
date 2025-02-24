defmodule User do
  @derive Jason.Encoder
  defstruct name: "John", age: 27
end

defmodule ExampleWeb.LiveStruct do
  use ExampleWeb, :live_view

  @example_struct %User{name: "Bob", age: 42}

  def render(assigns) do
    ~H"""
    <h1 class="text-lg">An example of how to pass a struct to Svelte:</h1>
    <LiveSvelte.render name="Struct" props={%{struct: @struct}} />
    """
  end

  def mount(_session, _params, socket) do
    {:ok, assign(socket, :struct, @example_struct)}
  end
end
