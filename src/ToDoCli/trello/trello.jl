module Trello

using HTTP
using JSON

baseurl = "https://api.trello.com"

get(url::String) = HTTP.get(url).body |> String |> JSON.parse

post(url::String) = HTTP.post(url)

merge_auth(url::String) = "$(url)?key=$(ENV["TRELLO_KEY"])&token=$(ENV["TRELLO_TOKEN"])"

# ボード
boards() = get(merge_auth("$(baseurl)/1/members/me/boards"))

lists(boardid::String) = get(merge_auth("$(baseurl)/1/boards/$(boardid)/lists"))

cards(listid::String) =  get(merge_auth("$(baseurl)/1/lists/$(listid)/cards"))

create_card(idlist::String) = post(merge_auth("https://api.trello.com/1/cards") + "&idList=idList")

attachments(cardid::String) = get(merge_auth("$(baseurl)/1/cards/$(cardid)/attachments"))

checkitems(cardid::String) = get(merge_auth("$(baseurl)/1/cards/$(cardid)/checkitems"))

checklists(cardid::String) = get(merge_auth("$(baseurl)/1/cards/$(cardid)/checklists"))


end
