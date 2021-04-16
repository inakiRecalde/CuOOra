Class {
	#name : #Respuesta,
	#superclass : #Posteo,
	#category : #'CuOOra-model'
}

{ #category : #constructor }
Respuesta class >> text: unText user: aUser [
	^ self new text: unText user: aUser .
]

{ #category : #initialization }
Respuesta >> initialize [ 
	super initialize .
]

{ #category : #constructor }
Respuesta >> text: aText user: aUser [  
	text:= aText .
	user:= aUser . 
]

{ #category : #accessing }
Respuesta >> userDiferenteA: aUser [
	^ user equals: aUser not .
]

{ #category : #accessing }
Respuesta >> userIgualA: aUser [
	^ user equals: aUser .
]

{ #category : #accessing }
Respuesta >> userPuntaje: aUser [
	(user equals: aUser)
	ifTrue: [ ^ self puntajeParticipaciones  ].
	^false.
]
