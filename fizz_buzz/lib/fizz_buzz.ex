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

  @doc """
  引数にとった数字を各条件でマッチングを図り、
  マッチする条件の結果を返す
  """
  def fizz_buzz(number) do
    cond do
      rem(number, 15) == 0 -> "Fizz Buzz!!"
      rem(number, 5) == 0 -> "Buzz."
      rem(number, 3) == 0 -> "Fizz."
      true -> "#{number}"
      end
  end

  @doc """
  エントリーポイントとなる main 関数
  """
  def main(args) do
    # コマンドライン引数を解析する
    {_, num_list, _} = args |> OptionParser.parse

    # コマンドライン引数はリストと受け取るので、
    # 一旦文字列に変換してから数値に変換する
    {last, _} =
      num_list
      |> List.to_string
      |> Integer.parse

    # 引数に問題がなければ実行
    IO.puts("Fizz Buzz Start!!")
    # 指定の番号まで実行する
    Enum.each(1..last, &(&1 |> fizz_buzz |> IO.puts))
  end
end
