"
I make sure that all my submorphs will be drawn using Athens, not Balloon. For that I use a separate surface.

I'm a 2025 version of `AthensWrapperMorph`, which has been in Pharo for several versions.
"
Class {
	#name : 'TxAthensWrapperMorph',
	#superclass : 'Morph',
	#instVars : [
		'surface',
		'scaleFactor'
	],
	#category : 'TxText-Morphic',
	#package : 'TxText-Morphic'
}

{ #category : 'accessing' }
TxAthensWrapperMorph >> athensSurface [

	self ensureValidSurface.

	^ surface
]

{ #category : 'private' }
TxAthensWrapperMorph >> createAthensSurface [

	surface := AthensCairoSurface extent: self requiredSurfaceExtent.
	surface deviceScaleX: scaleFactor y: scaleFactor
]

{ #category : 'private' }
TxAthensWrapperMorph >> drawAthensSurfaceOn: aCanvas [

	| logicalIntegerExtent |
	logicalIntegerExtent := self extent asIntegerPoint.
	aCanvas
		formSet: (FormSet
			extent: logicalIntegerExtent
			depth: 32
			forms: { surface asForm })
		at: bounds origin
		sourceRect: (0 @ 0 extent: logicalIntegerExtent)
		rule: Form blendAlphaScaled
]

{ #category : 'drawing' }
TxAthensWrapperMorph >> drawOn: aCanvas [

	"do nothing"
]

{ #category : 'drawing' }
TxAthensWrapperMorph >> drawOnAthensCanvas: aCanvas [

	"do nothing"
]

{ #category : 'private' }
TxAthensWrapperMorph >> drawOnAthensSurface [

	surface drawDuring: [ :canvas |
		surface clear.
		canvas pathTransform restoreAfter: [
			"before rendering transform from a global coordinates (Morphic)
			to relative coordinates (Athens)"
			canvas pathTransform translateBy: bounds origin negated.
			self fullDrawOnAthensCanvas: canvas ] ]
]

{ #category : 'private' }
TxAthensWrapperMorph >> ensureValidSurface [
	"Recreate a surface if surface is either not initialized, or has been
	freed, or has wrong extent."

	(surface isNil or: [
		surface hasBeenFreed or: [
			surface extent ~= self requiredSurfaceExtent ] ])
				ifFalse: [ self createAthensSurface ]
]

{ #category : 'private' }
TxAthensWrapperMorph >> ensureValidSurfaceScaledWith: currentFactor [

	currentFactor = scaleFactor
		ifFalse: [
			"Enough reason to recreate"
			scaleFactor := currentFactor.
			self createAthensSurface ]
		ifTrue: [
			"Still need to do more checks"
			self ensureValidSurface ]
]

{ #category : 'drawing' }
TxAthensWrapperMorph >> fullDrawOn: aCanvas [
	"Draw the full Morphic structure on the given Canvas"

	self visible ifFalse: [ ^ self ].
	(aCanvas isVisible: self fullBounds) ifFalse: [ ^ self ].
	(self hasProperty: #errorOnDraw) ifTrue: [ ^ self drawErrorOn: aCanvas ].

	self ensureValidSurfaceScaledWith: aCanvas scale.

	[	self drawOnAthensSurface.
		self drawAthensSurfaceOn: aCanvas ]
			onErrorDo: [ :anError |
				self setProperty: #errorOnDraw toValue: true.
				self setProperty: #drawError toValue: anError freeze.
				^ self drawErrorOn: aCanvas ]
]

{ #category : 'drawing' }
TxAthensWrapperMorph >> fullDrawOnAthensCanvas: anAthensCanvas [
	"Draw the full Morphic structure on the given Canvas"

	self visible ifFalse: [ ^ self ].
	(anAthensCanvas isVisible: self fullBounds) ifFalse: [ ^ self ].
	(self hasProperty: #errorOnDraw) ifTrue: [
		^ self "drawErrorOn: aCanvas" ].

	(anAthensCanvas isVisible: bounds) ifTrue: [
		anAthensCanvas draw: self ].

	submorphs reverseDo: [ :each | anAthensCanvas fullDrawMorph: each ]
]

{ #category : 'event handling' }
TxAthensWrapperMorph >> handlesMouseDown: evt [

	^ true
]

{ #category : 'private' }
TxAthensWrapperMorph >> requiredSurfaceExtent [

	^ Point
		x: (bounds width * scaleFactor) asInteger
		y: (bounds height * scaleFactor) asInteger
]
