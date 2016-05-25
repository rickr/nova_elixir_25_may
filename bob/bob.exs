defmodule Bob do

  def hey(input) do
    cond do
      String.lstrip(input) == "" -> "Fine. Be that way!"
      String.upcase(input) == input && input =~ ~r/[[:alpha:]]/ -> "Whoa, chill out!"
      input |> String.ends_with? "?" -> "Sure."
      true -> "Whatever."
    end
  end
end
