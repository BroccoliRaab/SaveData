local saveData = {}
local finalStringTemp = "return { \r\n"

local function formatData2(data)
  local finalString = finalStringTemp
  
  local function formatData1(data)
      for i, v in pairs(data) do
      if type(v) == "table" then
        finalString = finalString..i.."= {\r\n"
        formatData1(v)
        finalString = finalString.."},\r\n"
      else
        if type(v) == "string" then v = [["]]..v..[["]] end
        finalString = finalString..i.."="..v..",\r\n"
      end
    end
  finalString = finalString:sub(1, string.len(finalString)-3).."\r\n"
  end

  formatData1(data)
  finalString = finalString.."\r\n} "
  return finalString
end

function saveData.load(saveFile)
  local chunk, err = love.filesystem.load(saveFile)
  return chunk()
end

function saveData.save(data, saveFile)
  return = love.filesystem.write(saveFile, formatData2(data))
end

return saveData