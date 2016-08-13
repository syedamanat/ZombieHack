-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- Create a native map view
-- Create a native map view
local myMap = native.newMapView( 20, 20,display.contentWidth, display.actualContentHeight)
myMap.x = display.contentCenterX
myMap.y = display.contentCenterY

local function markerListener(event)
    print( event.type, event.markerId, event.latitude, event.longitude)
end

local attempts = 0

local locationText = display.newText( "Location: ", 0, 400, native.systemFont, 16 )
locationText.anchorY = 0
locationText.x = display.contentCenterX

local function locationHandler( event )

    local currentLocation = myMap:getUserLocation()

    if ( currentLocation.errorCode or ( currentLocation.latitude == 0 and currentLocation.longitude == 0 ) ) then
        locationText.text = currentLocation.errorMessage

        attempts = attempts + 1

        if ( attempts > 10 ) then
            native.showAlert( "No GPS Signal", "Can't sync with GPS.", { "Okay" } )
        else
            timer.performWithDelay( 1000, locationHandler )
        end
    else
        locationText.text = "Current location: " .. currentLocation.latitude .. "," .. currentLocation.longitude
        myMap:setCenter( currentLocation.latitude, currentLocation.longitude )

        local zshop =
        {
             title = "Shop",
             subtitle = "",
             listener = markerListener,
             imageFile =  "smarker.png",
        }

        local zifst =
        {
             title = "Zombie Infested Area",
             subtitle = "",
             listener = markerListener,
             imageFile =  "zmarker.png",
        }

        sloc={}
        zloc={}

        sloc[1]={12.9737214, 77.6164726}
        zloc[1]={12.9736896, 77.6165566}

        local shop = myMap:addMarker(sloc[1][1], sloc[1][2], zshop)
        local ifst = myMap:addMarker(zloc[1][1], zloc[1][2], zifst)

        --myMap:removeMarker(ifst)
    end
end

locationHandler()