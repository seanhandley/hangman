defmodule TextClient.Summary do
  def display(game = %{ tally: tally }) do
    System.cmd("clear", [])
    IO.puts [
      "\n",
      "Word so far: #{Enum.join(tally.letters, " ")}\n",
      "Used: #{Enum.join(tally.used, " ")}\n",
      "Guesses left: #{tally.turns_left}\n"
    ]
    game
  end
end