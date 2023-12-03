local worker_id_bits = 6
local timestamp_bits = 28
local index_bits = 14

local max_worker_id = (2 ^ worker_id_bits) - 1
local max_index = (2 ^ index_bits) - 1
local max_time = (2 ^ timestamp_bits) - 1

local epoch = os.time({ year = 2023, month = 12, day = 1 }) -- 设置起始时间戳


local uuid = {}


function uuid.new(worker_id)
    assert(worker_id >= 0 and worker_id <= max_worker_id)
    local index = 0
    local lasttime = -1

    return function()
        local time = os.time() - epoch
        assert(time <= max_time)

        if time == lasttime then
            index = index + 1
            if index > max_index then
                while time <= lasttime do
                    time = os.time() - epoch
                    assert(time <= max_time)
                end
                index = 0
            end
        else
            index = 0
        end

        lasttime = time

        local id = worker_id << timestamp_bits

        id = id | time
        id = id << index_bits

        id = id | index
        return id
    end
end

return uuid
