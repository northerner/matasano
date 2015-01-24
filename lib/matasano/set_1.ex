defmodule Matasano.Set1 do
  use Bitwise

  def hex_to_base64(hex_string) do
    String.upcase(hex_string)
    |> Base.decode16!
    |> Base.encode64
  end

  def fixed_xor(left, right) do
    [result | _] = binary_xor(hex_to_binary_list(left), hex_to_binary_list(right))
    Integer.to_string(result, 16)
  end

  def hex_to_binary_list(hex) do
    String.upcase(hex)
    |> String.to_integer(16)
    |> Integer.to_string(2)
    |> String.split
  end

  def binary_xor(left, right) do
    Enum.zip(left, right)
    |> Enum.map(&(bxor_pair(&1)))
  end

  defp bxor_pair({left, right}) do
    lb = String.to_integer(left)
    rb = String.to_integer(right)
    Bitwise.bxor(lb, rb) 
  end

end
