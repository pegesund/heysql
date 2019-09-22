"
Simple test class to play with.
"
Class {
	#name : #HeySqlPerson,
	#superclass : #HeySql,
	#instVars : [
		'forname',
		'surname',
		'theGender'
	],
	#category : #'HeySql-Tests-Initialize'
}

{ #category : #'instance creation' }
HeySqlPerson class >> new [
	^ super new.
]
