module Trello

using HTTP
using JSON

baseurl = "https://api.trello.com"

lists(boardid::String) = HTTP.
                          get("$(baseurl)/1/boards/$(boardid)/lists?key=$(ENV["TRELLO_KEY"])&token=$(ENV["TRELLO_TOKEN"])").
                          body |>
                          String |>
                          JSON.parse

names(resp) = map(list -> list["name"], resp)

end
