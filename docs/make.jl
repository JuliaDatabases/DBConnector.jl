using Documenter

makedocs(;
    modules = [DBConnector],
    authors = "Jacob Zelko (aka TheCedarPrince) <jacobszelko@gmail.com> and contributors",
    repo = "https://github.com/JuliaHealth/DBConnector.jl/blob/{commit}{path}#L{line}",
    sitename = "DBConnector.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://JuliaHealth.github.io/DBConnector.jl",
        assets = String[],
        edit_link = "dev",
	footer = "Created by [Jacob Zelko](https://jacobzelko.com) & [Georgia Tech Research Institute](https://www.gtri.gatech.edu). [License](https://github.com/JuliaHealth/OMOPCDMCohortCreator.jl/blob/main/LICENSE)"
    ),
    pages = [
        "Home" => "index.md",
        "Tutorials" => [
                        "SQLite.md",
                        "MySQL.md",
                        "postgreSQL.md"
                       ],
        "API" => "api.md",
        "Contributing" => "contributing.md"
    ],
)

deploydocs(;
    repo = "github.com/JuliaHealth/DBConnector.jl",
    push_preview = true,
    devbranch = "main",
)