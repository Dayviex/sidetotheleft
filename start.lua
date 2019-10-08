-----------------------------------------------------------------------------------------
--
-- main.lua
--
----------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

local _W = display.contentWidth
local _H = display.contentHeight
local scrollSpeed = 3
local composer = require( "composer" )
local scene = composer.newScene()

local function gotoGame()
    composer.gotoScene("game", { time=800, effect="crossFade" } )
end


function scene:create( event )
    local sceneGroup = self.view

	local bg1 = display.newImageRect( sceneGroup,"bg.png", 800, 1000)
	bg1.x = _W*1/2; bg1.y = _H/2;

	bg2 = display.newImage( sceneGroup, "ice2.png",140,210)

	bg7 = display.newImage( sceneGroup, "ice1.png",140,420)


	title = display.newImage( sceneGroup, "titleshadob.png", 183, 90)

	local playButton = display.newText( sceneGroup, "Play", 160, 250, native.systemFont, 40 )
	playButton:setFillColor( 0.23, 0.60, 1 )
 
	
playButton:addEventListener("tap", gotoGame)


	local soundButton = display.newImage( sceneGroup, "sound on.png", 30, 480)
	soundButton.status = "playing";

	-- local soundFile = audio.loadSound("game.mp3")
	audio.play(soundFile,{
			channel = 1,
			loops = -1,
			fadein = 500,
	});


	function soundButton:tap(e)
		if(self.status == "playing") then
			audio.pause(1);
			self.status = "paused";
			

		elseif(self.status == "paused") then
			audio.resume(1);
			self.status = "playing";
			
		end
	end

	soundButton:addEventListener("tap", soundButton);
end


	




function scene:show( event )
	local sceneGroup = self.view

	local phase = event.phase


		if ( phase == "will" ) then
		
-- Code here runs when the scene is still off screen (but is about to come on screen)

	
		elseif ( phase == "did" ) then
		
-- Code here runs when the scene is entirely on screen

	
end



 
end

function scene:hide( event )



end

function scene:destroy( event )
  
end

-- these must be the last 5 lines in the file
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene