"
I represent a morph that is used internally by this library to wrap a user morph embedded in the text.

I provides some helpers for the morph's positioning etc.

An example of using an embedded object can be found in `#exampleWithEmbeddedObject`.

To insert an embedded object, send `#insertObject:` to a text position, for example:
```
text endPosition insertObject: Morph new.
```
"
Class {
	#name : 'TxEmbeddedMorph',
	#superclass : 'Morph',
	#category : 'TxText-Morphic',
	#package : 'TxText-Morphic'
}

{ #category : 'instance creation' }
TxEmbeddedMorph class >> for: aMorph [

	^ self new
		wrapAround: aMorph;
		yourself
]

{ #category : 'accessing' }
TxEmbeddedMorph >> currentPosition: aPoint [

	self position: aPoint x @ (aPoint y - self height)
]

{ #category : 'drawing' }
TxEmbeddedMorph >> drawOnAthensCanvas: aCanvas [
	"nothing"
	
"	aCanvas setPaint: (Color red alpha: 0.4).
	aCanvas pathTransform restoreAfter: [ 

		aCanvas drawShape: (bounds expandBy: 3) .
	].

"
]

{ #category : 'drawing' }
TxEmbeddedMorph >> fullDrawOnAthensCanvas: aCanvas [
	"nothing"

	aCanvas pathTransform restoreAfter: [
		aCanvas pathTransform translateBy: owner innerBounds origin.
		super fullDrawOnAthensCanvas: aCanvas ]
]

{ #category : 'accessing' }
TxEmbeddedMorph >> isLocked [

	^ false
]

{ #category : 'accessing' }
TxEmbeddedMorph >> layoutView [

	^ owner layoutView
]

{ #category : 'events-processing' }
TxEmbeddedMorph >> processEvent: anEvent using: defaultDispatcher [
"	| evt |
	evt := anEvent transformedBy: owner transform.

	Transcript show: 'event pos: '; show: anEvent position;cr."
"	Transcript show: bounds;cr."
	
	"evt := anEvent transformedBy: self transform."
	
	"^ #rejected."
	^ super processEvent: anEvent using: defaultDispatcher
]

{ #category : 'accessing' }
TxEmbeddedMorph >> wrapAround: aMorph [

	aMorph delete.
	aMorph position: 0 @ 0.
	self addMorph: aMorph.

	self extent: aMorph extent
]
