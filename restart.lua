-----------------------------------------------------------------------------------------
--
-- main.lua
--
----------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

local _W = display.contentWidth
local _H = display.contentHeight
local scrollSpeed = 3

ssk.persist.setDefault( "score.json", "highScore", 0 )



local composer = require( "composer" )
local scene = composer.newScene()
local myData = require("mydata")
local preference = require("preference")
local pGet = ssk.persist.get 

local pSet = ssk.persist.set


local loadsave = require( "loadsave" )
local saveTable = loadsave.saveTable()
local loadTable = loadsave.loadTable()

local scoore = require( "score" )


local currentScore
local savedScore	
local score = scoore
local scoe
local highscoe
local highScore




local function gotoStart()
    composer.gotoScene("start", { time=400, effect="crossFade" } )
	print "start"
end





function scene:create( event )


    local sceneGroup = self.view
	

	
	local bg1 = display.newImageRect( sceneGroup,"bgbw.png", 800, 1000)
	bg1.x = _W*1/2; bg1.y = _H/2;

	local gameover = display.newText( sceneGroup, "You got got...", 160, 120, native.systemFont, 30 )
	gameover:setFillColor( 0, 0, 0 )


	pengko = display.newImage( sceneGroup, "pengko.png", 160, 180)

	pengko:scale( 2, 2 )
	
	

local function gotoGame()
    composer.gotoScene("game", { time=400, effect="crossFade" } )
	print "game"
end


	
	




	scoe = display.newText ( sceneGroup, "", 130, 280, native.systemFont, 30 )
	highscoe = display.newText ( sceneGroup, "", 115, 330, native.systemFont, 30 )
	
	
	local tryAgainButton = display.newText( sceneGroup, "Try Again?", 160, 400, native.systemFont, 40 )
	tryAgainButton:setFillColor( 0.23, 0.60, 1 )
 

	tryAgainButton:addEventListener("tap", gotoGame)


	local refreshButton = display.newImage( sceneGroup, "refresh.png", 290, 480 )
	

	refreshButton:addEventListener("tap", gotoStart )


	local soundButton = display.newImage( sceneGroup, "sound on.png", 30, 480)
	soundButton.status = "playing";

	local soundFile = audio.loadSound("game.mp3")




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




composer.removeScene( "game" )

local sceneGroup = self.view

local phase = event.phase



	
	

	if ( phase == "will" ) then
		
-- Code here runs when the scene is still off screen (but is about to come on screen)


	
	print( event.params.highscore )
	


	scoe.text = "SCORE: "..event.params.score-.5 

	highscoe.text = "BEST: " .."0"

	

	

	end






		



 
end

function scene:hide( event )

local sceneGroup = self.view

local phase = event.phase



	if event.phase == "will" then
		-- display.remove(scoe)
		-- scoe = nil
		

	else

		-- display.remove(scoe)
		-- scoe = nil

	end
end

function scene:destroy( event )

	-- display.remove(scoe)
	-- scoe = nil
  
end

-- these must be the last 5 lines in the file
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene