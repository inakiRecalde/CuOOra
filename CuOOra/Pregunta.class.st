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
	" chequemaos que las respuestas no sean de el, esas no suman puntos"
	^ (respuestas sumNumbers: [ :resp | resp userDiferenteA: self ] ) * 50 .
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
	^ respuestas collect: [ :resp | resp userIgualA: user ]
]
