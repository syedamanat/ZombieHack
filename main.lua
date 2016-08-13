-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local mainTable = {}
mainTable.centerX=display.contentCenterX
mainTable.centerY=display.contentCenterY

mainTable._W=display.contentWidth
mainTable._H=display.contentHeight

mainTable.isXcodeSimulator="iPhone Simulator"==system.getInfo("model")
if(mainTable.isXcodeSimulator)then
	local alert=native.showAlert("Information","Camera API not available on IOS Simulator",{"OK"})
end

mainTable.background=display.newRect(centerX,centerY, _W, _H)
mainTable.background:setFillColor(0,5,0,0)

mainTable.text=display.newText("Tap anywhere to launch camera",centerX,centerY,nil,16)

mainTable.sessionComplete=function(event)
	local image=event.target
	print("camera",(image and "returned an image")or "Session was cancelled")
	print("event name:"..event.name)
	print("Target:"..event.target)

	if image then
		image.x=centerX
		image.y=centerY
		local w=image.width
		local h=image.height
		print("w,h="..w..","..h)
	end
end

mainTable.listener=function(event)
        if media.hasSource(media.Camera)then
        	local player = display.newImage("player.png")
    player.x = 160
    player.y = 300
        	  media.capturePhoto({listener=sessionComplete})
        else
        	  native.showAlert("Corona","Camera Not Found")
        end
        return true
end
mainTable.background:addEventListener("tap",listener)
return mainTable