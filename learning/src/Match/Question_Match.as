package Match
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import Match.QuestionManager_Match;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.PickerList;
	import feathers.controls.Radio;
	import feathers.controls.Screen;
	import feathers.controls.ScrollContainer;
	import feathers.core.ToggleGroup;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class Question_Match extends Screen implements IQuestion
	{
		private var header:Header;
		private var label:Label= new Label();
		private var submitBtn:Button = new Button();
		private var backButton:Button;
		
		private var selected1:PickerList;
		private var selected2:PickerList;
		private var selected3:PickerList;
		
		public static var s1:String;
		public static var s2:String;
		public static var s3:String;
		
		private var true1:String;
		private var true2:String;
		private var true3:String;
		
		private var container1:ScrollContainer = new ScrollContainer();
		private var container2:ScrollContainer = new ScrollContainer();
		private var container3:ScrollContainer = new ScrollContainer();
		
		private var phrase1:Label = new Label();
		private var phrase2:Label = new Label();
		private var phrase3:Label = new Label();
		
		private var list1:PickerList = new PickerList();
		private var list2:PickerList = new PickerList();
		private var list3:PickerList = new PickerList();
		
		private var group1:ToggleGroup = new ToggleGroup();
		private var radio3g1:Radio = new Radio();
		private var radio2g1:Radio = new Radio();
		private var radio1g1:Radio = new Radio();
		
		private var group2:ToggleGroup = new ToggleGroup();
		private var radio3g2:Radio = new Radio();
		private var radio2g2:Radio = new Radio();
		private var radio1g2:Radio = new Radio();
		
		private var group3:ToggleGroup = new ToggleGroup();
		private var radio3g3:Radio = new Radio();
		private var radio2g3:Radio = new Radio();
		private var radio1g3:Radio = new Radio();
		
		public var ans1:String = ".......";
		public var ans2:String = ".......";
		public var ans3:String = ".......";
		public var ans4:String = ".......";
		
		private var myXML:XML;
		
		private var groceryList:ListCollection = new ListCollection();
		
		private static var obj:QuestionManager_Match=new QuestionManager_Match();
		
		private static const GAME_LIST:String = "gamesList";
		
		public function Question_Match()
		{
			super();
		}
		
		override protected function draw():void
		{
			header.width = actualWidth;
			label.y = header.height +10;
			label.x = 250;
			container1.width = actualWidth;
			container2.width = actualWidth;
			container3.width = actualWidth;
			container1.height = 150;
			container2.height = 150;
			container3.height = 150;
			container1.y = header.height + 65;
			container2.y = header.height + container1.height + 85;
			container3.y = header.height + container1.height + container2.height + 95;
			submitBtn.y = header.height + container1.height + container2.height + container3.height + 105;
		}
		
		override protected function initialize():void
		{
			header = new Header();
			header.title = "Match";
			addChild(header);
			
			backButton = new Button();
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			container1.x=300;
			this.addChild(container1);
			
			var hlayout:HorizontalLayout = new HorizontalLayout();
			hlayout.gap = 0;
			//container1.layout = hlayout;
			
			var vlayout:VerticalLayout = new VerticalLayout();
			vlayout.gap = 20;
			container1.layout = vlayout;
			
			phrase1.text = "a";
			phrase1.x = 30;
			phrase1.y =  160;
			this.addChild(phrase1);
			/*
			radio1g1.label = "b";
			radio1g1.x=100;
			radio1g1.y = 10;
			radio1g1.toggleGroup = group1;
			container1.addChild(radio1g1);
			
			radio2g1.label = "b";
			radio2g1.x=100;
			radio2g1.y = 30;
			radio2g1.toggleGroup = group1;
			container1.addChild(radio2g1);
			
			radio3g1.label = "b";
			radio3g1.x=100;
			radio3g1.y = 50;
			radio3g1.toggleGroup = group1;
			container1.addChild(radio3g1);
			*/
			
			container2.layout = vlayout;
			container2.x = 300;
			container2.y = 500;
			this.addChild(container2);
			
			phrase2.text = "a";
			phrase2.x = 30;
			phrase2.y = 330;
			this.addChild(phrase2);
			/*
			radio1g2.label = "b";
			radio1g2.x=100;
			radio1g2.y = 10;
			radio1g2.toggleGroup = group2;
			container2.addChild(radio1g2);
			
			radio2g2.label = "b";
			radio2g2.x=100;
			radio2g2.y = 30;
			radio2g2.toggleGroup = group2;
			container2.addChild(radio2g2);
			
			radio3g2.label = "b";
			radio3g2.x=100;
			radio3g2.y = 50;
			radio3g2.toggleGroup = group2;
			container2.addChild(radio3g2);
			*/
			container3.layout = vlayout;
			container3.x = 300;
			container3.y = 1000;
			this.addChild(container3);
			
			phrase3.text = "a";
			phrase3.x = 30;
			phrase3.y = 500;
			this.addChild(phrase3);
			/*
			radio1g3.label = "b";
			radio1g3.x=100;
			radio1g3.y = 10;
			radio1g3.toggleGroup = group3;
			container3.addChild(radio1g3);
			
			radio2g3.label = "b";
			radio2g3.x=100;
			radio2g3.y = 30;
			radio2g3.toggleGroup = group3;
			container3.addChild(radio2g3);
			
			radio3g3.label = "b";
			radio3g3.x=100;
			radio3g3.y = 50;
			radio3g3.toggleGroup = group3;
			container3.addChild(radio3g3);
			*/
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
				]);
			list1.dataProvider = groceryList;
			list1.addEventListener( starling.events.Event.CHANGE, list_changeHandler1 );
			this.addChild( list1 );
			
			list2.labelField = "text";
			
			list2.listProperties.@itemRendererProperties.labelField = "text";
			list2.listProperties.@itemRendererProperties.iconSourceField = "thumbnail";
			
			list2.dataProvider = groceryList;
			list2.addEventListener( starling.events.Event.CHANGE, list_changeHandler2 );
			this.addChild( list2 );
			
			list3.labelField = "text";
			
			list3.listProperties.@itemRendererProperties.labelField = "text";
			list3.listProperties.@itemRendererProperties.iconSourceField = "thumbnail";
			
			list3.dataProvider = groceryList;
			list3.addEventListener( starling.events.Event.CHANGE, list_changeHandler3 );
			this.addChild(list3);
			
			submitBtn.x= 180;
			submitBtn.y= 1000;
			submitBtn.label = "Submit" ;
			this.addChild(submitBtn);
			submitBtn.addEventListener(starling.events.Event.TRIGGERED, onSubmit);
			//header.rightItems = new <DisplayObject>[submitBtn];
			
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
			
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(GAME_LIST);
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			
			if(s1 == true1 && s2 == true2 && s3 == true3)
				obj.checkscore(true);
			else
				obj.checkscore(false);
			/*
			if(selected.label==trueValue)
				obj.checkscore(true);
			else
				obj.checkscore(false);
			*/
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
		
		public function processXML(e:flash.events.Event):void
		{
			myXML = new XML(e.target.data);
			
			var length:Number = myXML.Questiontype.length();
			for (var i:int=0;i<length;i++)
			{
				
				if (myXML.Questiontype[i].@TYPE=="Match")
				{
					
					var ql:int = myXML.Questiontype[i].QuestionHeader.length();
					var QRN : int = randomRange(0,ql);
					var phrase:int = myXML.Questiontype[i].QuestionHeader[QRN].phrase.length();
					var RPH : int = randomRange (0,phrase);
					
					label.text= myXML.Questiontype[i].QuestionHeader[QRN].@Text;
					label.scaleX = 2;
					label.scaleY = 2;
					label.x = 250;
					this.addChild(label);
					
					switch(RPH)
					{
						case 0:
							phrase1.text = myXML.Questiontype[i].QuestionHeader[QRN].phrase[0].@Text;
							phrase2.text = myXML.Questiontype[i].QuestionHeader[QRN].phrase[1].@Text;
							phrase3.text = myXML.Questiontype[i].QuestionHeader[QRN].phrase[2].@Text;
							
							true1 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[0].@ans;
							true2 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[1].@ans;
							true3 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[2].@ans;
							break;
						case 1:
							phrase1.text = myXML.Questiontype[i].QuestionHeader[QRN].phrase[1].@Text;
							phrase2.text = myXML.Questiontype[i].QuestionHeader[QRN].phrase[2].@Text;
							phrase3.text = myXML.Questiontype[i].QuestionHeader[QRN].phrase[0].@Text;
							
							true1 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[1].@ans;
							true2 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[2].@ans;
							true3 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[0].@ans;
							break;
						case 2:
							phrase1.text = myXML.Questiontype[i].QuestionHeader[QRN].phrase[2].@Text;
							phrase2.text = myXML.Questiontype[i].QuestionHeader[QRN].phrase[0].@Text;
							phrase3.text = myXML.Questiontype[i].QuestionHeader[QRN].phrase[1].@Text;
							
							true1 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[2].@ans;
							true2 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[0].@ans;
							true3 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[1].@ans;
							break;
					}
					
					
					ans1 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[0].answer1[0];
					ans2 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[1].answer1[0];
					ans3 = myXML.Questiontype[i].QuestionHeader[QRN].phrase[2].answer1[0];
					
					groceryList= new ListCollection(
						[
							{ text: ans1 , thumbnail:  "milk" },
							{ text: ans2 , thumbnail:  "eggs"  },
							{ text: ans3 , thumbnail: "bread" },
						]);
					
					list1.dataProvider = groceryList;
					list2.dataProvider = groceryList;
					list3.dataProvider = groceryList;
					
					var RA : int = randomRange (0,phrase);
					
					
							container1.addChild(list1);
							
							container2.addChild(list2);
							
							container3.addChild(list3);
							
					/*
					label.text = myXML.Questiontype[i].QuestionHeader[QRN].@Text;
					radio1.label=myXML.Questiontype[i].QuestionHeader[QRN].answer[0];
					radio2.label=myXML.Questiontype[i].QuestionHeader[QRN].answer[1];
					radio3.label=myXML.Questiontype[i].QuestionHeader[QRN].answer[2];
					
					if(myXML.Questiontype[i].QuestionHeader[QRN].answer[0].@value=="True")
						trueValue=myXML.Questiontype[i].QuestionHeader[QRN].answer[0];
					else if(myXML.Questiontype[i].QuestionHeader[QRN].answer[1].@value=="True")
						trueValue=myXML.Questiontype[i].QuestionHeader[QRN].answer[1];
					else if(myXML.Questiontype[i].QuestionHeader[QRN].answer[2].@value=="True")
						trueValue=myXML.Questiontype[i].QuestionHeader[QRN].answer[2];
					*/
				}
			}
		}
		
		public function randomRange(max:Number, min:Number=1):Number
		{
			return Math.random() * (max - min) + min;
		}
	}
}