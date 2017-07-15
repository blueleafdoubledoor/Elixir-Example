defmodule FizzBuzz do
  @moduledoc """
  Documentation for FizzBuzz.
  """

  @doc """
  Hello world.

  ## Examples

      iex> FizzBuzz.hello
      :world

  """
  def hello do
    :world
  end

  def fizz_buzz(number) do
    cond do
      rem(number, 15) == 0 -> "Fizz Buzz!!"
      rem(number, 5) == 0 -> "Buzz."
      rem(number, 3) == 0 -> "Fizz."
      true -> "#{number}"
      end
  end

  def main(args) do
    IO.puts("Fizz Buzz Start!!")
    # コマンドライン引数を解析する
    {_, num_list, _} = args |> OptionParser.parse
    # 番号だけ取り出してそれを一旦文字列に変換してから数値に変換する
    {last, _} =
      num_list
      |> List.to_string
      |> Integer.parse
    # 指定の番号まで実行する
    Enum.each(1..last, &(&1 |> fizz_buzz |> IO.puts))
  end
end
