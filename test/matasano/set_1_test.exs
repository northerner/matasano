defmodule MatasanoSet1Test do
  use ExUnit.Case

  test "convert hex to base64" do
    assert Matasano.Set1.hex_to_base64(
      "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d") ==
      "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
  end

  test "fixed xor" do
    assert Matasano.Set1.fixed_xor(
      "1c0111001f010100061a024b53535009181c",
      "686974207468652062756c6c277320657965") ==
      "746865206b696420646f6e277420706c6179"
  end
end
