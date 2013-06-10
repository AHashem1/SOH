package Choose
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import Choose.QuestionManager_Choose;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.PickerList;
	import feathers.controls.Screen;
	import feathers.data.ListCollection;
	import feathers.skins.StandardIcons;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.textures.Texture;
	
	
	public class Question_Choose extends Screen implements IQuestion
	{
		private var list1:PickerList = new PickerList();
		private var list2:PickerList = new PickerList();
		private var list3:PickerList = new PickerList();
		
		private var selected1:PickerList;
		private var selected2:PickerList;
		private var selected3:PickerList;
		
		public static var true1:String;
		public static var true2:String;
		public static var true3:String;
		
		public static var s1:String;
		public static var s2:String;
		public static var s3:String;
		
		public var ans1:String = ".......";
		public var ans2:String = ".......";
		public var ans3:String = ".......";
		public var ans4:String = ".......";
		
		private var header:Header;
		private var label:Label= new Label();
		private var scorelabel:Label;
		private var submitBtn:Button = new Button();
		private var backButton:Button;
		
		public static var L:String;
		
		private var groceryList:ListCollection = new ListCollection();
		private var groceryList2:ListCollection = new ListCollection();
		private var groceryList3:ListCollection = new ListCollection();
		
		private var phrase0:Label = new Label();
		private var phrase1:Label = new Label();
		private var phrase2:Label = new Label();
		private var phrase3:Label = new Label();
		
		private var myXML:XML;
		
		private static const GAME_LIST:String = "gamesList";
		
		private static var obj:QuestionManager_Choose=new QuestionManager_Choose();
		//private var textureAtlas:Object;
		
		override protected function draw():void
		{
			header.width = actualWidth;
			label.y = header.height +10;
			label.x = 80;
			list1.x = 150;
			list1.y = 80;
			list2.x = 340;
			list2.y = 80;
			list3.x = 30;
			list3.y = 125;
		}
		
		override protected function initialize():void
		{
			header = new Header();
			header.title = "Choose";
			addChild(header);
			
			//list
			list1.labelField = "text";
			
			list1.listProperties.@itemRendererProperties.labelField = "text";
			list1.listProperties.@itemRendererProperties.iconSourceField = "thumbnail";

			var textureAtlas:Object;
			
			groceryList = new ListCollection(
				[
					{ text: ans1, thumbnail:  "milk" },
					{ text: ans2, thumbnail:  "eggs"  },
					{ text: ans3, thumbnail: "bread" },
					{ text: ans4, thumbnail: "chicken" },
				]);
			list1.dataProvider = groceryList;
			list1.addEventListener( starling.events.Event.CHANGE, list_changeHandler1 );
			//this.addChild( list1 );
			
			list2.labelField = "text";
			
			list2.listProperties.@itemRendererProperties.labelField = "text";
			list2.listProperties.@itemRendererProperties.iconSourceField = "thumbnail";
			
			list2.dataProvider = groceryList;
			list2.addEventListener( starling.events.Event.CHANGE, list_changeHandler2 );
			//this.addChild( list2 );
			
			list3.labelField = "text";
			
			list3.listProperties.@itemRendererProperties.labelField = "text";
			list3.listProperties.@itemRendererProperties.iconSourceField = "thumbnail";
			
			list3.dataProvider = groceryList;
			list3.addEventListener( starling.events.Event.CHANGE, list_changeHandler3 );
			//this.addChild( list3 );
			//list end
			
			submitBtn.x= 180;
			submitBtn.y= 170;
			submitBtn.label = "Submit" ;
			this.addChild(submitBtn);
			submitBtn.addEventListener(starling.events.Event.TRIGGERED, onSubmit);
			
			backButton = new Button();
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
		}
		
		public function Question_Choose()
		{
			super();
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(GAME_LIST);
		}
		
		private function list_changeHandler1( event:starling.events.Event ):void
		{
			//var list:PickerList = PickerList( event.currentTarget );
			//trace( "selectedIndex:", list.selectedItem.text );
			selected1 = PickerList (event.currentTarget);
			s1 = selected1.selectedItem.text;
		}
		
		private function list_changeHandler2( event:starling.events.Event ):void
		{
			//var list:PickerList = PickerList( event.currentTarget );
			//trace( "selectedIndex:", list.selectedItem.text );
			selected2 = PickerList (event.currentTarget);
			s2 = selected2.selectedItem.text;
		}
		
		private function list_changeHandler3( event:starling.events.Event ):void
		{
			//var list:PickerList = PickerList( event.currentTarget );
			//trace( "selectedIndex:", list.selectedItem.text );
			selected3 = PickerList (event.currentTarget);
			s3 = selected3.selectedItem.text;
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			switch(L)
			{
				case "2":
					if(s1==true1)
						obj.checkscore(true);
					else
						obj.checkscore(false);
					break;
				
				case "3":
					if(s1==true1 && s2==true2)
						obj.checkscore(true);
					else
						obj.checkscore(false);
					break;
				
				case "4":
					if(s1==true1 && s2==true2 && s3==true3)
						obj.checkscore(true);
					else
						obj.checkscore(false);
					break;
			}
			//obj.checkscore(B);
		}
		
		public function processXML(e:flash.events.Event):void
		{
			myXML = new XML(e.target.data);
			var length:Number = myXML.Questiontype.length();
			for ( var i:int=0;i<length;i++)
			{
				if (myXML.Questiontype[i].@TYPE=="Choose")
				{
					var ql:Number = myXML.Questiontype[i].QuestionHeader.length();
					var QRN:int= randomRange(0,ql);
					
					var q2:Number = myXML.Questiontype[i].QuestionHeader[QRN].QuestionC.length();
					var randph:int = randomRange(0,q2);
					L =  myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].@nop;
					
					ans1= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].answer1[0];
					ans2= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].answer1[1];
					ans3= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].answer1[2];
					ans4= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].answer1[3];
					
					groceryList= new ListCollection(
						[
							{ text: ans1 , thumbnail:  "milk" },
							{ text: ans2 , thumbnail:  "eggs"  },
							{ text: ans3 , thumbnail: "bread" },
							{ text: ans4 , thumbnail: "chicken" },
						]);
					
					trace (myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].@nop);
					trace(L);
					switch (L)
					{
						case "2":
							//trace ("2");
							phrase0.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[0].@Text;
							phrase0.x = 30;
							phrase0.y = 80;
							this.addChild(phrase0);
							
							list1.x = 150;
							list1.y = 80;
							list1.dataProvider = groceryList;
							this.addChild(list1);
							
							true1 = myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[0].@ans;
							
							phrase1.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[1].@Text;
							phrase1.x = 240;
							phrase1.y = 80;
							this.addChild(phrase1);
							break;
						case "3":
							//trace ("3");
							phrase0.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[0].@Text;
							phrase0.x = 30;
							phrase0.y = 80;
							this.addChild(phrase0);
							
							list1.x = 150;
							list1.y = 80;
							list1.dataProvider = groceryList;
							this.addChild(list1);
							
							true1 = myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[0].@ans;
							
							phrase1.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[1].@Text;
							phrase1.x = 240;
							phrase1.y = 80;
							this.addChild(phrase1);
							
							list2.x = 340;
							list2.y = 80;
							list2.dataProvider = groceryList;
							this.addChild(list2);
							
							true1 = myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[1].@ans;
							
							phrase2.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[2].@Text;
							phrase2.x = 430;
							phrase2.y = 80;
							this.addChild(phrase2);
							
							break;
						case "4":
							//trace ("4");
							phrase0.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[0].@Text;
							phrase0.x = 30;
							phrase0.y = 80;
							this.addChild(phrase0);
							
							list1.x = 150;
							list1.y = 80;
							list1.dataProvider = groceryList;
							this.addChild(list1);
							
							true1 = myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[0].@ans;
							
							phrase1.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[1].@Text;
							phrase1.x = 250;
							phrase1.y = 80;
							this.addChild(phrase1);
							
							list2.x = 340;
							list2.y = 80;
							list2.dataProvider = groceryList;
							this.addChild(list2);
							
							true1 = myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[1].@ans;
							
							phrase2.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[2].@Text;
							phrase2.x = 430;
							phrase2.y = 80;
							this.addChild(phrase2);
							
							list3.x = 30;
							list3.y = 125;
							list3.dataProvider = groceryList;
							this.addChild(list3);
							
							true1 = myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[2].@ans;
							
							phrase3.text= myXML.Questiontype[i].QuestionHeader[QRN].QuestionC[randph].phrase[3].@Text;
							phrase3.x = 140;
							phrase3.y = 125;
							this.addChild(phrase3);
							
							break;
					}
				}
			}
		}
		
		public function randomRange(max:Number, min:Number=1):Number
		{
			return Math.random() * (max - min) + min;
		}
	}
}