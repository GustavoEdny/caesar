defmodule Caesar do
  def main(argv) do
    argv
      |> parse_args
      |> process
    System.halt(0)
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean])
    case parse do
      {[help: true], __________________, _} -> {:help}
      {[shift: shift], ["encrypt", msg], _} -> {:encrypt, msg, shift |> String.to_integer}
      {[shift: shift], ["decrypt", msg], _} -> {:decrypt, msg, shift |> String.to_integer}
      _____________________________________ -> {:help}
    end
  end

  defp process({:encrypt, msg, shift}) do
    Caesar.Cipher.encrypt(msg, shift)
      |> IO.puts
  end

  defp process({:decrypt, msg, shift}) do
    Caesar.Cipher.decrypt(msg, shift)
      |> IO.puts
  end

  defp process({:help}) do
    IO.puts """
    usage ./caesar <command> <message> --shift <shift_number>
    """
  end
end
