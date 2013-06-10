package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import starling.core.Starling;
	import starling.core.starling_internal;
	
	
	[SWF(width=640, height=960, frameRate=60)]
	public class learning extends Sprite
	{
		public function learning()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;	
			var mystarling:Starling= new Starling (Main1, stage);
			mystarling.start();
		}
	}
}