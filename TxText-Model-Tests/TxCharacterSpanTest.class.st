Class {
	#name : 'TxCharacterSpanTest',
	#superclass : 'TxSpanTestCase',
	#category : 'TxText-Model-Tests',
	#package : 'TxText-Model-Tests'
}

{ #category : 'accessing' }
TxCharacterSpanTest >> spanClass [
	^TxCharacterSpan 
]

{ #category : 'tests' }
TxCharacterSpanTest >> testGettingAbsentAttribute [

	| actual |

	textModel := TxModel new.
	textModel defaultStyle at: TxFontAttribute put: #mockValue.
	span text: textModel.
	
	actual := span getAttribute: TxFontAttribute.
	
	self assert: actual equals: #mockValue
]

{ #category : 'tests' }
TxCharacterSpanTest >> testGettingExistedAttribute [

	|  actual |
	
	span style add: TxFontAttribute with: #font.
	
	actual := span getAttribute: TxFontAttribute.
	
	self assert: actual == #font
	
]
