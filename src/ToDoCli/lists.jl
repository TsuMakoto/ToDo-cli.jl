module List

include("./trello/trello.jl")
include("./display_task.jl")
using .Trello
using .DisplayTask

using Comonicon
using Markdown

info = Dict()

set_info(info::Dict) = global info = info

"""
Display task list.
"""
@cast function show(board_name::String; card=false)
  card = parse(Bool, card)
  switch(board_name)

  ret = DisplayTask.show_list(Trello, info[:boardid]; is_show_card=card)

  Markdown.parse(ret) |> display
end

function switch(name::String)
  boards = Trello.boards()

  for board in boards
    if (board["name"] == name)
      info[:boardid] = board["id"]
    end
  end
end

end
