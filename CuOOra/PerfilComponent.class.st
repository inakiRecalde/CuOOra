Class {
	#name : #PerfilComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
PerfilComponent >> renderbuttonsOn: aCanvas [
	aCanvas anchor 
			callback: [ self answer];
			with: [ aCanvas button: 'volver' ].
			
		aCanvas anchor 
			callback: [ self volverHome];
			with: [ aCanvas button: 'Home' ].
]

{ #category : #accessing }
PerfilComponent >> user [
	^ user
]

{ #category : #accessing }
PerfilComponent >> user: anObject [
	user := anObject
]

{ #category : #callbacks }
PerfilComponent >> volverHome [
	self call: HomePage new.
]
