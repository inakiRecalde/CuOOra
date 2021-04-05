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
Respuesta >> esDeUser: aUser [
	^ user equals: aUser .
]

{ #category : #accessing }
Respuesta >> respuestaDiferenteAUsuario: aUser [
	^ user equals: aUser 
]

{ #category : #accessing }
Respuesta >> text [
	^ text
]

{ #category : #accessing }
Respuesta >> text: anObject [
	text := anObject
]
