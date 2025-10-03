Class {
	#name : 'TxLayoutViewChanged',
	#superclass : 'Announcement',
	#instVars : [
		'view'
	],
	#category : 'TxText-Athens-Layout',
	#package : 'TxText-Athens',
	#tag : 'Layout'
}

{ #category : 'accessing' }
TxLayoutViewChanged >> view [
	
	^ view
]

{ #category : 'accessing' }
TxLayoutViewChanged >> view: anObject [
	
	view := anObject
]
