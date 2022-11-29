defmodule Zzttp.ZztFile.BoardProperties do
  alias Zzttp.ZztFile.ZztString

  defstruct ~w(
    max_player_shots
    is_dark
    exit_north
    exit_south
    exit_west
    exit_east
    restart_on_zap
    message
    player_enter_x
    player_enter_y
    time_limit
  )a

  @type t :: %__MODULE__{
          max_player_shots: non_neg_integer(),
          is_dark: boolean(),
          exit_north: non_neg_integer(),
          exit_south: non_neg_integer(),
          exit_west: non_neg_integer(),
          exit_east: non_neg_integer(),
          restart_on_zap: boolean(),
          message: String.t(),
          player_enter_x: non_neg_integer(),
          player_enter_y: non_neg_integer(),
          time_limit: non_neg_integer()
        }

  @spec load(binary) :: {:ok, t, binary}
  def load(<<
        max_player_shots::size(8),
        is_dark::size(8),
        exit_north::size(8),
        exit_south::size(8),
        exit_west::size(8),
        exit_east::size(8),
        restart_on_zap::size(8),
        message_str::binary-size(59),
        player_enter_x::size(8),
        player_enter_y::size(8),
        time_limit::size(16)-signed-little,
        _unused::binary-size(16),
        rest::binary
      >>) do
    {:ok,
     %__MODULE__{
       max_player_shots: max_player_shots,
       is_dark: is_dark != 0,
       exit_north: exit_north,
       exit_south: exit_south,
       exit_west: exit_west,
       exit_east: exit_east,
       restart_on_zap: restart_on_zap != 0,
       message: ZztString.from_zzt_string(message_str),
       player_enter_x: player_enter_x,
       player_enter_y: player_enter_y,
       time_limit: time_limit
     }, rest}
  end
end
