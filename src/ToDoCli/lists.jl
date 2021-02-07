module List

include("./trello/trello.jl")
using .Trello

using Comonicon
using Markdown

info = Dict()

set_info(info::Dict) = global info = info

@cast function show()
  lists = Trello.lists(info[:boardid])

  ret = "# Task list \n"

  for name in Trello.names(lists)
    ret *= "- $(name)"
    ret *= "\n"
  end

  Markdown.parse(ret)
end

end
