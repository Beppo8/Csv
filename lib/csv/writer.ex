defmodule Csv.Writer do

  def write!(stream, file) do
    stream
    |> CSV.encode(headers: [:email, :high_risk])
    |> Enum.into(file)
  end

end
