"
A TxTextStylesTest is a test class for testing the behavior of TxTextStyles
"
Class {
	#name : 'TxTextStylesTest',
	#superclass : 'TestCase',
	#instVars : [
		'text'
	],
	#category : 'TxText-Model-Tests',
	#package : 'TxText-Model-Tests'
}

{ #category : 'running' }
TxTextStylesTest >> setUp [

	text := 'abc' asTxModel
]

{ #category : 'tests' }
TxTextStylesTest >> testAddingCopyOfSameStyleReturnsOriginalStyle [

	| style attribute result original copy |
	style := TxStyle new.
	attribute := TxForeColorAttribute with: Color red.
	style add: attribute.

	original := text addStyle: style.
	copy := original copy.

	result := text addStyle: copy.

	self assert: result identicalTo: original
]

{ #category : 'tests' }
TxTextStylesTest >> testAddingSameStyleTwice [

	| style attribute result |
	style := TxStyle new.
	attribute := TxForeColorAttribute with: Color red.
	style add: attribute.

	result := text addStyle: style.

	self assert: result identicalTo: style
]
