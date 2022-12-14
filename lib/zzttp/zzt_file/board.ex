defmodule Zzttp.ZztFile.Board do
  alias Zzttp.ZztFile.{BoardProperties, StatusElement, Tile}
  alias Zzttp.Elements.ElementType
  alias Zzttp.ZztFile.ZztString

  defstruct [:name, :tiles, :properties, :status_elements]

  @type tile_t :: {non_neg_integer, non_neg_integer}

  @type t :: %__MODULE__{
          name: String.t(),
          tiles: [Tile.t()],
          properties: BoardProperties.t(),
          status_elements: %{Tile.position_t() => StatusElement.t()}
        }

  @spec load(binary) :: {:ok, t(), binary} | {:error, String.t()}
  def load(
        <<board_size::size(16)-signed-little, contents::binary-size(board_size),
          rest_after_board::binary>>
      ) do
    with {:ok, name, rest} <- load_name(contents),
         {:ok, tiles, rest} <- load_rle_board(rest),
         {:ok, properties, rest} <- BoardProperties.load(rest),
         <<status_element_count::size(16)-signed-little, rest::binary>> <- rest,
         {:ok, status_elements} <- StatusElement.load(status_element_count + 1, rest) do
      {:ok,
       %__MODULE__{
         name: name,
         tiles: to_tile_map(tiles),
         properties: properties,
         status_elements: to_status_elements_map(status_elements)
       }, rest_after_board}
    else
      _ -> {:error, "Invalid Board Format"}
    end
  end

  defp load_name(<<board_name_str::binary-size(51), rest::binary>>) do
    name = ZztString.from_zzt_string(board_name_str)
    {:ok, name, rest}
  end

  @spec load_rle_board(List.t(), binary, non_neg_integer()) :: {:ok, List.t(), binary}
  defp load_rle_board(tiles \\ [], rest, remaining_tiles \\ 1500)
  defp load_rle_board(tiles, rest, 0), do: {:ok, Enum.reverse(tiles), rest}

  defp load_rle_board(
         tiles,
         <<count::size(8), element::size(8), color::size(8), rest::binary>>,
         remaining_tiles
       )
       when remaining_tiles > 0 do
    # A small quirk of this RLE format is when the number of tiles is set to
    # zero. Due to the way the decoder is set up, a Count of 0 means there are
    # actually 256 tiles encoded. The built-in editor does not encode tiles
    # using this value despite being decoded correctly in the game, and it will
    # probably crash some older external editors.
    count = if count == 0, do: 256, else: count

    tiles
    |> add_tiles(count, {element, color})
    |> load_rle_board(rest, remaining_tiles - count)
  end

  # We have less than 0 tiles remaining and we must have failed the RLE decoding
  defp load_rle_board(_, _, _), do: {:error, "Invalid tile count"}

  # Decode the RLE contents
  defp add_tiles(tiles, 0, _), do: tiles
  defp add_tiles(tiles, n, tile), do: add_tiles([tile | tiles], n - 1, tile)

  defp to_tile_map(tiles) do
    tiles
    |> Enum.zip(0..1499)
    |> Enum.map(fn {{idx, color}, i} ->
      %Tile{
        element: ElementType.element(idx),
        color: color,
        position: {rem(i, 60) + 1, div(i, 60) + 1}
      }
    end)
  end

  defp to_status_elements_map(status_elements) do
    status_elements
    |> Enum.reduce(%{}, fn element, acc ->
      Map.put(acc, {element.location_x, element.location_y}, element)
    end)
  end

  @spec status_element_at(t(), Tile.position_t()) :: StatusElement.t() | nil
  def status_element_at(%__MODULE__{status_elements: status_elements}, pos) do
    Map.get(status_elements, pos)
  end
end
