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
		do: [ spec baseline: 'P3' with: [ spec repository: 'github://svenvc:master/P3' ].
			spec package: 'HeySql' with: [ spec requires: #('P3') ].
			spec package: 'HeySql-Tests' with: [ spec requires: #('HeySql') ].
			spec group: 'default' with: #('HeySql' 'HeySql-Tests').
			spec group: 'core' with: #('HeySql') ]
]
