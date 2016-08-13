-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local locationEnabled = true
system.setLocationAccuracy( 10 )

locationHandler = function( event )
  if locationEnabled == true then
    -- Check for error (user may have turned off location services)
    if ( event.errorCode ) then
        native.showAlert( "GPS Location Error", event.errorMessage, {"OK"} )
        print( "Location error: " .. tostring( event.errorMessage ) )
    else
        startLat, startLon = event.latitude, event.longitude
        print(event.latitude, event.longitude)
    end
  end
end
Runtime:addEventListener("location",locationHandler)