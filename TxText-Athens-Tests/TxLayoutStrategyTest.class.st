Class {
	#name : 'TxLayoutStrategyTest',
	#superclass : 'TxAthensTextTest',
	#instVars : [
		'view'
	],
	#category : 'TxText-Athens-Tests',
	#package : 'TxText-Athens-Tests'
}

{ #category : 'private' }
TxLayoutStrategyTest >> defaultLayoutViewExtent [
	^ 10@1000
]

{ #category : 'private' }
TxLayoutStrategyTest >> defaultText [
	^ 'Pharo is a modern Smalltalk implementation'
]

{ #category : 'running' }
TxLayoutStrategyTest >> setUp [
	| text |
	text := self newText: self defaultText.
	view := self newViewOn: text.
]
