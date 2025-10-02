"
I'm a layout strategy that computes the layout of each text line from the starting position to the end of the line.

Therefore, I compute the line as it is,  and its up to the view to clip all the characters outside of the layout view's extent.


"
Class {
	#name : 'TxAthensNoWrapStrategy',
	#superclass : 'TxAthensLayoutStrategy',
	#instVars : [
		'finished'
	],
	#category : 'TxText-Athens-Layout',
	#package : 'TxText-Athens',
	#tag : 'Layout'
}

{ #category : 'visiting' }
TxAthensNoWrapStrategy >> visitCharacterSpan: aSpan [
	
	| spanCharacters start font lineWidth fontMetricsProvider |
	spanCharacters := aSpan characters.
	
	start := currentPosition spanPosition.
	start = 0 ifTrue: [ start := 1 ].
	
	font := aSpan getAttribute: TxFontAttribute.  
	fontMetricsProvider := self fontMetricsProviderFor: font.
	currentLine
		accumulateHeight: fontMetricsProvider fontHeight;
		accumulateAscent: fontMetricsProvider fontAscent.
	
	lineWidth := 0.
	start to: spanCharacters size do: [ :index |
		| eachCharacter tabAdvance |
		eachCharacter := spanCharacters at: index.
		eachCharacter == Character tab 
			ifTrue: [ 
				index > start ifTrue: [ 
					currentLine addWidth: lineWidth.

					currentLine addCommand:
						(fontMetricsProvider 
							newCharacterSpanDisplayCommand: aSpan
							start: start
							stop: index - 1
							advance: lineWidth @ 0) ].

					tabAdvance := self tabAdvanceUsingFont: font.
					currentLine addCommand:
						(fontMetricsProvider 
							newTabDisplayCommand: aSpan
							start: index - 1
							stop: index
							advance: tabAdvance).
						
					currentLine addWidth: tabAdvance x.
					
					^ aSpan positionAt: index + 1 ]
			ifFalse: [
				lineWidth := lineWidth + (fontMetricsProvider getGlyphWidth: eachCharacter) ] ].

	currentLine addWidth: lineWidth.

	currentLine addCommand:
		(fontMetricsProvider 
			newCharacterSpanDisplayCommand: aSpan
			start: start
			stop: aSpan size
			advance: lineWidth @ 0).
		
	^ aSpan next startPosition
]
