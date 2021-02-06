module ToDoCli

using Comonicon

@cast mycmd1(arg; option="Sam") = println("cmd1: arg=", arg, "option=", option)
@cast mycmd2(arg; option="Sam") = println("cmd2: arg=", arg, "option=", option)

"""
a module
"""
module Cmd3

using Comonicon

@cast mycmd4(arg) = println("cmd4: arg=", arg)

end # module

@cast Cmd3

"""
my demo Comonicon CLI project.
"""
@main

end # module
