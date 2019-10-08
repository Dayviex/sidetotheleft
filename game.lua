io.output():setvbuf("no")

display.setStatusBar(display.HiddenStatusBar)

local _W = display.contentWidth
local _H = display.contentHeight
local scrollSpeed = 3


require "ssk2.loadSSK"

_G.ssk.init( { } )

ssk.persist.setDefault( "score.json", "highScore", 0 )



local physics = require "physics"
physics.start()
local myData = require("mydata")
local composer = require( "composer" )
local loadsave = require( "loadsave" )
local scene = composer.newScene()
-- local currentScore
-- local savedScore 
local pGet = ssk.persist.get 

local pSet = ssk.persist.set

local saveTable = loadsave.saveTable()
local loadTable = loadsave.loadTable()
local scoreTable
local currentScore 
local scorer



-- here you declare all your local variables:

local Score = 0
local score = 0
local highscore = 0

local scoore = require( "score" )


local checkForNewHighScore 
--


-- here you declare all your local functions:  -- whatever your code requires...


-- loadsave.saveTable( scoreTable, "scoreTable.json" )

local function move(event)
	bg2.x = bg2.x - scrollSpeed/2
	bg3.x = bg3.x - scrollSpeed/2
	bg4.x = bg4.x - scrollSpeed/2
	bg5.x = bg5.x - scrollSpeed/2
	bg6.x = bg6.x - scrollSpeed/2
	bg7.x = bg7.x - scrollSpeed
	bg8.x = bg8.x - scrollSpeed
	bg9.x = bg9.x - scrollSpeed
	bg10.x = bg10.x - scrollSpeed
	bg11.x = bg11.x - scrollSpeed

	if(-bg2.x + bg2.contentWidth) > 1080 then
		bg2:translate(2000,0)
	end
	if(-bg3.x + bg3.contentWidth) > 1080 then
		bg3:translate(2000,0)
	end
	if(-bg4.x + bg4.contentWidth) > 1080 then
		bg4:translate(2000,0)
	end
	if(-bg5.x + bg5.contentWidth) > 1080 then
		bg5:translate(2000,0)
	end
	if(-bg6.x + bg6.contentWidth) > 1080 then
		bg6:translate(2000,0)
	end
	if(-bg7.x + bg7.contentWidth) > 1080 then
		bg7:translate(2000,0)
	end
	if(-bg8.x + bg8.contentWidth) > 1080 then
		bg8:translate(2000,0)
	end
	if(-bg9.x + bg9.contentWidth) > 1080 then
		bg9:translate(2000,0)
	end
	if(-bg10.x + bg10.contentWidth) > 1080 then
		bg10:translate(2000,0)
	end
	if(-bg11.x + bg11.contentWidth) > 1080 then
		bg11:translate(2000,0)
	end
end




local scoore = require( "score" )

local score = 0


local scoreText = scoore.init(
{
    fontSize = 40,
    x = 130,
    y = 30,
    maxDigits = 7,
    leadingZeros = false
})


local function isValidPhysics( obj )
   return( obj and type(obj.applyForce) == "function" )
end

local animation -- Leave it nil

local function activateAnimations(event)
   if( isValidPhysics( animation )) then
      animation:applyForce(0, -35, animation.x, animation.y)
   end
end







local function touchScreen(event)

	if event.phase == "began" then
		animation.enterFrame = activateAnimations
		Runtime:addEventListener("enterFrame", animation)



	end

	if event.phase == "ended" then
		Runtime:removeEventListener("enterFrame", animation)
	
	end



end





local function onCollision(event)
	if event.phase == "began" then
		print "collide"

		composer.gotoScene( "restart",{ time=600, effect="zoomInOutFade", params=scoore } )
	
	end
end






local scoreTable
local score = 0



local currentScore = scoore.get




checkForNewHighScore = function()

local function checkForNewHighScore()

	if( currentScore > pGet("score.json", "highScore") ) then

		pSet("score.json", "highScore", currentScore )

		

	end

print ("work")
end

end






local function onLocalCollision( self, event )
    if ( event.phase == "began" ) then
		if self.name == "scorebar" then

	        print("Collision")
		scoore.add( .5 )
		-- checkForNewHighScore()

		end
	
	
    end
return false
end







local scorebar = display.newRect(40,160,20,800)
physics.addBody( scorebar, "dynamic", {density=1, isSensor=true} )
scorebar.collision = onLocalCollision
scorebar.name = "scorebar"
scorebar.gravityScale = 0
scorebar:addEventListener( "collision" )
scorebar:setFillColor(0,0,0,0)




function scene:create( event )

local sceneGroup = self.view

    -- put any thing you need to create here
	bg1 = display.newImageRect(sceneGroup, "bg.png", 800, 1000)

	bg2 = display.newImage(sceneGroup, "ice2.png",140,210)

	bg3 = display.newImage(sceneGroup, "ice2.png",540,210)

	bg4 = display.newImage(sceneGroup, "ice2.png",940,210)

	bg5 = display.newImage(sceneGroup, "ice2.png",1340,210)

	bg6 = display.newImage(sceneGroup, "ice2.png",1740,210)

	bg7 = display.newImage(sceneGroup, "ice1.png",140,420)

	bg8 = display.newImage(sceneGroup, "ice1.png",540,420)

	bg9 = display.newImage(sceneGroup, "ice1.png",940,420)

	bg10 = display.newImage(sceneGroup, "ice1.png",1340,420)

	bg11 = display.newImage(sceneGroup, "ice1.png",1740,420)

	ceiling = display.newImage(sceneGroup, "invisibleTile.png", 0, -120)
		physics.addBody(ceiling, "static", {density=.1, bounce=0.1, friction=.5})

	theFloor = display.newImage(sceneGroup, "invisibleTile.png", 0, 600)
		physics.addBody(theFloor, "static", {density=.1, bounce=0.1, friction=.5})
	



	scoore.set( 0 )



local sheetData = {
	width=50,
	height=28,
	numFrames=4,
	sheetContentWidth=200,
	sheetContentHeight=28

}

local mySheet = graphics.newImageSheet ( "pengs.png", sheetData )

local sequenceData = {

	{ name = "pengFly",
	  start = 1,
	  count = 4,
	  time = 400,
	  loopCount = 0,
	  loopDirection = "foward"
	 }

}

animation = display.newSprite(sceneGroup, mySheet, sequenceData)
	
animation.x = 80
animation.y = 201
animation.id = "animation"
	physics.addBody(animation, "dynamic", {density=.45, bounce=.1, friction=.5, radius=27},
	{bounce=.1, friction=.5, radius=27, isSensor = true})
animation:play()

	
 	local tappy = display.newText( sceneGroup, "TAP!", 160, 240, Georgia, 60 )
	tappy:setFillColor( 0, 0, 0 )

	transition.fadeIn( tappy, { time=500 } )
	transition.fadeOut( tappy, { time=3500 } )

	iceblock = display.newRect(480,-100,20,20)
		physics.addBody(iceblock, "kinematic")
	iceblock.speed = 4

	icebok = display.newImage(sceneGroup, "icebok.png", 480, 301)
		physics.addBody(icebok, "static", {density=.1, bounce=0.1, friction=.5, radius=10})
	icebok.speed = 4

	
	iceblock1 = display.newRect(680,-100,20,20)
		physics.addBody(iceblock1, "kinematic")
	iceblock1.speed = 4

	icebok1 = display.newImage(sceneGroup, "icebok.png", 680, 201)
		physics.addBody(icebok1, "static", {density=.1, bounce=0.1, friction=.5, radius=10})
	icebok1.speed =	4
	

	iceblock2 = display.newRect(880,-100,20,20)
		physics.addBody(iceblock2, "kinematic")
	iceblock2.speed = 4

	icebok2 = display.newImage(sceneGroup, "icebok.png", 880, 301)
		physics.addBody(icebok2, "static", {density=.1, bounce=0.1, friction=.5, radius=10})
	icebok2.speed = 4
	

	iceblock3 = display.newRect(1080,-100,20,20)
		physics.addBody(iceblock3, "kinematic")
	iceblock3.speed = 4

	icebok3 = display.newImage(sceneGroup, "icebok.png", 1080, 401)
		physics.addBody(icebok3, "static", {density=.1, bounce=0.1, friction=.5, radius=10})
	icebok3.speed = 4
	
	
	iceblock4 = display.newRect(1330,-100,20,20)
		physics.addBody(iceblock4, "kinematic")
	iceblock4.speed = 4

	icebok4 = display.newImage(sceneGroup, "icebok.png", 1330, 499)
		physics.addBody(icebok4, "static", {density=.1, bounce=0.1, friction=.5, radius=10})
	icebok4.speed = 4
	
	
	iceblock5 = display.newRect(1580,-100,20,20)
		physics.addBody(iceblock5, "kinematic")
	iceblock5.speed = 4

	icebok5 = display.newImage(sceneGroup, "icebok.png", 1580, 499)
		physics.addBody(icebok5, "static", {density=.1, bounce=0.1, friction=.5, radius=10})
	icebok5.speed = 4
	

	iceblock6 = display.newRect(1830,-100,20,20)
		physics.addBody(iceblock6, "kinematic")
	iceblock6.speed = 4

	icebok6 = display.newImage(sceneGroup, "icebok.png", 1830, 401)
		physics.addBody(icebok6, "static", {density=.1, bounce=0.1, friction=.5, radius=10})
	icebok6.speed = 4
	

	iceblok = display.newRect(480,-100,20,20)
		physics.addBody(iceblok, "kinematic")
	iceblok.speed = 4

	iceblok1 = display.newRect(680,-100,20,20)
		physics.addBody(iceblok1, "kinematic")
	iceblok1.speed = 4

	iceblok2 = display.newRect(880,-100,20,20)
		physics.addBody(iceblok2, "kinematic")
	iceblok2.speed = 4

	iceblok3 = display.newRect(1080,-100,20,20)
		physics.addBody(iceblok3, "kinematic")
	iceblok3.speed = 4

	iceblok4 = display.newRect(1330,-100,20,20)
		physics.addBody(iceblok4, "kinematic")
	iceblok4.speed = 4

	iceblok5 = display.newRect(1580,-100,20,20)
		physics.addBody(iceblok5, "kinematic")
	iceblok5.speed = 4

	iceblok6 = display.newRect(1830,-100,20,20)
		physics.addBody(iceblok6, "kinematic")
	iceblok6.speed = 4

	function moveiceboks(self,event)
		if self.x < -10 then
			
			self.x = 800
			self.y = math.random(0,500)
			self.speed = 4


		else
			self.x = self.x - self.speed
		
		end
	end

	
	function moveiceblocks(self,event)
	if self.x < -10 then
		self.x = 800
		self.speed = 4
		self.y = -100
		else
			self.x = self.x - self.speed
		end
	end

	function moveicebloks(self,event)
	if self.x < -10 then
		self.x = 800
		self.speed = 4
		self.y = -100
		else
			self.x = self.x - self.speed
		end
	end

end


function scene:show( event )


     local sceneGroup = self.view
	if event.phase == "will" then
         -- put code here you want to happen just before the scene comes on the screen
	 

	Runtime:addEventListener("enterFrame", move)
	Runtime:addEventListener("touch", touchScreen)

	iceblock.enterFrame = moveiceblocks
	Runtime:addEventListener("enterFrame",iceblock)
	iceblock1.enterFrame = moveiceblocks
	Runtime:addEventListener("enterFrame",iceblock1)
	iceblock2.enterFrame = moveiceblocks
	Runtime:addEventListener("enterFrame",iceblock2)
	iceblock3.enterFrame = moveiceblocks
	Runtime:addEventListener("enterFrame",iceblock3)
	iceblock4.enterFrame = moveiceblocks
	Runtime:addEventListener("enterFrame",iceblock4)
	iceblock5.enterFrame = moveiceblocks
	Runtime:addEventListener("enterFrame",iceblock5)
	iceblock6.enterFrame = moveiceblocks
	Runtime:addEventListener("enterFrame",iceblock6)

	iceblok.enterFrame = moveicebloks
	Runtime:addEventListener("enterFrame",iceblok)
	iceblok1.enterFrame = moveicebloks
	Runtime:addEventListener("enterFrame",iceblok1)
	iceblok2.enterFrame = moveicebloks
	Runtime:addEventListener("enterFrame",iceblok2)
	iceblok3.enterFrame = moveicebloks
	Runtime:addEventListener("enterFrame",iceblok3)
	iceblok4.enterFrame = moveicebloks
	Runtime:addEventListener("enterFrame",iceblok4)
	iceblok5.enterFrame = moveicebloks
	Runtime:addEventListener("enterFrame",iceblok5)
	iceblok6.enterFrame = moveicebloks
	Runtime:addEventListener("enterFrame",iceblok6)

	icebok.enterFrame = moveiceboks
	Runtime:addEventListener("enterFrame",icebok)
	icebok1.enterFrame = moveiceboks
	Runtime:addEventListener("enterFrame",icebok1)
	icebok2.enterFrame = moveiceboks
	Runtime:addEventListener("enterFrame",icebok2)
	icebok3.enterFrame = moveiceboks
	Runtime:addEventListener("enterFrame",icebok3)
	icebok4.enterFrame = moveiceboks
	Runtime:addEventListener("enterFrame",icebok4)
	icebok5.enterFrame = moveiceboks
	Runtime:addEventListener("enterFrame",icebok5)
	icebok6.enterFrame = moveiceboks
	Runtime:addEventListener("enterFrame",icebok6)
	animation.collision = onCollision
	animation:addEventListener("collision", onCollision)

	





     	else
         -- put code here you want to happen after the scene comes on the screen
	
	Runtime:addEventListener("touch", touchScreen)

	
	animation.collision = onCollision
	animation:addEventListener("collision", onCollision)


    end




end

function scene:hide( event )
    local sceneGroup = self.view
	if event.phase == "will" then

	scoore.save()
	display.remove(iceblock)
	
	display.remove(iceblock1)
	
	display.remove(iceblock2)
	
	display.remove(iceblock3)
	
	display.remove(iceblock4)
	
	display.remove(iceblock5)

	display.remove(iceblock6)


	display.remove(iceblok)
	
	display.remove(iceblok1)

	display.remove(iceblok2)

	display.remove(iceblok3)
	
	display.remove(iceblok4)
	
	display.remove(iceblok5)
	
	display.remove(iceblok6)

	display.remove(scorebar)
	scorebar = nil
	display.remove(scoreText)
	scoreText = nil
	Runtime:removeEventListener("enterFrame", move)
	Runtime:removeEventListener("touch", touchScreen)
	

	Runtime:removeEventListener("enterFrame",iceblock)

	Runtime:removeEventListener("enterFrame",iceblock1)

	Runtime:removeEventListener("enterFrame",iceblock2)

	Runtime:removeEventListener("enterFrame",iceblock3)

	Runtime:removeEventListener("enterFrame",iceblock4)

	Runtime:removeEventListener("enterFrame",iceblock5)

	Runtime:removeEventListener("enterFrame",iceblock6)



	Runtime:removeEventListener("enterFrame",iceblok)

	Runtime:removeEventListener("enterFrame",iceblok1)

	Runtime:removeEventListener("enterFrame",iceblok2)

	Runtime:removeEventListener("enterFrame",iceblok3)

	Runtime:removeEventListener("enterFrame",iceblok4)

	Runtime:removeEventListener("enterFrame",iceblok5)

	Runtime:removeEventListener("enterFrame",iceblok6)



	Runtime:removeEventListener("enterFrame",icebok)

	Runtime:removeEventListener("enterFrame",icebok1)
	
	Runtime:removeEventListener("enterFrame",icebok2)

	Runtime:removeEventListener("enterFrame",icebok3)

	Runtime:removeEventListener("enterFrame",icebok4)

	Runtime:removeEventListener("enterFrame",icebok5)

	Runtime:removeEventListener("enterFrame",icebok6)

	animation:removeEventListener("collision", onCollision)




	else
         -- put code here you want to happen after the scene has left the screen

	

	display.remove(scoreText.scoreText)
	scoreText.scoreText = nil
	
	Runtime:removeEventListener("enterFrame",iceblock)

	Runtime:removeEventListener("enterFrame",iceblock1)

	Runtime:removeEventListener("enterFrame",iceblock2)

	Runtime:removeEventListener("enterFrame",iceblock3)

	Runtime:removeEventListener("enterFrame",iceblock4)

	Runtime:removeEventListener("enterFrame",iceblock5)

	Runtime:removeEventListener("enterFrame",iceblock6)


	Runtime:removeEventListener("enterFrame",iceblok)

	Runtime:removeEventListener("enterFrame",iceblok1)

	Runtime:removeEventListener("enterFrame",iceblok2)

	Runtime:removeEventListener("enterFrame",iceblok3)

	Runtime:removeEventListener("enterFrame",iceblok4)

	Runtime:removeEventListener("enterFrame",iceblok5)

	Runtime:removeEventListener("enterFrame",iceblok6)


	Runtime:removeEventListener("enterFrame",iceblok)

	Runtime:removeEventListener("enterFrame",iceblok1)

	Runtime:removeEventListener("enterFrame",iceblok2)

	Runtime:removeEventListener("enterFrame",iceblok3)

	Runtime:removeEventListener("enterFrame",iceblok4)

	Runtime:removeEventListener("enterFrame",iceblok5)

	Runtime:removeEventListener("enterFrame",iceblok6)


	Runtime:removeEventListener("touch", touchScreen)
	
	Runtime:removeEventListener("enterFrame",icebok)

	Runtime:removeEventListener("enterFrame",icebok1)
	
	Runtime:removeEventListener("enterFrame",icebok2)

	Runtime:removeEventListener("enterFrame",icebok3)

	Runtime:removeEventListener("enterFrame",icebok4)

	Runtime:removeEventListener("enterFrame",icebok5)

	Runtime:removeEventListener("enterFrame",icebok6)

	animation:removeEventListener("collision", onCollision)


	physics.removeBody(peng, "dynamic", {density=.18, bounce=0.1, friction=.5, radius=55})
	



	end

end

function scene:destroy( event )
     local sceneGroup = self.view


     -- put code here if you have things you need to remove that you created in create scene that does NOT go into the sceneGroup)

end




-- these must be the last 5 lines in the file
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene