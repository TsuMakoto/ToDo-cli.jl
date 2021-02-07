module DisplayTask

function show_list(api, boardid; is_show_card::Bool=false)
  ret = "# Task list \n"

  for list in api.lists(boardid)
    if !is_show_card
      ret *= "- $(list["name"])"
      ret *= "\n"
      continue
    end

    ret *= "## $(list["name"])"
    ret *= "\n"
    ret *= card(api, list["id"])
  end

  ret
end

function card(api, listid)
  ret = ""
  index = 1
  for card in api.cards(listid)
    ret *= """
    $(index). $(card["name"])
     - detail: $(card["desc"])
     - limit:  $(card["due"])
      \n
    """
    index += 1
  end

  ret
end

end
