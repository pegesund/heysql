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
		do: [ spec
				baseline: 'Hupp'
				with: [ spec repository: 'github://svenvc/P3:master/repository' ].
			spec package: 'HeySql' with: [ spec requires: #('P3') ].
			spec package: 'HeySql-Tests' with: [ spec requires: #('HeySql') ].
			spec group: 'default' with: #('HeySql' 'HeySql-Tests').
			spec group: 'core' with: #('HeySql') ]
]
