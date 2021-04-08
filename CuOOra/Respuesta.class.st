Class {
	#name : #Respuesta,
	#superclass : #Posteo,
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
Respuesta >> respuestaDeUserPuntaje: aUser [
	(user equals: aUser)
	ifTrue: [ ^ self puntajeParticipaciones  ].
	^false.
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
