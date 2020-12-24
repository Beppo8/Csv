defmodule Csv do
  @moduledoc """
  Documentation for `Csv`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Csv.hello()
      :world

  """

  filename |> File.stream!() |> CSV.decode() |> Enum.to_list()
  def hello do
    :world
  end
end
