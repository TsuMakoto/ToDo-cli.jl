module ToDoCli

using Comonicon

include("./ToDoCli/lists.jl")
include("./ToDoCli/boards.jl")

using .List
using .Board

@cast List

@cast Board

"""
Task management with command line.

Usage
1. Sign up for Trello.
2. Login
3. Access to https://trello.com/1/appKey/generate
4. Get an access key and access token.
5. Set TRELLO\\_KEY and TRELLO\\_TOKEN as environment variables.
"""
@main

end # module
