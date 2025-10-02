"
This layout strategy wraps text, so it never overflows the view horizontally.
If the line is too long to be shown fully as a single text line in view,
it is automatically wrapped to the next line.

Therefore, the layout is calculated based on the view's extent.
The 'rightMargin' can be used to wrap the text before it gets wider than view width, e.g:

maxLineWidth := view width - rightMargin.

By default, right margin is Zero, meaning the max line width is same as view width.

Note, if you use this strategy, the view must never use horizontal scrolling,
and its offset x must be always Zero (since it makes little sense to have otherwise with such a strategy).
"
Class {
	#name : 'TxAthensCharacterWrappingStrategy',
	#superclass : 'TxAthensLayoutStrategy',
	#instVars : [
		'rightMargin'
	],
	#category : 'TxText-Athens-Layout',
	#package : 'TxText-Athens',
	#tag : 'Layout'
}

{ #category : 'initialization' }
TxAthensCharacterWrappingStrategy >> initialize [

	super initialize.
	rightMargin := 0
]

{ #category : 'accessing' }
TxAthensCharacterWrappingStrategy >> rightMargin [

	^ rightMargin
]

{ #category : 'accessing' }
TxAthensCharacterWrappingStrategy >> rightMargin: aNumber [

	rightMargin := aNumber
]

{ #category : 'visitor' }
TxAthensCharacterWrappingStrategy >> visitCharacterSpan: aSpan [
	
	| spanCharacters index start font lineWidth fontMetricsProvider viewWidth glyphWidth |
	spanCharacters := aSpan characters.
	index := currentPosition spanPosition.
	font := aSpan getAttribute: TxFontAttribute.
	
	fontMetricsProvider := self fontMetricsProviderFor: font.
	currentLine
		accumulateHeight: fontMetricsProvider fontHeight;
		accumulateAscent: fontMetricsProvider fontAscent.
	
	viewWidth := self view extent x.
	lineWidth := 0.
	start := index + 1.
	
	[ index < spanCharacters size ] whileTrue: [
		| eachCharacter |
		eachCharacter := spanCharacters at: index + 1.
		eachCharacter == Character tab ifTrue: [
			| tabAdvance |
			tabAdvance := self tabAdvanceUsingFont: font.
			((currentLine width + tabAdvance x > (viewWidth - rightMargin))
				and: [ currentLine width > 0 ]) ifTrue: [

				"Need to wrap"
				currentLine addCommand:
					(fontMetricsProvider 
						newCharacterSpanDisplayCommand: aSpan 
						start: start 
						stop: index 
						advance: lineWidth @ 0).

				currentPosition := aSpan positionAt: index.
				self completeLine.
				^ currentPosition ].
				
			currentLine addCommand:
				(fontMetricsProvider 
					newCharacterSpanDisplayCommand: aSpan 
					start: start 
					stop: index
					advance: lineWidth @ 0).

			currentLine addWidth: tabAdvance x.
			currentLine addCommand:
				(fontMetricsProvider 
					newTabDisplayCommand: aSpan
					start: index - 1
					stop: index
					advance: tabAdvance).
			currentPosition := aSpan positionAt: index + 1.
			^ currentPosition ].

		glyphWidth := fontMetricsProvider getGlyphWidth: eachCharacter.
		"Do not wrap unless we put at least one character into current line"
		((currentLine width + glyphWidth > (viewWidth - rightMargin))
			and: [ currentLine width > 0 ])
				ifTrue: [ 
					"wrap to new line"
					currentLine addCommand:
						(fontMetricsProvider 
							newCharacterSpanDisplayCommand: aSpan 
							start: start 
							stop: index 
							advance: lineWidth @ 0).

					currentPosition := aSpan positionAt: index.
					self completeLine.
					^ currentPosition ]
				ifFalse: [
					currentLine addWidth: glyphWidth.
					lineWidth := lineWidth + glyphWidth.
					index := index + 1 ] ].

	currentLine addCommand:
		(fontMetricsProvider 
			newCharacterSpanDisplayCommand: aSpan 
			start: start 
			stop: spanCharacters size
			advance: lineWidth @ 0).

	^ aSpan next startPosition
]
