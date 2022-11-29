defmodule Zzttp.ZztFile.ZztString do
  @doc """
  Extracts a string from a length encoded string defined by ZZT.

  Strings are defined as 1 byte length + X number of bytes of space. Only the
  first bytes defined by the length contain the string. The rest are ignored and
  most likely blank.
  """
  @spec from_zzt_string(binary) :: String.t()
  def from_zzt_string(<<length::size(8), string::binary-size(length), _::binary>>), do: string
end
