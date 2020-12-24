defmodule Csv.Reader do

  def read!(filename) do
    filename
    |> File.stream!stream!()
    |> CSV.decode!(headers: true)
  end

end
