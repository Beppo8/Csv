defmodule Csv do

  alias Csv.{Reader, RiskAPI}

  def email_status_from_csv!(filename \\ "email_data.csv") do
    filename
    |> Reader.read!()
    |> Enum.each(&RiskAPI.get_status!/1)
  end

end
