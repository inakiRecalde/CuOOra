Class {
	#name : #Pregunta,
	#superclass : #Posteo,
	#instVars : [
		'titulo',
		'descripcion',
		'respuestas',
		'topicos'
	],
	#category : #'CuOOra-model'
}

{ #category : #constructor }
Pregunta class >> titulo:title descripcion:desc [
	^self new 
	titulo: title
	descripcion: desc
	yourself .
]

{ #category : #constructor }
Pregunta class >> titulo:title descripcion:desc topicos: top [
	^self new 
	titulo: title
	descripcion: desc
	topicos: top
	yourself .
]

{ #category : #'adding/removing' }
Pregunta >> agregarRespuesta: unaRespuesta [
	respuestas add: unaRespuesta .
]

{ #category : #accesing }
Pregunta >> calcularPuntaje [ 
	" chequemaos que las respuestas no sean de el, esas no suman puntos"
	^ (respuestas sumNumbers: [ :resp | resp userDiferenteA: self ] ) * 50 .
]

{ #category : #accessing }
Pregunta >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Pregunta >> descripcion: anObject [
	descripcion := anObject
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

{ #category : #accessing }
Pregunta >> respuestas [ 
	^respuestas .
]

{ #category : #accessing }
Pregunta >> respuestas: anObject [
	respuestas add: anObject
]

{ #category : #accesing }
Pregunta >> respuestasDeUser: user [
	^ respuestas collect: [ :resp | resp userIgualA: user ]
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]

{ #category : #accessing }
Pregunta >> titulo: anObject [
	titulo := anObject
]

{ #category : #initialization }
Pregunta >> titulo:title descripcion:desc topicos: top [
	titulo:= title.
	descripcion:= desc.
	topicos add: top.
]

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos
]

{ #category : #accessing }
Pregunta >> topicos: anObject [
	topicos add: anObject
]
