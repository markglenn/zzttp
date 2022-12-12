defmodule Zzttp.Color do
  @doc """
  Convert a color into a CSS class name that corresponds to it
  """
  @spec to_class(non_neg_integer()) :: String.t()
  def to_class(color) do
    "c#{color |> Integer.to_string(16) |> String.pad_leading(2, "0")}"
  end

  def to_color(element, color) do
    case element do
      # Text Blue
      0x2F -> 0x1F
      # Text Green
      0x30 -> 0x2F
      # Text Cyan
      0x31 -> 0x3F
      # Text Red
      0x32 -> 0x4F
      # Text Purple
      0x33 -> 0x5F
      # Text Brown
      0x34 -> 0x6F
      # Text Black
      0x35 -> 0x0F
      _ -> color
    end
    |> to_class()
    |> String.downcase()
  end
end
