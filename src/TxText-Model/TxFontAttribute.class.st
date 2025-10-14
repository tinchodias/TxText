"
I represent the font of a text span
"
Class {
	#name : 'TxFontAttribute',
	#superclass : 'TxAttribute',
	#classVars : [
		'Default'
	],
	#category : 'TxText-Model',
	#package : 'TxText-Model'
}

{ #category : 'defaults' }
TxFontAttribute class >> defaultValue [

	^ Default ifNil: [
		Default := TextStyle defaultFont.
		self assert: [ Default class = LogicalFont ].
		Default ]
]

{ #category : 'instance creation' }
TxFontAttribute class >> fontNamed: aFamilyName size: pointSize [

	^ self new
		  value: (LogicalFont familyName: aFamilyName pointSize: pointSize);
		  yourself
]
