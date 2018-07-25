﻿
package  {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	import flash.system.System;
	import Utilities;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Sprite;
	
	public class Main extends MovieClip {
		
		private var left: Boolean = false;
		private var right: Boolean = false;
		private var jUp:Boolean = false;
		private var up:Boolean = false;
		private var down:Boolean = false;
		//private var jumpSet:Boolean = false;
		private var util:Utilities;
		
		//private var jmp = 30;
		
		private var ply:Player = new Player();
		private var map:Map = new Map();
		
		private var tileSet:Array = [[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
									 [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]];
		
		//private var commands:Array = new Array();
		
		public function Main() {
			stage.addEventListener(Event.ENTER_FRAME, globalLoop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyRelease);
			//forwards.addEventListener(MouseEvent.CLICK, fwdCom);
			//execute.addEventListener(MouseEvent.CLICK, runCommands);
			setupPly();
			stop();
			util = new Utilities();
			init();
		}
		
		private function init(e:Event = null):void {
			lConstruct(tileSet);
			jUp = true;
		}
		asd
		 
		 
		private function spawnDoor():void {
			
		}
		
		private var jumping:Boolean = false;
		private var canLeft:Boolean = true;
		private var canRight:Boolean = true;
		private var canJump:Boolean = true;
		
		private function keyPress(k:KeyboardEvent):void {
			if (k.keyCode == Keyboard.SPACE && /*getTile(ply.x,ply.y+2) == 1 &&*/ sideScroll == true) {
				ply.jumpStart(20);
				//jUp = true;
				jumping = true;
			}
			if (k.keyCode == Keyboard.A && canLeft == true) {
				left = true;
			}
			if (k.keyCode == Keyboard.D && canRight == true) {
				right = true;
			}
			if (k.keyCode == Keyboard.W && sideScroll == false) {
				up = true;
			}
			if (k.keyCode == Keyboard.S && sideScroll == false) {
				down = true;
			}
		}
		
		private function keyRelease(k:KeyboardEvent):void {
			if (k.keyCode == Keyboard.SPACE) {
				ply.jumpStop();
				jumping = false;
			}
			
			if (k.keyCode == Keyboard.A) {
				left = false;
				tLeft = false;
				ply.stopPly();
			}
			
			if (k.keyCode == Keyboard.D) {
				right = false;
				tRight = false;
				ply.stopPly();
			}
			
			if (k.keyCode == Keyboard.W) {
				up = false;
				tUp = false;
				ply.stopPly();
			}
			
			if (k.keyCode == Keyboard.S) {
				down = false;
				tDown = false;
				ply.stopPly();
			}
		}

		
		
		private var topDown:Boolean = false;
		private var sideScroll:Boolean = true;
		
		private var dly:uint = 2000;
		private var rpt:uint = 5;
		private var timeC:Timer = new Timer(dly,rpt);
		
		private var removeRenders:Boolean = false;
		
		private var doorList:Array = new Array();
		
		private var tLeft:Boolean = false;
		private var tRight:Boolean = false;
		private var tUp:Boolean = false;
		private var tDown:Boolean = false;
		
		function endTime(e:TimerEvent):void {
			var door:DebugDoor = new DebugDoor();
			doorList.push(door);
			door.x = ply.x + util.randNum(-500,500);
			if (ply.x == Math.abs(door.x)) {
				door.x = ply.x + util.randNum(-500,500);
			}
			door.y = ply.y + util.randNum(-400,400);
			if (ply.y == Math.abs(door.y)) {
				door.y = ply.y + util.randNum(-400,400);
			}
			addChild(door);
			dly = util.randNum(1000,3000);
			trace(dly);
		}
		
		
		
		
		private var gndArray:Array = new Array();
		
		private function lConstruct(layout:Array) {
			if (tiles != null) {
				removeChild(tiles);
			}
			var tiles:MovieClip = new MovieClip();
			for (var q:int=0;q<layout[0].length;q++) {
				for (var s:int=0;s<layout.length;s++) {
					var curTile:Tile = new Tile();
					curTile.x = q*40;
					curTile.y = s*40;
					curTile.name = q+"-"+s;
					tiles.addChild(curTile);
					gndArray.push(curTile);
					curTile.gotoAndStop(int(layout[s][q])+1);
				}
			}
				addChild(tiles);
		}
		
		//private var gameLay:Array = new Array();
		
		public function getTile(xs,ys){
			if(ys>0 && xs>0 && (tileSet[0].length)*40>xs && (tileSet.length)*40>ys){
				return tileSet[Math.floor(ys/40)][Math.floor(xs/40)]
			} else {
				return (1);
			}
		}
		
		private var gndDebug:Boolean = false;
		
		private function globalLoop(e:Event):void {
			
			
			
			trace (ply.gravSpeed);
			//trace (ply.isJumping);
			
			if (sideScroll == true) {
				
				for (var ss:int=0;ss<gndArray.length;ss++) {
					if (getTile(ply.x,ply.y+1) == 1 || getTile(ply.x-29,ply.y+1) == 1 || getTile(ply.x+29,ply.y+1) == 1){
						//ply.y -= 1;
						ply.isJumping = false;
						//jUp = false;
						if (ply.hitTestObject(gndArray[ss])){
							ply.y = gndArray[ss].y;
							if (jumping == false) {
								ply.gravSpeed = 0;
								jUp = false;
							} else {
								jUp = true;
							}
							
							if (ply.gravSpeed >= 0) {
								
								jUp = false;
							}
						}
					}
					
					if (getTile(ply.x,ply.y+1) == 0){
						jUp = true; 
					}
					
					
					trace (ply.gravSpeed);
				
					if (getTile(ply.x-31,ply.y-2) == 1 || getTile(ply.x-31,ply.y-23) == 1) {
						if (gndArray[ss].hitTestObject(ply)){
							ply.x += 5;
							ply.x = (gndArray[ss].x + 75);
							ply.curSpeedX = 0;
							//canLeft = false;
							//trace ("hi")
						}
					} //else {
						//canLeft = true;
					//}
					trace (ply.currentFrame);
				
					if (getTile(ply.x+31,ply.y-2) == 1 || getTile(ply.x+31,ply.y-23)){
						if (gndArray[ss].hitTestObject(ply)){
							ply.x -= 5;
							ply.x = (gndArray[ss].x - 35);
							ply.curSpeedX = 0;
							//canRight = false;
							//trace ("hi")
						}
					} //else {
						//canRight = true;
					//}
				
					if (getTile(ply.x,ply.y-52) == 1 || getTile(ply.x-29,ply.y-52) == 1 || getTile(ply.x+29,ply.y-52) == 1){
						ply.gravSpeed = 0;
					}
				}
					if (jUp == true) {
						if (ply.gravSpeed > ply.gravMax) {
							ply.gravSpeed = ply.gravMax;
						} else {
							ply.gravSpeed += ply.gravAcc;
						}
						ply.y += ply.gravSpeed;
				}
				
				if (left == true) {
					ply.left(5);
				}
				
				if (right == true) {
					ply.right(5);
				}
				
				for (var h:int;h<gndArray.length;h++){
					//colS(ply,gndArray[h])
				}
				
				
				for (var i:int;i<doorList.length;i++) {
					if (removeRenders == true) {
						removeChild(doorList[i]);
						doorList.removeAt(i);
						trace (doorList);
						if (doorList.length <= 0) {
							removeRenders == false;
						}
					}
				}
				
				if (ply.hitTestObject(door)) {
					gotoAndStop(2);
					topDown = true;
					sideScroll = false;
					addChild(map);
					setChildIndex(map,0);
					trace ("hi");
					dly = util.randNum(5000,15000);
					
					if (doorList.length < 1) {
						timeC.start();
						timeC.addEventListener(TimerEvent.TIMER, endTime);
					}
				}
				
			} else if (topDown == true) {
				
				for (var k:int;k<doorList.length;k++) {
					if (ply.hitTestObject(doorList[k])) {
						gotoAndStop(1);
						topDown = false;
						sideScroll = true;
						removeChild(map);
						//doorList[i].x = 50000;
						removeRenders = true;
						timeC.reset();
						timeC.stop();
					}
					
					if (tLeft == true) {
						doorList[k].left(7);
					}
					
					if (tRight == true) {
						doorList[k].right(7);
					}
					
					if (tUp == true) {
						doorList[k].up(7);
					}
					
					if (tDown == true) {
						doorList[k].down(7);
					}
				}
				
				if (left == true) {
					if (ply.x >= 120) {
						ply.left(7);
					} else {
						map.x += 7;
						ply.left(0);
						tLeft = true;
					}
				}
				if (right == true) {
					if (ply.x <= 1180) {
						ply.right(7);
					} else {
						map.x -= 7;
						ply.right(0);
						tRight = true;
					}
				}
				if (up == true) {
					if (ply.y >= 100) {
						ply.up(7);
					} else {
						map.y += 7;
						ply.up(0);
						tUp = true;
					}
				}
				if (down == true) {
					if (ply.y <= 640) {
						ply.down(7);
					} else {
						map.y -= 7
						ply.down(0);
						tDown = true;
					}
				}
			}
			
			ply.x += ply.curSpeedX;
			ply.y += ply.curSpeedY;
			
			
			
			
			
			
			
			
			//if (delayBool == true && commands.length != 0) {
				//dly = commands[0].exeTime;
				//trace(dly);
			//}
			
			//if (runComs == true) {
				//ckCom = true;
			//}
			
			
			/*if (ckCom == true) {
				ply.right();
				trace(debug)
				debug++;
			} else {
				ply.stopPly();
			}*/
			
			/*if (jumpCom == true) {
				ply.jumpStart(30);
				jumpCom = false;
			}*/
			
			/*private var ckCom:Boolean = false;
		private var jumpCom:Boolean = false;
		private var placeLocX:Number = 254;
		private var placeLocY:Number = 554;
		private var delayAdd:Number;
		
		private var delayBool:Boolean = false;
		
		private function fwdCom(e:MouseEvent):void {
			var forPlace:seqFor = new seqFor();
			forPlace.exeTime = Number(inputTest.text);
			forPlace.x = placeLocX;
			forPlace.y = placeLocY;
			addChild(forPlace);
			commands.push(forPlace);
			placeLocX += 100;
			trace (commands);
			delayBool = true;
		}
		
		private var runComs:Boolean = false;
		
		private function runCommands(e:MouseEvent):void {
			timeStart();
		}
		
		private function endCom(e:TimerEvent):void {
			ckCom = false;
			timeC.removeEventListener(TimerEvent.TIMER_COMPLETE, endCom);
			commands.shift();
			if (commands.length != 0) {
				timeStart();
			}
		}
		*/
		//private var dly:uint;
		//private var rpt:uint = 1;
		
		//private var timeD:Timer = new Timer(dlyC,rptC);
		//private var debug:Number = 0;
		
		//private function timeStart():void {
			//timeC.start();
			//timeC.addEventListener(TimerEvent.TIMER_COMPLETE, endCom);
			//ckCom = true;
			//trace (commands);
		//}
		}
		
		private function colS(colDefP:Object, colDefO:Object): void {
			if (colDefO.hitTestObject(colDefP)) {
				if (colDefP.x - colDefP.width / 2 <= colDefO.x + colDefO.width && colDefP.x + colDefP.width / 2 >= colDefO.x + colDefO.width && colDefP.curSpeedX < 0) {
					colDefP.x = colDefO.x + colDefO.width + 1 + colDefP.width / 2;
					colDefP.curSpeedX = 0;
					left = false;
				} else if (colDefP.x + colDefP.width / 2 >= colDefO.x && colDefP.x - colDefP.width / 2 <= colDefO.x && colDefP.curSpeedX > 0) {
					colDefP.x = colDefO.x - 1 - colDefP.width / 2;
					colDefP.curSpeedX = 0;
					right = false;
				} else {
					if (colDefP.y - colDefP.height < colDefO.y) {
						colDefP.y = colDefO.y; 
						colDefP.gravSpeed = 0;
					}
					
					if (colDefP.y > colDefO.y + colDefO.height && colDefP.gravSpeed < 0) {
						colDefP.y = colDefO.y + colDefO.height + colDefP.height;
						colDefP.gravSpeed = 0;
					}
				}
				//Local Handling
				colDefP.isJumping = false;
			}
		}
	}	
}
