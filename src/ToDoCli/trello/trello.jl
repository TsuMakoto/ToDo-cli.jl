module Trello

using HTTP
using JSON

baseurl = "https://api.trello.com"

boards() = HTTP.
             get(merge_auth("$(baseurl)/1/members/me/boards")).
             body |>
             String |>
             JSON.parse

lists(boardid::String) = HTTP.
                          get(merge_auth("$(baseurl)/1/boards/$(boardid)/lists")).
                          body |>
                          String |>
                          JSON.parse

cards(listid::String) =  HTTP.
                          get(merge_auth("$(baseurl)/1/lists/$(listid)/cards")).
                          body |>
                          String |>
                          JSON.parse

attachments(cardid::String) = HTTP.
                                get(merge_auth("$(baseurl)/1/cards/$(cardid)/attachments")).
                                body |>
                                String |>
                                JSON.parse

checkitems(cardid::String) = HTTP.
                                get(merge_auth("$(baseurl)/1/cards/$(cardid)/checkitems")).
                                body |>
                                String |>
                                JSON.parse

checklists(cardid::String) = HTTP.
                                get(merge_auth("$(baseurl)/1/cards/$(cardid)/checklists")).
                                body |>
                                String |>
                                JSON.parse

merge_auth(url) = "$(url)?key=$(ENV["TRELLO_KEY"])&token=$(ENV["TRELLO_TOKEN"])"

end
