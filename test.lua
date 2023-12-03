local uuid = require "uuid".new(1)


local base64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#"

local function base64(num)
    local result = ""
    repeat
        local remainder = num % 64
        result = string.sub(base64_chars, remainder + 1, remainder + 1) .. result
        num = math.floor(num / 64)
    until num == 0
    return result
end


for i = 1, 10 do
    local id = uuid()
    print(i, id, base64(id))
end
