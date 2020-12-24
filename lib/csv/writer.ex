defmodule Csv.Writer do

  def write!(data) do
    file = File.open!("validated_emials.csv", [:write, :utf8])

    data
    |> CSV.encode(headers: [:email, :high_risk])
    |> Enum.each(&IO.write(file, &1))
  end

end
