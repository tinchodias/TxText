Class {
	#name : 'TxSliderAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'source'
	],
	#category : 'TxText-Morphic',
	#package : 'TxText-Morphic'
}

{ #category : 'instance creation' }
TxSliderAnnouncement class >> source: aSlider [

	^ self new
		source: aSlider;
		yourself
]

{ #category : 'accessing' }
TxSliderAnnouncement >> source [
	
	^ source
]

{ #category : 'accessing' }
TxSliderAnnouncement >> source: anObject [
	
	source := anObject
]
