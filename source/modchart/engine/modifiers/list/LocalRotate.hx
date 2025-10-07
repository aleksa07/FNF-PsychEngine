package modchart.engine.modifiers.list;

import flixel.FlxG;
import modchart.backend.core.ArrowData;
import modchart.backend.core.ModifierParameters;
import modchart.backend.util.ModchartUtil;

class LocalRotate extends Rotate {
	override public function getOrigin(curPos:Vector3, params:ModifierParameters):Vector3 {
		var fixedLane = Math.round(getKeyCount(params.player) * .5);
		return new Vector3(getReceptorX(fixedLane, params.player), getReceptorY(fixedLane, params.player));
	}

	override public function getRotateName():String
		return 'localRotate';

	override public function shouldRun(params:ModifierParameters):Bool
		return true;
}
