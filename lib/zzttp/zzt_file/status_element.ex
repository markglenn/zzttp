defmodule Zzttp.ZztFile.StatusElement do
  defstruct ~w(
    location_x
    location_y
    step_x
    step_y
    cycle
    p1
    p2
    p3
    follower
    leader
    under_id
    under_color
    current_instruction
    code
  )a

  @type t :: %__MODULE__{
          location_x: non_neg_integer(),
          location_y: non_neg_integer(),
          step_x: integer(),
          step_y: integer(),
          cycle: non_neg_integer(),
          p1: non_neg_integer(),
          p2: non_neg_integer(),
          p3: non_neg_integer(),
          follower: non_neg_integer(),
          leader: non_neg_integer(),
          under_id: non_neg_integer(),
          under_color: non_neg_integer(),
          current_instruction: non_neg_integer(),
          code: {:code, String.t()} | {:pointer, non_neg_integer()} | nil
        }

  @spec load([t()], non_neg_integer(), binary) :: {:ok, [t()]}
  def load(elements \\ [], count, rest)

  def load(elements, 0, _), do: {:ok, Enum.reverse(elements)}

  def load(elements, count, <<
        location_x::size(8),
        location_y::size(8),
        step_x::size(16)-signed-little,
        step_y::size(16)-signed-little,
        cycle::size(16)-signed-little,
        p1::size(8),
        p2::size(8),
        p3::size(8),
        follower::size(16)-signed-little,
        leader::size(16)-signed-little,
        under_id::size(8),
        under_color::size(8),
        _pointer::binary-size(4),
        current_instruction::size(16)-signed-little,
        length::size(16)-signed-little,
        _padding::binary-size(8),
        rest::binary
      >>) do
    # Code can be either raw text or a pointer to the correct status element
    {code, rest} = load_code(length, rest)

    [
      %__MODULE__{
        location_x: location_x,
        location_y: location_y,
        step_x: step_x,
        step_y: step_y,
        cycle: cycle,
        p1: p1,
        p2: p2,
        p3: p3,
        follower: follower,
        leader: leader,
        under_id: under_id,
        under_color: under_color,
        current_instruction: current_instruction,
        code: code
      }
      | elements
    ]
    |> load(count - 1, rest)
  end

  defp load_code(0, rest), do: {nil, rest}
  defp load_code(l, rest) when l < 0, do: {{:pointer, abs(l)}, rest}

  defp load_code(l, rest) do
    <<code::binary-size(l), rest::binary>> = rest
    {{:code, code}, rest}
  end
end
