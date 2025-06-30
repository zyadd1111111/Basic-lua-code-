local HttpService = game:GetService("HttpService")

local url = "https://raw.githubusercontent.com/yourusername/yourrepo/main/lockon.lua"
local success, scriptCode = pcall(function()
    return game:HttpGet(url)
end)

if success and scriptCode then
    local func = loadstring(scriptCode)
    if func then
        func()
    else
        warn("Failed to load script.")
    end
else
    warn("Failed to fetch script from URL.")
end
