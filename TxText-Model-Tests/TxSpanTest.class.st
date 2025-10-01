Class {
	#name : 'TxSpanTest',
	#superclass : 'TestCase',
	#instVars : [
		'span',
		'textModel'
	],
	#category : 'TxText-Model-Tests',
	#package : 'TxText-Model-Tests'
}

{ #category : 'testing' }
TxSpanTest class >> isAbstract [ 
	^self == TxSpanTest
]

{ #category : 'running' }
TxSpanTest >> setUp [

	super setUp.
	textModel := TxModel new.

	span := self spanClass new.
	span text: textModel
]

{ #category : 'accessing' }
TxSpanTest >> spanClass [

	^ self subclassResponsibility
]
