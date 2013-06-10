package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import BasicCount.Question_BasicCount;
	
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.List;
	import feathers.controls.Screen;
	import feathers.data.ListCollection;
	import feathers.skins.StandardIcons;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class BuilderList extends Screen
	{
		private var header:Header;
		private var list:List;
		private var loader1:URLLoader;
		private var num:Question_BasicCount;
		public var backButton:Button;
		private static const GAME_LIST:String = "gamesList";
		
		public function BuilderList()
		{
			super();
		}
		
		override protected function draw():void
		{
			
			header.width = actualWidth;
			
			list.y = header.height;
			list.width = actualWidth;
			list.height = actualHeight - header.height;
		}
		
		override protected function initialize():void
		{
			
			header = new Header();
			header.title = "Games Builders";
			addChild(header);
			
			backButton = new Button();
			backButton.label = "Back";
			backButton.addEventListener(starling.events.Event.TRIGGERED, onBack);
			header.leftItems = new <DisplayObject>[backButton];
			
			loader1 = new URLLoader(new URLRequest("Builders.json"));
			loader1.addEventListener(flash.events.Event.COMPLETE, done);
			list = new List();
			addChild(list);
		}
		
		private function onBack(e:starling.events.Event):void
		{
			Main1.nav.showScreen(GAME_LIST);	
		}
		
		
		protected function done (event:flash.events.Event):void
		{
			var obj:Object = JSON.parse(loader1.data);
			list.dataProvider = new ListCollection(obj.builders);
			list.itemRendererProperties.labelField = "name";
			list.itemRendererProperties.accessoryTextureFunction = function(item:Object):Texture{
				return StandardIcons.listDrillDownAccessoryTexture;
			}
			list.addEventListener(starling.events.Event.CHANGE, listChanged);
		}
		
		private function listChanged(e:starling.events.Event):void
		{	
			dispatchEventWith("listSelected", false, list.selectedItem);	
		}
		
	}
}