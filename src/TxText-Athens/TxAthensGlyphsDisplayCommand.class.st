Class {
	#name : 'TxAthensGlyphsDisplayCommand',
	#superclass : 'TxCharacterSpanDisplayCommand',
	#instVars : [
		'glyphs'
	],
	#category : 'TxText-Athens-Layout',
	#package : 'TxText-Athens',
	#tag : 'Layout'
}

{ #category : 'private' }
TxAthensGlyphsDisplayCommand >> getGlyphsUsing: renderer [

	glyphs := renderer glyphsOf: span characters from: start to: stop
]

{ #category : 'rendering' }
TxAthensGlyphsDisplayCommand >> renderOn: renderer [

	| canvas glyphRenderer |
	canvas := renderer canvas.
	glyphRenderer := canvas setFont: (span getAttribute: TxFontAttribute).
	canvas setPaint: (span getAttribute: TxForeColorAttribute).

	glyphs ifNil: [ self getGlyphsUsing: glyphRenderer ].
	glyphRenderer renderGlyphs: glyphs.

	renderer advance: advance
]

{ #category : 'setting up' }
TxAthensGlyphsDisplayCommand >> span: aSpan start: startPosition stop: stopPosition [

	span := aSpan.
	start := startPosition.
	stop := stopPosition.
	glyphs := nil
]
