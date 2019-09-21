"
Simple test class to play with.
"
Class {
	#name : #HeySqlPerson,
	#superclass : #HeySql,
	#instVars : [
		'forname',
		'surname'
	],
	#category : #'HeySql-Tests-Initialize'
}

{ #category : #'instance creation' }
HeySqlPerson >> new [
	^ (super new)
]
