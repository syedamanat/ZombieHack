--include SQLite
require "sqlite3"

--open db and set path to the same folder as our main.lua file
local path=system.pathForFile("data.sqlite",system.ResourceDirectory)
db=sqlite3.open(path)

--closing the db in case the user closes the application
local function onSystemEvent(event)
	if(event.type=="applicationExit")then
	 	db:close()
	 end
end

local output
local sql="SELECT * FROM test"
for row in db:nrows(sql)do
	print(something..)
end

Runtime:addEventListener("system",onSystemEvent)