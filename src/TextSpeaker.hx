package;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;

enum TextSpeakerState {
	SPEAKING;
	WATING;
	SKIPPING;
	ENDING;
}

/**
 * ...
 * @author 
 */
class TextSpeaker extends TextField
{
	var fullText:String;
	var count:Int = 0;
	var showingCharsCount:Int = 0;
	var textSpeed:Float = 0.5;
	var offset:Int = 0;
	var state = TextSpeakerState.WATING;

	public function new() 
	{
		super();
		width = 400;
		height = 128;
		//opaqueBackground = 0xffffff;
		multiline = true;
		wordWrap = true;
		selectable = false;
		
		var format = new TextFormat();
		format.font = "メイリオ";
		format.color = 0x202020;
		format.size = 28;
		format.leading = -4;
		//format.bold = true;
		defaultTextFormat = format;
		
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		addEventListener(MouseEvent.CLICK, onClick);
	}
	
	public function speak(text:String) {
		fullText = text;
		count = 0;
		state = SPEAKING;
	}
	
	private function onEnterFrame(e:Event) {
		switch(state) {
			case SPEAKING, SKIPPING:
				if (state == SKIPPING) showingCharsCount += 10;
				else showingCharsCount = Math.ceil(count*textSpeed);
				
				if (showingCharsCount > fullText.length - offset) {
					showingCharsCount = fullText.length - offset;
					state = ENDING;
				}
				text = fullText.substring(offset, offset + showingCharsCount);
				//行末に達した時
				if (numLines > bottomScrollV) {
					state = WATING;
				}
				count++;
			case WATING:
			case ENDING:
		}

	}
	
	private function onClick(e:MouseEvent) {
		switch(state) {
			case WATING:
				offset += getVisibleTextLength();
				showingCharsCount = 0;
				count = 0;
				state = SPEAKING;
			case SPEAKING:
				state = SKIPPING;
			case SKIPPING:
			case ENDING:
		}
	}
	
	private function getVisibleTextLength():Int {
		var textLength = 0;
		for (i in 0...bottomScrollV) {
			textLength += getLineLength(i);
		}
		return textLength;
	}
}