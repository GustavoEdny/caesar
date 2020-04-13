defmodule Caesar.Cipher do
  def encrypt(message, shift) do
    # Convert message to char_list
    message
      |> to_char_list
      # Applying shift mapping to the list
      |> Enum.map(&shift_char(&1, shift))
      # return list as a binary string
      |> List.to_string
  end

  defp shift_char(char, shift) do
    case char do
      chr when chr in (?a..?z) -> calculate_mapping(?a, chr, shift)
      chr -> chr
    end
  end

  defp calculate_mapping(base_letter, char, shift) do
    # Find the ASCII integer of the char and normalize it
    # by subtracting the size of the alphabet
    normalize = &(&1 - 26)
    # ensure the shift number is within the alphabet size
    shift_num = rem(shift, 26)
    # calculate the shifted value
    base_letter + rem(char - normalize.(base_letter) - shift_num, 26)
  end
end
