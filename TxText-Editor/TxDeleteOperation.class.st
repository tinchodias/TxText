"
a history record containing delete operation
"
Class {
	#name : 'TxDeleteOperation',
	#superclass : 'TxEditorOperation',
	#instVars : [
		'selection'
	],
	#category : 'TxText-Editor',
	#package : 'TxText-Editor'
}

{ #category : 'undo-undo' }
TxDeleteOperation >> do [

	selection cut
]
