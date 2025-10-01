"
A view container is responsible is responsible for taking care about platform-specific duties like connecting view with outer world (like Morphic) in order to handle events etc.
A null container simply ignores all notifications from view.
"
Class {
	#name : 'TxAthensNullViewContainer',
	#superclass : 'Object',
	#category : 'TxText-Athens-Layout',
	#package : 'TxText-Athens',
	#tag : 'Layout'
}

{ #category : 'view notifications' }
TxAthensNullViewContainer >> layoutIsAboutToResetIn: view [
	"ignored"
]

{ #category : 'view notifications' }
TxAthensNullViewContainer >> newEmbeddedObjectCommand: aTxEmbeddedObjectSpan [ 

	self error: 'This container does not supports embedded objects in text'
]

{ #category : 'view notifications' }
TxAthensNullViewContainer >> viewChanged: layoutView [
	"Received when view is changed, including scrolling or full reset of it.
	Ignored"
]
