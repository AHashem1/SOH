package Choose
{
	import flash.events.Event;
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
	import feathers.controls.TextInput;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class QuestionBuilder_Choose extends Screen implements IBuilder
	{
		private var header:Header;
		private var label:Label= new Label();
		private var submitBtn:Button = new Button();
		private var backButton:Button = new Button();
		private var slider:Slider ;
		private var sliderlabel:Label;
		
		private var nophrases:int ;
		
		private var phrase0:TextInput = new TextInput();
		private var phrase1:TextInput = new TextInput();
		private var phrase2:TextInput = new TextInput();
		private var phrase3:TextInput = new TextInput();
		
		public var Category:TextInput = new TextInput();
		
		private var answer0:TextInput = new TextInput();
		private var answer1:TextInput = new TextInput();
		private var answer2:TextInput = new TextInput();
		private var answer3:TextInput = new TextInput();
		
		public var myXML:XML;
		private var loader2:URLLoader;
		
		private static const BL:String = "Blist";
		private static const ChooseQB:String = "ChooseQB";
		
		public function QuestionBuilder_Choose()
		{
			super();
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
		}
		
		override protected function initialize():void
		{
			header = new Header();
			header.title = "Choose Builder";
			addChild(header);
			
			Category.text = "Question Category is ...";
			Category.width = 200;
			Category.x = 350;
			Category.y = 80;
			Category.setFocus();
			this.addChild(Category);
			
			submitBtn.x= 180;
			submitBtn.y= 400;
			submitBtn.label = "Submit" ;
			this.addChild(submitBtn);
			submitBtn.addEventListener(starling.events.Event.TRIGGERED, onSubmit);
			
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			sliderlabel = new Label();
			sliderlabel.text = "1";
			this.addChild(sliderlabel);
			
			slider= new Slider();
			slider.minimum = 1;
			slider.maximum = 3;
			slider.value = 1;
			slider.step = 1;
			slider.addEventListener( starling.events.Event.CHANGE, slider_changeHandler );
			this.addChild( slider );
			
			phrase0.text = "First Part is ...";
			phrase0.width = 300;
			phrase0.height = 40;
			phrase0.x = 30;
			phrase0.y = 150;
			phrase0.setFocus();
			this.addChild(phrase0);
			
			answer0.text = "Answer of First Part is ...";
			answer0.width = 200;
			answer0.height = 40;
			answer0.x = 350;
			answer0.y = 150;
			answer0.setFocus();
			this.addChild(answer0);
			
			phrase1.text = "Second Part is ...";
			phrase1.width = 300;
			phrase1.height = 40;
			phrase1.x = 30;
			phrase1.y = 200;
			phrase1.setFocus();
			phrase1.visible=true;
			this.addChild(phrase1);
			
			answer1.text = "Answer of Second Part is ...";
			answer1.width = 200;
			answer1.height = 40;
			answer1.x = 350;
			answer1.y = 200;
			answer1.setFocus();
			this.addChild(answer1);
			
			phrase2.text = "Third Part is ...";
			phrase2.width = 300;
			phrase2.height = 40;
			phrase2.x = 30;
			phrase2.y = 250;
			phrase2.setFocus();
			phrase2.visible=false;
			this.addChild(phrase2);
			
			answer2.text = "Answer of Third Part is ...";
			answer2.width = 200;
			answer2.height = 40;
			answer2.x = 350;
			answer2.y = 250;
			answer2.setFocus();
			this.addChild(answer2);
			
			phrase3.text = "Forth Part is ...";
			phrase3.width = 300;
			phrase3.height = 40;
			phrase3.x = 30;
			phrase3.y = 300;
			phrase3.setFocus();
			phrase3.visible=false;
			this.addChild(phrase3);
			
			answer3.text = "Random Answer is ...";
			answer3.width = 200;
			answer3.height = 40;
			answer3.x = 350;
			answer3.y = 300;
			answer3.setFocus();
			this.addChild(answer3);
			
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("oman3d.xml"));
			myLoader.addEventListener(flash.events.Event.COMPLETE, processXML);
			
		}
		
		public function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(BL);
		}
		
		public function onSubmit(e:starling.events.Event):void
		{
			myXML = new XML(loader2.data);
			var lenght:Number=myXML.Questiontype[6].QuestionHeader.length();
			
			var newcategory:Boolean=true;
			var equationlength:Number=myXML.Questiontype[6].QuestionHeader[i].equation.length();
			var Ql:Number = myXML.Questiontype[6].QuestionHeader[i].QuestionC.length();
			var sliderv:int = slider.value+1;
			for(var i:int=0;i<lenght;i++)
			{
				if(myXML.Questiontype[6].QuestionHeader[i].@Text == Category.text)
				{	
					trace(myXML.Questiontype[6].QuestionHeader[i].QuestionC.length());
					myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql]="";
					myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].@nop = sliderv ;
					switch(sliderv.toString())
					{
						case "2":
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[0]="";
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[0].@Text=phrase0.text;
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[0].@ans=answer0.text;
							
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[1]="";
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[1].@Text=phrase1.text;
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[1].@ans=answer1.text;
							break;
						case "3":
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[0]="";
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[0].@Text=phrase0.text;
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[0].@ans=answer0.text;
							
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[1]="";
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[1].@Text=phrase1.text;
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[1].@ans=answer1.text;
							
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[2]="";
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[2].@Text=phrase2.text;
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[2].@ans=answer2.text;
							break;
						case "4":
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[0]="";
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[0].@Text=phrase0.text;
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[0].@ans=answer0.text;
							
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[1]="";
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[1].@Text=phrase1.text;
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[1].@ans=answer1.text;
							
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[2]="";
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[2].@Text=phrase2.text;
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[2].@ans=answer2.text;
							
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[3]="";
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[3].@Text=phrase3.text;
							myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].phrase[3].@ans=answer3.text;
							break;
					}
					
					myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].answer1[0]= "";
					myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].answer1[0]= answer0.text;
					
					myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].answer1[1]= "";
					myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].answer1[1]= answer1.text;
					
					myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].answer1[2]= "";
					myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].answer1[2]= answer2.text;
					
					myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].answer1[3]= "";
					myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].answer1[3]= answer3.text;
					
					newcategory=false;
					
				}
				if(!newcategory)
					break;
			}
			
			
			if(newcategory)
			{	
				myXML.Questiontype[6].QuestionHeader[lenght]="";
				myXML.Questiontype[6].QuestionHeader[lenght].@Text=Category.text;
				
				myXML.Questiontype[6].QuestionHeader[length].QuestionC[0]="";
				//myXML.Questiontype[6].QuestionHeader[i].QuestionC[Ql].@nop ="";
				myXML.Questiontype[6].QuestionHeader[length].QuestionC[0].@nop = sliderv ;
				
				switch(sliderv.toString())
				{
					case "2":
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[0]="";
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[0].@Text=phrase0.text;
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[0].@ans=answer0.text;
						
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[1]="";
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[1].@Text=phrase1.text;
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[1].@ans=answer1.text;
						break;
					case "3":
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[0]="";
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[0].@Text=phrase0.text;
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[0].@ans=answer0.text;
						
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[1]="";
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[1].@Text=phrase1.text;
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[1].@ans=answer1.text;
						
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[2]="";
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[2].@Text=phrase2.text;
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[2].@ans=answer2.text;
						break;
					case "4":
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[0]="";
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[0].@Text=phrase0.text;
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[0].@ans=answer0.text;
						
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[1]="";
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[1].@Text=phrase1.text;
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[1].@ans=answer1.text;
						
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[2]="";
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[2].@Text=phrase2.text;
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[2].@ans=answer2.text;
						
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[3]="";
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[3].@Text=phrase3.text;
						myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].phrase[3].@ans=answer3.text;
						break;
				}	
				myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].answer1[0]= "";
				myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].answer1[0]= answer0.text;
				
				myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].answer1[1]= "";
				myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].answer1[1]= answer1.text;
				
				myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].answer1[2]= "";
				myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].answer1[2]= answer2.text;
				
				myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].answer1[3]= "";
				myXML.Questiontype[6].QuestionHeader[i].QuestionC[0].answer1[3]= answer3.text;
			}
			
			var file:File = File.applicationStorageDirectory.resolvePath("data.xml");
			var fileStream:FileStream=new FileStream();
			fileStream.open(file, FileMode.APPEND);
			fileStream.writeObject(myXML.toString());
			fileStream.close();
			trace("Data Have Been Saved ");
			trace(file.nativePath);
		}
		
		public function processXML(e:flash.events.Event):void
		{
			loader2 = URLLoader(e.target);
		}
		
		private function slider_changeHandler( event:starling.events.Event ):void
		{
			var slider:Slider = Slider( event.currentTarget );
			sliderlabel.text=slider.value.toString();
			nophrases=slider.value;
			
			switch(nophrases)
			{
				case 1:
					phrase1.visible=true;
					phrase2.visible=false;
					phrase3.visible=false;
					break;
				case 2:
					phrase1.visible=true;
					phrase2.visible=true;
					phrase3.visible=false;
					break;
				case 3:
					phrase1.visible=true;
					phrase2.visible=true;
					phrase3.visible=true;
					break;
			}
		}
	}
}