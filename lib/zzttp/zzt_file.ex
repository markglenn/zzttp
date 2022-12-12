defmodule Zzttp.ZztFile do
  alias Zzttp.ZztFile.Board
  alias Zzttp.ZztFile.Header

  @spec load(String.t()) :: [Board.t()]
  def load(filename) do
    with {:ok, contents} <- File.read(filename),
         {:ok, header, rest} <- Header.load(contents),
         {:ok, boards, <<>>} <- load_boards(header.num_boards, rest) do
      boards
    end
  end

  @spec load_boards([Board.t()], non_neg_integer, binary) :: {:ok, list, binary}
  def load_boards(boards \\ [], num_boards, contents)
  def load_boards(boards, 0, contents), do: {:ok, Enum.reverse(boards), contents}

  def load_boards(boards, num_boards, contents) do
    {:ok, board, rest} = Board.load(contents)

    load_boards([board | boards], num_boards - 1, rest)
  end
end
