defmodule Csv.Writer do

  def write!(stream, file) do
    stream
    |> Stream.map(fn({:ok, row}) -> row end)
    |> CSV.encode(headers: [:email, :high_risk])
    |> Enum.into(file)
  end

end
