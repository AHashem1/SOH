package	BasicCount
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.events.Event;
	
	public class Question_BasicCount extends feathers.controls.Screen implements IQuestion
	{
		private var header:Header;
		private var bg:Image;
		private var apple:Image;
		//private var Btn1:Button;
		private var Btn1:Button;
		private var Btn2:Button;
		private var Btn3:Button;
		public var randomNumber :int = randomRange(11,1);
		public var flag:Boolean=false;
		public static var cont1height : int;
		public static var cont1width : int;
		private var scorelabel:Label;
		private var backButton:Button = new Button();
		
		private static var obj:QuestionManager_BasicCount=new QuestionManager_BasicCount();

		
		private static const GAME_LIST:String = "gamesList";
		
		//public static var container:ScrollContainer;
		//public static var container1:ScrollContainer;
		
		public function Question_BasicCount()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function  onAddedToStage (event:starling.events.Event):void
		{
			drawScreen1();
			//this.addEventListener( starling.events.Event.TRIGGERED, onSubmit );
			
		}
		override protected function draw():void
		{
			header.width = actualWidth;
			//label.y = header.height +10;
			//label.x = 80;
			//container.width = actualWidth;
			//container1.width = actualWidth;
		}
		private function drawScreen1():void
		{
			header = new Header();
			
			header.title = "Count";
			addChild(header);
			
			backButton = new Button();
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			//Main1.nav.clearScreen();
			// el random numbers
			var randomNumber2 :int = randomRange(11,1);
			randomNumber2=Compare2(randomNumber2,randomNumber);
			var randomNumber3 :int = randomRange(11,1);
			randomNumber3=Compare3(randomNumber3,randomNumber2,randomNumber);
			var rn :int = randomRange(4,1);
			var rn1:int  ;//=(rn%3)+1;
			var rn2:int;// = ((rn+1)%3)+1;
			var rn3:int ;//= ((rn+2)%3)+1;
			switch(rn)
			{
				case 1:
					rn1 = randomNumber;
					rn2 = randomNumber2;
					rn3 = randomNumber3;
					break;
				case 2:
					rn1 = randomNumber2;
					rn2 = randomNumber3;
					rn3 = randomNumber;
					break;
				case 3:
					rn1 = randomNumber3;
					rn2 = randomNumber;
					rn3 = randomNumber2;
					break;
			}
			
			var container:ScrollContainer = new ScrollContainer();
			container.x=150;
			container.y=390;
			this.addChild( container );
			
			var xPosition:Number =150;
			
			Btn1 = new Button();
			Btn1.label = randomNumber.toString();// rn1.toString();
			Btn1.x=xPosition;
			//Btn2.y = 390;
			Btn1.width = 80;
			Btn1.addEventListener( starling.events.Event.TRIGGERED, onSubmit );
			container.addChild(Btn1);
			xPosition += Btn1.width + 10;
			/*Btn1 = new Button();
			Btn1.label = randomNumber.toString();// rn1.toString();
			Btn1.x=xPosition;
			//Btn1.y = 390;
			Btn1.width = 80;
			Btn1.addEventListener( starling.events.Event.TRIGGERED, onSubmit );
			container.addChild(Btn1);
			
			xPosition += Btn1.width + 10;
			*/
			Btn2 = new Button();
			Btn2.label = randomNumber2.toString();// rn2.toString();
			Btn2.x=xPosition;
			//Btn2.y = 390;
			Btn2.width = 80;
			Btn2.addEventListener( starling.events.Event.TRIGGERED, onSubmit );
			container.addChild(Btn2);
			xPosition += Btn2.width + 10;
			
			Btn3 = new Button();
			Btn3.label = randomNumber3.toString();// rn3.toString();
			Btn3.x=xPosition;
			//Btn3.y = 390;
			Btn3.width = 80;
			Btn3.addEventListener( starling.events.Event.TRIGGERED, onSubmit );
			container.addChild(Btn3);
			xPosition += Btn3.width + 10;
			
			scorelabel = new Label();
			scorelabel.text= QuestionManager_BasicCount.score.toString();
			scorelabel.x = xPosition + 10;
			scorelabel.y= 405;
			this.addChild(scorelabel);
			
			container.width = 500;
			container.height = 200;
			
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 10;
			container.layout = layout;
			
			//dh container yrsm feh el teffa7
			var container1:ScrollContainer = new ScrollContainer();
			container1.y=header.height + 70;
			container1.x = 30;
			container1.height=400;
			
			this.addChild(container1);
			cont1width = container1.width;
			cont1height = container1.height;
			
			//rsm el teffa7
			var xpos:int = 5;
			var ypos:int = 5;
			var h:int;
			
			
			for(h=0;h<(randomNumber);h++)
			{
				//drawapple();
				apple = new Image(Assets.getTexture("Apple"));
				if(randomNumber==1)
				{
					xpos=35;
					ypos=26;
					apple.x = xpos;
					apple.y = ypos;
					apple.scaleX=1/randomNumber*.7;
					apple.scaleY=1/randomNumber*.7;
				}
				else if (randomNumber==2)
				{
					apple.scaleX=1/randomNumber*.8;
					apple.scaleY=1/randomNumber*.8;
					apple.x = xpos;
					apple.y = ypos;
				}
				else
				{
					apple.scaleX=1/randomNumber*.9;
					apple.scaleY=1/randomNumber*.9;
					apple.x = xpos;
					apple.y = ypos;
				}
				container1.addChild(apple);
				var drawWay :int = randomRange(4,1);
				switch(drawWay)
				{
					
					case 1://&&(xpos += 70/(randomNumber*.22)+apple.width)<container1.width)
						
						k= xpos + 55/(randomNumber*.22)+apple.width;
						if(k<250)
							xpos += 75/(randomNumber*.22);
						else
							ypos += apple.height;
						break;
					
					case 2:
						var k: int = (ypos + 70/(randomNumber*.22)+apple.height);
						if(k<cont1height){//container1.height)
							ypos += 70/(randomNumber*.22);
						}
						else
						{
							xpos +=apple.width;
						}
						break;
					
					case 3:
						xpos+= 55/(randomNumber*.22);
						ypos+= 55/(randomNumber*.22);
						break;	
				}
			}
			//			getrandomno();
		}
		
		public function getrandomno():void
		{
			randomNumber=randomRange(11,1);
		}
		public function randomRange(max:Number, min:Number=1):Number
		{
			return Math.random() * (max - min) + min;
		}
		public function initialize():void
		{
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
			
			this.visible = true;
			
		}
		public function Compare2(first:int,second:int):int
		{
			if(first==second)
			{
				first=randomRange(10,1);
				first=Compare2(first,second);
			}
			return first;
		}
		
		public function Compare3(first:int,second:int,Third:int):int
		{
			if(first==second||first==Third)
			{
				first=randomRange(10,1);
				first=Compare3(first,second,Third);
			}
			return first;
		}
		
		
		public function drawapple():void
		{
			apple = new Image(Assets.getTexture("Apple"));
			apple.scaleX=1/randomNumber*20;
			apple.scaleY=1/randomNumber*20;
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(GAME_LIST);
		}
		
		public function processXML(e:flash.events.Event):void 
		{
			
		}
		
		public function onSubmit( event:starling.events.Event ):void
		{
			var buttonClicked:Button=event.target as Button;
			
			if((buttonClicked as Button )== Btn1 )
			{
				if( Btn1.label == randomNumber.toString())
				{
					obj.checkscore(true);
					
				}
				else
					obj.checkscore(false);
			}
			else if((buttonClicked as Button )== Btn2)
			{
				if( Btn2.label == randomNumber.toString())
					obj.checkscore(true);
				else
					obj.checkscore(false);
			}
			else if((buttonClicked as Button )== Btn3)
			{
				
				if( Btn3.label == randomNumber.toString())
					obj.checkscore(true);
				else
					obj.checkscore(false);
			}
		}
	}
	
}
