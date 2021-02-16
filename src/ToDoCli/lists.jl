module List

include("./trello/trello.jl")
include("./display_task.jl")
using .Trello
using .DisplayTask

using Comonicon
using Markdown

info = Dict()

API = Trello

set_info(info::Dict) = global info = info

"""
Display task list.
"""
@cast function show(board_name::String; card::Bool=false)
  switch(board_name)

  ret = DisplayTask.show_list(API, info[:boardid]; is_show_card=card)

  render(ret)
end

@cast function add(board_name::String, list::String)
  switch(board_name)

  list = API.find_list_by_name(list)

  ret = API.create_card(list.id)

  disp = DisplayTask.create_card(ret)

  render(disp)
end

function switch(name::String)
  boards = API.boards()

  for board in boards
    if (board["name"] == name)
      info[:boardid] = board["id"]
    end
  end
end

function render(disp)
  Markdown.parse(disp) |> display
end

end
