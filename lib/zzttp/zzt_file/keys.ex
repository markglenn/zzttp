defmodule Zzttp.ZztFile.Keys do
  defstruct [:key_map]

  @type t :: %__MODULE__{key_map: MapSet.t()}

  @spec load(<<_::56>>) :: {:ok, t()} | {:error, String.t()}
  def load(
        <<blue::size(8), green::size(8), cyan::size(8), red::size(8), purple::size(8),
          yellow::size(8), white::size(8)>>
      ) do
    keys = MapSet.new()

    keys = apply_key(keys, :blue, blue)
    keys = apply_key(keys, :green, green)
    keys = apply_key(keys, :cyan, cyan)
    keys = apply_key(keys, :red, red)
    keys = apply_key(keys, :purple, purple)
    keys = apply_key(keys, :yellow, yellow)
    keys = apply_key(keys, :white, white)

    {:ok, %__MODULE__{key_map: keys}}
  end

  def load(_), do: {:error, "Invalid key format"}

  @spec blue?(t) :: boolean
  def blue?(%__MODULE__{key_map: key_map}), do: MapSet.member?(key_map, :blue)

  @spec green?(t) :: boolean
  def green?(%__MODULE__{key_map: key_map}), do: MapSet.member?(key_map, :green)

  @spec cyan?(t) :: boolean
  def cyan?(%__MODULE__{key_map: key_map}), do: MapSet.member?(key_map, :cyan)

  @spec red?(t) :: boolean
  def red?(%__MODULE__{key_map: key_map}), do: MapSet.member?(key_map, :red)

  @spec purple?(t) :: boolean
  def purple?(%__MODULE__{key_map: key_map}), do: MapSet.member?(key_map, :purple)

  @spec yellow?(t) :: boolean
  def yellow?(%__MODULE__{key_map: key_map}), do: MapSet.member?(key_map, :yellow)

  @spec white?(t) :: boolean
  def white?(%__MODULE__{key_map: key_map}), do: MapSet.member?(key_map, :white)

  defp apply_key(keys, _key_name, 0), do: keys
  defp apply_key(keys, key_name, _), do: MapSet.put(keys, key_name)
end
