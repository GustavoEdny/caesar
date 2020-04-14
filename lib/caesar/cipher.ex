defmodule Caesar.Cipher do
  @alphabet_size Application.get_env(:caesar, :alphabet_size)
  def encrypt(message, shift) do
    # Convert message to char_list
    message
      |> to_char_list
      # Applying shift mapping to the list
      |> Enum.map(&shift_char(&1, shift))
      # return list as a binary string
      |> List.to_string
  end

  def decrypt(message, shift) do
    # Convert message to char_list
    message
      |> to_char_list
      # Applying shift mapping to the list
      |> Enum.map(&unshift_char(&1, shift))
      # return list as a binary string
      |> List.to_string
  end

  defp shift_char(char, shift) do
    case char do
      chr when chr in (?a..?z) -> increase_shift(?a, chr, shift)
      chr when chr in (?A..?Z) -> increase_shift(?A, chr, shift)
      chr -> chr
    end
  end

  defp unshift_char(char, shift) do
    case char do
      chr when chr in (?a..?z) -> decrease_shift(?a, chr, shift)
      chr when chr in (?A..?Z) -> decrease_shift(?A, chr, shift)
      chr -> chr
    end
  end

  defp decrease_shift(base_letter, char, shift) do
    # calculate the shifted value
    shifted_value = char - normalize(base_letter) - shift_num(shift)

    base_letter + rem(shifted_value, @alphabet_size)
  end

  defp increase_shift(base_letter, char, shift) do
    # calculate the shifted value
    shifted_value = (char - normalize(base_letter)) + shift_num(shift)

    base_letter + rem(shifted_value, @alphabet_size)
  end

  # Find the ASCII integer of the char and normalize it
  # by subtracting the size of the alphabet
  defp normalize(char) do
    char - @alphabet_size
  end

  # ensure the shift number is within the alphabet size
  defp shift_num(shift) do
    rem(shift, @alphabet_size)
  end
end
