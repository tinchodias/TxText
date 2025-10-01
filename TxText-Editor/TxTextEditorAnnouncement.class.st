"
This is root class of announcements related to text editor events.
"
Class {
	#name : 'TxTextEditorAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'editor'
	],
	#category : 'TxText-Editor',
	#package : 'TxText-Editor'
}

{ #category : 'accessing' }
TxTextEditorAnnouncement >> editor [
	^ editor
]

{ #category : 'accessing' }
TxTextEditorAnnouncement >> editor: anObject [
	editor := anObject
]
