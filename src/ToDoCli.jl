module ToDoCli

using Comonicon

include("./ToDoCli/lists.jl")
include("./ToDoCli/boards.jl")

using .List
using .Board

@cast List
@cast Board

@main

end # module
