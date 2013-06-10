package
{
	import flash.events.Event;
	
	import starling.events.Event;

	public interface IQuestion
	{
		function onBack(e:starling.events.Event):void;
		function onSubmit(e:starling.events.Event):void;
		function processXML(e:flash.events.Event):void ;
		function randomRange(max:Number, min:Number=1):Number;
	}
}