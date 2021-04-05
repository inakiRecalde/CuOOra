Class {
	#name : #Pregunta,
	#superclass : #Posteo,
	#instVars : [
		'titulo',
		'descipcion',
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
	^ (respuestas sumNumbers: [ :resp | resp respuestaDiferenteAUsuario: self ] ) * 50 .
]

{ #category : #'adding/removing' }
Pregunta >> eliminarRespuestas [ 
	respuestas removeAll.
]

{ #category : #initialization }
Pregunta >> initialize [ 	
	respuestas:= Set new.
	topicos:= Set new.
]

{ #category : #accesing }
Pregunta >> preguntaDeTopico: unTopico [
	topicos detect: [ :topico | topico esIgualA: unTopico  ]  
	ifFound: [ ^true ] 
	ifNone: [ ^false ] .
]

{ #category : #accesing }
Pregunta >> puntajeParticipaciones [
	^ likes size - dislikes size .
]

{ #category : #accesing }
Pregunta >> respuestas [ 
	^respuestas .
]

{ #category : #accesing }
Pregunta >> respuestasDeUser: user [
	^ respuestas collect: [ :resp | resp esDeUser: user ]
]
