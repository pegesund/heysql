"
Baseline for HeySql-package
"
Class {
	#name : #BaselineOfHeySql,
	#superclass : #BaselineOf,
	#category : #BaselineOfHeySql
}

{ #category : #baselines }
BaselineOfHeySql >> baselineOf: spec [
	<baseline>
	spec
		for: #common
		do: [ spec baseline: 'P3' with: [ spec repository: 'github://svenvc/P3' ].
			spec package: 'HeySql' with: [ spec requires: #('P3') ].
			spec
				package: 'HeySql-Tests'
				with: [ spec requires: #('HeySql'  'P3') ].
			spec group: 'default' with: #('HeySql' 'HeySql-Tests'  'P3').
			spec group: 'core' with: #('HeySql'  'P3') ]
]
