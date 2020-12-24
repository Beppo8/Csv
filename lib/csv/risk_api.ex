defmodule Csv.RiskAPI do

  @clearbit_api_key "sk_1234_abcd"

  defp get_status(%{"Email Address" => email, "CONFIRM_IP" => ip}) do
    high_risk = "https://risk.clearbit.com/v1/calculate?email=#{email}&ip=#{ip}"
      |> HTTPoison.get([headers: [Authorization: "Bearer #{@clearbit_api_key}"]])
      |> parse_response!()
      |> high_risk?()

      IO.inspect(%{email: email, high_risk: high_risk})
      %{email: email, high_risk: high_risk}
  end

  defp high_risk?(response) do
    get_in(response, ["risk", "level"]) == "high"
  end

  defp parse_response!(%HTTPoison.Response{body: body}) do
    Jason.decode!(body)
  end

end
