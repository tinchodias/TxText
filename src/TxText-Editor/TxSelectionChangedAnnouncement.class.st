"
i am announced each time when selection has changed
"
Class {
	#name : 'TxSelectionChangedAnnouncement',
	#superclass : 'TxTextEditorAnnouncement',
	#instVars : [
		'newSelection'
	],
	#category : 'TxText-Editor',
	#package : 'TxText-Editor'
}

{ #category : 'accessing' }
TxSelectionChangedAnnouncement >> newSelection [
	^ newSelection
]

{ #category : 'accessing' }
TxSelectionChangedAnnouncement >> newSelection: anObject [
	newSelection := anObject
]
