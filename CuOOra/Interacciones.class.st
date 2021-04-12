Class {
	#name : #Interacciones,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'user'
	],
	#category : #'CuOOra-model'
}

{ #category : #constructor }
Interacciones class >> user: unUser [
	^self new user: unUser .
]

{ #category : #accessing }
Interacciones >> esDe: aUser [
	^ user nombre == aUser nombre .
]

{ #category : #initialization }
Interacciones >> initialize [
	fecha := DateAndTime now.
]

{ #category : #accessing }
Interacciones >> user: unUser [ 
	user:= unUser .
]
