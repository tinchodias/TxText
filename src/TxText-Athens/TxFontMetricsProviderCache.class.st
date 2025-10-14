Class {
	#name : 'TxFontMetricsProviderCache',
	#superclass : 'Object',
	#instVars : [
		'cache'
	],
	#classInstVars : [
		'current'
	],
	#category : 'TxText-Athens-Layout',
	#package : 'TxText-Athens',
	#tag : 'Layout'
}

{ #category : 'accessing' }
TxFontMetricsProviderCache class >> current [

	^ current ifNil: [ current := self new ]
]

{ #category : 'class initialization' }
TxFontMetricsProviderCache class >> initialize [

	SessionManager default registerSystemClassNamed: self name
]

{ #category : 'class initialization' }
TxFontMetricsProviderCache class >> resetCurrent [
	<script>
	
	current := nil

]

{ #category : 'class initialization' }
TxFontMetricsProviderCache class >> startUp: isResuming [

	isResuming ifTrue: [ self resetCurrent ]
]

{ #category : 'accessing' }
TxFontMetricsProviderCache >> at: aFont [

	^ cache at: aFont
]

{ #category : 'initialization' }
TxFontMetricsProviderCache >> initialize [

	super initialize.

	cache := LRUCache new
		         maximumWeight: 20;
		         factory: [ :aFont |
				         CairoFontMetricsProvider new
					         font: aFont;
					         yourself ];
		         yourself
]
