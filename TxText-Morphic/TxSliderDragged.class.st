Class {
	#name : 'TxSliderDragged',
	#superclass : 'TxSliderAnnouncement',
	#instVars : [
		'oldPosition',
		'newPosition'
	],
	#category : 'TxText-Morphic',
	#package : 'TxText-Morphic'
}

{ #category : 'accessing' }
TxSliderDragged >> newPosition [
	
	^ newPosition
]

{ #category : 'accessing' }
TxSliderDragged >> newPosition: anObject [
	
	newPosition := anObject
]

{ #category : 'accessing' }
TxSliderDragged >> oldPosition [
	
	^ oldPosition
]

{ #category : 'accessing' }
TxSliderDragged >> oldPosition: anObject [
	
	oldPosition := anObject
]
