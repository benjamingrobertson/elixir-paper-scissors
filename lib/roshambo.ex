defmodule Roshambo do

    def main([]) do
        IO.puts("You forgot to make a move")
    end

    def main(args) do
        args
        |> parse_args
        |> determine_winner
        |> IO.puts
    end

    defp parse_args(args) do
        switches = [rock: :boolean, paper: :boolean, scissors: :boolean]
        parse = OptionParser.parse(args, switches: switches)
        case parse do
            {[{switch, true}], [player_move], _} ->
                IO.puts("You played #{player_move}.")
                {to_string(switch), player_move}
            {_, [player_move], _} ->
                IO.puts("You played #{player_move}.")
                {computer_move, player_move}
        end
    end

    defp computer_move do
        Enum.random(["rock", "paper", "scissors"])
    end

    defp determine_winner({"paper", "rock"}) do
        "You lost, computer played paper"
    end
    defp determine_winner({"rock", "scissors"}) do
        "You lost, computer played rock"
    end
    defp determine_winner({"scissors", "paper"}) do
        "You lost, computer played scissors"
    end
    defp determine_winner({comp_move, player_move}) when comp_move == player_move do
        "It was a tie, you both played #{comp_move}"
    end
    defp determine_winner({comp_move, _}) do
        "You win! Computer played #{comp_move}"
    end

end
