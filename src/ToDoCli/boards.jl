module Board
include("./trello/trello.jl")
using .Trello

using Comonicon
using Markdown

@cast function show()
  boards = Trello.boards()

  ret = "# Board list \n"

  for board in boards
    ret *= "- $(board["name"])"
    ret *= "\n"
  end

  Markdown.parse(ret) |> display
end

end
