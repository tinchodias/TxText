Extension { #name : 'TxAthensLayoutView' }

{ #category : '*TxText-Bloc' }
TxAthensLayoutView >> renderOnSpartaCanvas: canvas [

	"
	set up clipping
	- draw line by line
	"

	| renderer |
	renderer := TxTextRenderer new.
	renderer renderLines: layout lines onSpartaCanvas: canvas
]
