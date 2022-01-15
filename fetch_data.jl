using Downloads: download

session_cookie = read("session_cookie.txt", String)

for year in 2015:2021
    path = joinpath(@__DIR__, "data", "$year")
    mkpath(path)
    for day in 1:25
        url = "https://adventofcode.com/$(year)/day/$(day)/input"
        data_file = joinpath(path, "day$(day).txt")
        println("Day $day: $data_file")
        download(url, data_file, headers = Dict("cookie" => "session=$(session_cookie)"))
        sleep(0.1)
    end
end