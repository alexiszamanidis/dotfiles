local M = {}

local function exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

local function existsDir(path)
    return exists(path .. "/")
end

M.existsDir = existsDir

return M
