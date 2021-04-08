Class {
	#name : #Respuesta,
	#superclass : #Posteo,
	#instVars : [
		'text',
		'user'
	],
	#category : #'CuOOra-model'
}

{ #category : #constructor }
Respuesta class >> text: unText [
	^ self new text: unText .
]

{ #category : #'adding/removing' }
Respuesta >> eliminarRespuestas [ 
	^self .
]

{ #category : #accessing }
Respuesta >> text [
	^ text
]

{ #category : #accessing }
Respuesta >> text: anObject [
	text := anObject
]

{ #category : #accessing }
Respuesta >> user [ 
	^user 
]

{ #category : #accessing }
Respuesta >> user: aUser [
	user:= aUser
]

{ #category : #accessing }
Respuesta >> userDiferenteA: aUser [
	^ user equals: aUser not .
]

{ #category : #accessing }
Respuesta >> userIgualA: aUser [
	^ user equals: aUser .
]
