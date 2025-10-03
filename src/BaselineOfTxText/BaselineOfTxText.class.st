Class {
	#name : 'BaselineOfTxText',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTxText',
	#package : 'BaselineOfTxText'
}

{ #category : 'baselines' }
BaselineOfTxText >> baseline: spec [
	<baseline>

	spec
		for: #common
		do: [
			spec
				package: 'TxText-Editor';
				package: 'TxText-Model';
				package: 'TxText-Model-Tests' with: [ spec requires: #('TxText-Model') ].

			spec
				package: 'TxText-Athens' with: [ spec requires: #('TxText-Model') ];
				package: 'TxText-Athens-Tests' with: [ spec requires: #('TxText-Athens' 'TxText-Model') ];
				package: 'TxText-Morphic' with: [ spec requires: #('TxText-Athens' 'TxText-Editor' 'TxText-Model') ];
				package: 'TxText-Styler' with: [ spec requires: #('TxText-Model') ];
				package: 'TxText-Tools' with: [ spec requires: #('TxText-Editor' 'TxText-Morphic' 'TxText-Styler') ].

			"spec
				package: 'TxText-Bloc' with: [ spec requires: #('TxText-Athens' 'TxText-Editor' 'TxText-Model' 'TxText-Morphic') ]"

			]
]
