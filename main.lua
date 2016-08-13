-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local centerX=display.contentCenterX
local centerY=display.contentCenterY

local _W=display.contentWidth
local _H=display.contentHeight

local isXcodeSimulator="iPhone Simulator"==system.getInfo("model")
if(isXcodeSimulator)then
	local alert=native.showAlert("Information","Camera API not available on IOS Simulator",{"OK"})
end

local background=display.newRect(centerX,centerY, _W, _H)
background:setFillColor(0,5,0,0)

local text=display.newText("Tap anywhere to launch camera",centerX,centerY,nil,16)

local sessionComplete=function(event)
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

local listener=function(event)
        if media.hasSource(media.Camera)then
        	  media.capturePhoto({listener=sessionComplete})
        else
        	  native.showAlert("Corona","Camera Not Found")
        end
        return true
end
background:addEventListener("tap",listener)
