package modchart.engine.modifiers.list;

import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import modchart.backend.core.ArrowData;
import modchart.backend.core.ModifierParameters;
import modchart.backend.util.ModchartUtil;

class Boost extends Modifier {
	public function new(pf) {
		super(pf);

		setPercent('waveMult', 1, -1);
	}

	static final DIV38 = 1 / 38;

	override public function render(curPos:Vector3, params:ModifierParameters) {
		var player = params.player;
		var lane = Std.string(params.lane);

		final boost = (getPercent('boost', params.player) + getPercent('boost' + lane, params.player));
		final brake = (getPercent('brake', params.player) + getPercent('brake' + lane, params.player));
		final wave = (getPercent('wave', params.player) + getPercent('wave' + lane, params.player));

		if (boost != 0 || brake != 0) {
			final scale = HEIGHT * getPercent('boostScale', player);
			final shift = params.distance * 1.5 / ((params.distance + (scale) / 1.2) / scale);
			curPos.y += ModchartUtil.clamp((boost - brake) * (shift - params.distance), -600, 600);
		}
		if (wave != 0)
			curPos.y += (-wave * 100) * sin(params.distance * DIV38 * getPercent('waveMult', player) * 0.2);

		return curPos;
	}

	override public function shouldRun(params:ModifierParameters):Bool
		return true;
}
