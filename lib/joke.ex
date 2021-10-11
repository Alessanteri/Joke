defmodule Joke do
  @moduledoc """
  Documentation for `Joke`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Joke.hello()
      :world

  """

  def get_joke() do
    HTTPoison.start()
    url = "https://nova-joke-api.netlify.app/.netlify/functions/index/random_joke"
    joke_body = HTTPoison.get!(url).body

    %{"setup" => setup, "punchline" => punchline} = Jason.decode!(joke_body)
  end

  def print_joke() do
    HTTPoison.start()
    url = "https://nova-joke-api.netlify.app/.netlify/functions/index/random_joke"
    joke_body = HTTPoison.get!(url).body

    %{"setup" => setup, "punchline" => punchline} = Jason.decode!(joke_body)
    IO.puts("#{setup}\n#{punchline}")
  end
end
