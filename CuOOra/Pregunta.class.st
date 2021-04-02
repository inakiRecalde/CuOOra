Class {
	#name : #Pregunta,
	#superclass : #Object,
	#instVars : [
		'titulo',
		'descipcion',
		'fecha',
		'likes',
		'dislikes',
		'respuestas',
		'topicos'
	],
	#category : #'CuOOra-model'
}

{ #category : #'adding/removing' }
Pregunta >> agregarRespuesta: unaRespuesta [
	respuestas add: unaRespuesta .
]

{ #category : #accesing }
Pregunta >> calcularPuntaje [ 
	^ ( respuestas size * 50 )
]

{ #category : #'adding/removing' }
Pregunta >> darDislike: unUser [
	"comprobar si habia dado like o ya tenia dislike" 
	dislikes add: (Interacciones user: unUser).
]

{ #category : #'adding/removing' }
Pregunta >> darLike: unUser [ 
	"comprobar si habia dado dislike o ya tenia like "
	likes add: (Interacciones user: unUser).
]

{ #category : #'adding/removing' }
Pregunta >> eliminarRespuestas [
	respuestas do: [ :r | r eliminarInteracciones ] .
	respuestas removeAll.
]

{ #category : #initialization }
Pregunta >> initialize [ 	
	fecha := DateAndTime today .
	likes:= Interacciones new.
	dislikes:= Interacciones new.
	respuestas:= Set new.
	topicos:= Set new.
]

{ #category : #accesing }
Pregunta >> puntajeParticipaciones [
	^ likes size - dislikes size .
]

{ #category : #accesing }
Pregunta >> respuestas [ 
	^respuestas .
]
