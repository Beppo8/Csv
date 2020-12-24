defmodule Csv do

  alias Csv.{Reader, RiskAPI, Writer}

  def email_status_from_csv!(filename \\ "email_data.csv") do
    filename
    |> Reader.read!()
    |> Enum.map(&RiskAPI.get_status!/1)
    |> Enum.sort()
    |> Writer.write!()
  end

end
