defmodule Matasano.Set1 do
  use Bitwise

  def hex_to_base64(hex_string) do
    String.upcase(hex_string)
    |> Base.decode16!
    |> Base.encode64
  end

  def fixed_xor(left, right) do
    binary_list_xor(hex_to_binary_list(left), hex_to_binary_list(right))
    |> Enum.map(&(binary_list_to_hex(&1)))
    |> Enum.join
    |> String.downcase
  end

  def hex_to_binary_list(hex) do
    String.upcase(hex)
    |> String.codepoints
    |> Enum.map(&(String.to_integer(&1, 16)))
    |> Enum.map(&(Integer.to_string(&1, 2)))
    |> Enum.map(&(String.rjust(&1, 4, ?0)))
    |> Enum.map(&(String.codepoints(&1)))
    |> Enum.map(&(list_to_integers(&1)))
  end

  def binary_list_to_hex(list) do
    Enum.join(list)
    |> String.to_integer(2)
    |> Integer.to_string(16)
  end

  def list_to_integers(list), do: Enum.map(list, &(String.to_integer(&1)))

  def binary_list_xor(left, right) do
    Enum.zip(left, right)
    |> Enum.map(&(bxor_pair(&1)))
  end

  defp bxor_pair({left, right}) do
    zipped_list = Enum.zip(left, right)
    for {lb, rb} <- zipped_list, do: Bitwise.bxor(lb, rb)
  end

  def xor_and_decode_hex(hex_string, char) do
    xor_string = String.duplicate(char, String.length(hex_string))
    xored = fixed_xor(hex_string, xor_string)
    decoded = Base.decode16!(xored, case: :lower)
    if String.valid?(decoded) do
      IO.puts decoded
    end
  end

  def decode_xored_hex(hex_string) do
    # chars = ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z) 
    chars = ~w(1 2 3 4 5 5 7 8 9 a b c d e f A B C D E F) 
    Enum.map(chars, &(xor_and_decode_hex(hex_string, &1)))
  end

end
