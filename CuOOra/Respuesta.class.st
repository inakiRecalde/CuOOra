Class {
	#name : #Respuesta,
	#superclass : #Object,
	#instVars : [
		'text',
		'fecha',
		'likes',
		'dislikes'
	],
	#category : #'CuOOra-model'
}

{ #category : #constructor }
Respuesta class >> text: unText [
	^ self new text: unText .
]

{ #category : #'adding/removing' }
Respuesta >> darDislike: unUser [
	"comprobar si habia dado like" 
	dislikes add: (Interacciones user: unUser).
]

{ #category : #'adding/removing' }
Respuesta >> darLike: unUser [ 
	"comprobar si habia dado dislike o ya tenia like"
	likes add: (Interacciones user: unUser).
]

{ #category : #'adding/removing' }
Respuesta >> eliminarInteracciones [
	likes removeAll .
	dislikes removeAll .
]

{ #category : #initialization }
Respuesta >> initialize [ 
	fecha:= Date new .
	likes:= Interacciones new.
	dislikes := Interacciones new. 
]

{ #category : #accessing }
Respuesta >> puntajeParticipaciones [
	^ likes cant - dislikes cant .
]

{ #category : #accessing }
Respuesta >> text [
	^ text
]

{ #category : #accessing }
Respuesta >> text: anObject [
	text := anObject
]
