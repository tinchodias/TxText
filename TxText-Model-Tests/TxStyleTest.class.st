Class {
	#name : 'TxStyleTest',
	#superclass : 'TestCase',
	#instVars : [
		'style'
	],
	#category : 'TxText-Model-Tests',
	#package : 'TxText-Model-Tests'
}

{ #category : 'running' }
TxStyleTest >> setUp [
	super setUp.
	
	style := TxStyle new
]

{ #category : 'tests' }
TxStyleTest >> testAddingAttribute [

	| attribute |
	attribute := TxFontAttribute new.
	
	style add: attribute.
	
	self assert: (style includes: attribute)
]

{ #category : 'tests' }
TxStyleTest >> testAddingAttributeWithValue [

	| actual |
	style add: TxFontAttribute with: #font.
	
	actual := style at: TxFontAttribute. 

	self assert: (actual value == #font)
]

{ #category : 'tests' }
TxStyleTest >> testGettingAbsentAttributeValue [

	| actual |
	
	style removeAll.
	
	actual := style at: TxFontAttribute ifAbsent: [#result].
	
	self assert: actual == #result
]

{ #category : 'tests' }
TxStyleTest >> testGettingExistedAttributeValue [

	| attribute actual |
	attribute := TxFontAttribute with: #font.
	
	style add: attribute.
	
	actual := style get: TxFontAttribute ifAbsent: nil.
	
	self assert: actual == #font
]

{ #category : 'tests' }
TxStyleTest >> testHasEmptyContentsByDefault [

	self assert: style isEmpty
]
