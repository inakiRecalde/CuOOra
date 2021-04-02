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

{ #category : #initialization }
Interacciones >> initialize [
	fecha := DateAndTime today.
]

{ #category : #accessing }
Interacciones >> user: unUser [ 
	user:= unUser .
]
