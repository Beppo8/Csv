defmodule Csv do

  alias Csv.{Reader, RiskAPI, Writer}

  def email_status_from_csv!(filename \\ "email_data.csv") do
    file = File.stream!("validated_emails.csv")

    filename
    |> Reader.read!()
    |> Stream.map(&RiskAPI.get_status!/1, max_concurrency: 10)
    |> Writer.write!(file)
  end

end
