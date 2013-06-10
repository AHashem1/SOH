package BasicCount
{
	import flash.events.Event;
	import flash.events.GeolocationEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	import feathers.controls.Slider;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	
	public class QuestionBuilder_BasicCount extends feathers.controls.Screen implements IBuilder
	{
		private var header:Header;
		private var label:Label;
		private var sliderlabel:Label;
		private var backButton:Button;
		private var submitButton:Button;
		private var slider:Slider ;
		public var myXML:XML;
		private var loader2:URLLoader;
		private var my_txt:Label;
		private static const BL:String = "Blist";		
		public function QuestionBuilder_BasicCount()
		{
		
		}
		
		override protected function draw():void
		{
			header.width = actualWidth;
			label.y = header.height +20;
			label.x = 20;
			
			slider.y=header.height+20;	
			slider.x=label.width+100;
			
			
			sliderlabel.y=header.height+20;
			sliderlabel.x=slider.width+100;
			
			submitButton.y=header.height+60;
			submitButton.x=20;
			
			
		}
		override protected function initialize():void
		{
			
			header = new Header();
			header.title = "Builder";
			this.addChild(header);
			
			backButton = new Button();
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			label = new Label();
			label.text = "Rang input";
			this.addChild(label);
			
			sliderlabel = new Label();
			sliderlabel.text = "5";
			this.addChild(sliderlabel);
			
			slider= new Slider();
			slider.minimum = 1;
			slider.maximum = 10;
			slider.value = 5;
			slider.step = 1;
			slider.addEventListener( starling.events.Event.CHANGE, slider_changeHandler );
			this.addChild( slider );
			
			submitButton=new Button();
			submitButton.label="Save";
			submitButton.addEventListener(starling.events.Event.TRIGGERED, onSubmit);
			this.addChild(submitButton);
			
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
			
		}
		
		private function onGeoUpdate(e:GeolocationEvent):void{
			my_txt.text = "My Latitude is "+e.latitude+" and my Longitude is "+e.longitude;
			trace(e.latitude);
		}
		public function processXML(e:flash.events.Event):void 
		{
			loader2 = URLLoader(e.target);	
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(BL);	
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			myXML = new XML(loader2.data);
			var lenght:Number=myXML.Questiontype.RandomRange.length();
			myXML.Questiontype[0].RandomRange[lenght]=slider.value;
			
			
			
			var file:File = File.applicationStorageDirectory.resolvePath("data.xml");
			var fileStream:FileStream=new FileStream();
			fileStream.open(file, FileMode.APPEND);
			fileStream.writeObject(myXML.toString());
			fileStream.close();
			trace("Data Have Been Saved ");
			trace(file.nativePath); // you can find where it is stored.
			
		}
		
		private function slider_changeHandler( event:starling.events.Event ):void
		{
			var slider:Slider = Slider( event.currentTarget );
			sliderlabel.text=slider.value.toString();
		}
		
		private   function fileClosed(event:flash.events.Event):void { 
			
			trace("File Saved");  
			
		} 
	}
}


