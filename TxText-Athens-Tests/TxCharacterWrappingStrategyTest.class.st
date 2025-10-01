Class {
	#name : 'TxCharacterWrappingStrategyTest',
	#superclass : 'TxLayoutStrategyTest',
	#category : 'TxText-Athens-Tests',
	#package : 'TxText-Athens-Tests'
}

{ #category : 'private' }
TxCharacterWrappingStrategyTest >> defaultStrategy [

	^ TxAthensCharacterWrappingStrategy new
]

{ #category : 'testing' }
TxCharacterWrappingStrategyTest >> testLayoutShouldContainMultipleLines [

	self assert: view layout numberOfLines > 1
]
