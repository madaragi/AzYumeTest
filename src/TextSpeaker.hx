package;

import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.display.Bitmap;
import flash.display.BitmapData;

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
	var endNotice:Bitmap;
	var textQueue:Array<String> = new Array<String>();

	public function new(endNotice:Bitmap) 
	{
		super();
		width = 400;
		height = 128;
		opaqueBackground = 0xffffff;
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
		
		this.endNotice = endNotice;
		
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		addEventListener(MouseEvent.CLICK, onClick);
	}
	
	public function speak(text:String) {
		fullText = text;
		beginSpeaking();
	}
	
	public function addText(texts:Array<String>) {
		textQueue = texts;
		trace(textQueue);
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
					endNotice.visible = true;
					trace("changed state to WATING");
				}
				//全文読み終わった時
				if (offset + showingCharsCount == fullText.length) {
					state = ENDING;
					endNotice.visible = true;
					trace("changed state to ENDING");
				}
				count++;
			case WATING:
				endNotice.visible = !endNotice.visible;
			case ENDING:
				//endNotice.visible = true;
		}

	}
	
	private function onClick(e:MouseEvent) {
		switch(state) {
			case WATING:
				offset += getVisibleTextLength();
				showingCharsCount = 0;
				count = 0;
				state = SPEAKING;
				endNotice.visible = false;
			case SPEAKING:
				state = SKIPPING;
			case SKIPPING:
			case ENDING:
				trace(textQueue);
				if (textQueue.length == 0) {
					text = "";
				}
				else {
					fullText = textQueue.shift();
					beginSpeaking();
				}
				endNotice.visible = false;
		}
	}
	
	private inline function beginSpeaking() {
		count = 0;
		offset = 0;
		showingCharsCount = 0;
		state = SPEAKING;
		trace("changed state to SPEAKING");
	}
	
	private function getVisibleTextLength():Int {
		var textLength = 0;
		for (i in 0...bottomScrollV) {
			textLength += getLineLength(i);
		}
		return textLength;
	}
}