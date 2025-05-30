
local current_dir = io.popen"cd":read'*l'
local lang = "es"

-- error(current_dir)
-- 
-- if string.find(current_dir, "polish") then
--     lang = "pl-PL"
-- elseif string.find(current_dir, "klasy") then
--     lang = "es"
-- end

local M = {
    ltex = {
        language = lang
    }
}
return M
