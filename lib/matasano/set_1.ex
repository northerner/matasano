defmodule Matasano.Set1 do
  use Bitwise

  def hex_to_base64(hex_string) do
    String.upcase(hex_string)
    |> Base.decode16!
    |> Base.encode64
  end

  def fixed_xor(left, right) do
    # [b_left, b_right] = for hex_string <- [left, right] do
    #   String.upcase(hex_string)
    #   |> Base.decode16!
    #   |> Enum.map fn(char) -> <<char::16>> end
    #   |> IO.puts
    # end
    # Bitwise.bxor(b_left, b_right)
  end

  defp hex_to_binary_array(hex_string) do
    Base.decode16! hex_string
  end

  def dec_to_binary(1), do: [1] 
  def dec_to_binary(dec), do: dec_to_binary(div(dec, 2), [rem(dec, 2)])
  defp dec_to_binary(1, list), do: [1 | list] 
  defp dec_to_binary(dec, list), do: dec_to_binary(div(dec, 2), [rem(dec, 2) | list])

  def xor_binary_lists(binary_a, binary_b) do
    zip = Enum.zip(binary_a, binary_b)
    for {a, b} <- zip, do: Bitwise.bxor(a, b)
  end

  def binary_to_dec(binary_list) do
    Enum.reverse(binary_list)
    |> binary_to_dec(1, 0)
  end
  defp binary_to_dec([], _exponent, acc), do: acc
  defp binary_to_dec([h|t], exponent, acc) do
    binary_to_dec(t, exponent * 2, acc + (h * exponent))
  end
end
