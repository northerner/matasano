defmodule Matasano.Set1 do
  def hex_to_base64(hex_string) do
    String.upcase(hex_string)
    |> Base.decode16!
    |> Base.encode64
  end
end
