defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view

  import Gallows.Views.Helpers.GameStateHelper

  def turn(left, target) when target >= left do
    "opacity: 1"
  end

  def turn(left, target) do
    "opacity: 0.1"
  end

  def game_over?(%{ game_state: game_state}) do
    game_state in [ :won, :lost ]
  end

  def new_game_button(conn) do
    button("New Game", to: hangman_path(conn, :create_game), id: "guess", class: "btn btn-primary")
  end

  def letters(tally) do
    if tally.game_state == :lost do
      tally.word |> Enum.join(" ")
    else
      tally.letters |> Enum.join(" ")
    end 
  end

  def incorrect(tally) do
    MapSet.difference(tally.used, MapSet.new(tally.letters)) |> Enum.join(", ")
  end
end
