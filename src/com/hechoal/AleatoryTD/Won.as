﻿package com.hechoal.AleatoryTD {
	import flash.display.*;
	import com.hechoal.*;
	import flash.events.*;
	import flash.net.*;
	import mochi.as3.*;
	import flash.text.*;
	public class Won extends MovieClip{
		
		public var backBut:BackButton = new BackButton();
		private var stg:Stage;
		private var menuScreen:MovieClip;
		private var kongregate:* = null;
		private var statsTf:TextFormat = new TextFormat();
		private var tf:TextField = new TextField();
		
		public function Won() {
			kongregate = null;			
			statsTf.font = "Arial";
			statsTf.size = 12;
			statsTf.color = 0xffffff;
			tf.x = 130;
			tf.y = 200;
			tf.selectable = false;
			tf.autoSize = TextFieldAutoSize.LEFT;			
			addEventListener(Event.ADDED_TO_STAGE,doAddLinkEvent);
		}
		
		private function doAddLinkEvent(e:Event){
			removeEventListener(Event.ADDED_TO_STAGE,doAddLinkEvent);
			Jalp.addGameOverButtons(this);
			addStartButton(140,310);
		}
		
		public function setKong(kong:*){
			kongregate = kong;
		}

		public function something(level:uint, lives:int, score:Number, kills:uint, bosses:uint){
			tf.multiline = true;
			tf.text = "Level reached: " + level
					+"\nLives left: " + lives
					+"\nScore: " + score
					+"\nKills: " + kills
					+"\nBosses killed: " +bosses;
			
			tf.setTextFormat(statsTf);
			addChild(tf);	
			
			if(kongregate == null) return;
			kongregate.stats.submit("Score", score);
			kongregate.stats.submit("KillsTotal", kills); 
			kongregate.stats.submit("Kills", kills); 
		}
		
		private function addStartButton(xx:uint, yy:uint){
			backBut.x = xx;
			backBut.y = yy;
			addChild(backBut);
		}
		
		
	}
	
}