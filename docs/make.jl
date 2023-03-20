using Documenter, Example

makedocs(;
        modules = [DBConnector],
        authors = "Jacob Zelko (aka TheCedarPrince) <jacobszelko@gmail.com> and Fareeda",
        repo =  "https://github.com/JuliaDatabases/DBConnector.jl",
        sitename = "DBConnector.jl",
        format = Documenter.HTML(;
            prettyurls = get(ENV, "CI", "false") == "true",
            canonical = "https://github.com/JuliaDatabases/DBConnector.jl"
            edit_link = "dev",
	footer = "Created by [Jacob Zelko](https://jacobzelko.com) & [Georgia Tech Research Institute](https://www.gtri.gatech.edu). [License](https://github.com/JuliaHealth/OMOPCDMCohortCreator.jl/blob/main/LICENSE)"
    ),
    pages = [
        "Home" => "index.md",
        "Functions" => "Functions.md"
    ],

)
deploydocs(repo = "github.com/quinnj/Example.jl.git",
             push_preview = true,
             devbranch = "main",
    )
