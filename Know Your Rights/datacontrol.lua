module(... , package.seeall)

function getData(fileName)

  local content = ""
  local numberOfLines = 0
  local lineSize = 22
  local rowHeight = 250
  -- Sets Name of Local Path
  local path = system.pathForFile( fileName, system.ResourceDirectory )

  -- Reads line by line of the text document
  -- Also keeps count of the number of lines
  for line in io.lines(path) do
      numberOfLines = numberOfLines + 1
      content = content  .. line .. "\n"
  end

  path = nil

  -- Updates Row Heigh based on the number of lines in the file
  rowHeight = numberOfLines * lineSize

  return content, rowHeight

end
