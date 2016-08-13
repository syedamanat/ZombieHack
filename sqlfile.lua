--Creating a Database

require "sqlite3"

local path=system.pathForFile("data.db",system.DocumentsDirectory)
local db=sqlite3.open(path)


--creating a table
local tablesetup=[[CREATE TABLE IF NOT EXISTS test(id INTEGER PRIMARY KEY autoincrement, name);]]
db:exec(tablesetup)

--inserting a row
local insertQuery=[[INSERT INTO test VALUES(NULL,'NAMEGOESHERE');]]
db:exec(insertQuery)

--closing the DB
local function onSystemEvent(event)
	if event.type=="applicationExit" then
		if db and db:isopen()then
			db:close()
		end
	end
end
Runtime:addEventListener("system",onSystemEvent)