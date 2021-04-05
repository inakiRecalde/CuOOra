Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'contrasena',
		'email',
		'follows',
		'misPreguntas',
		'misRespuestas',
		'topicoDeInteres'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
Usuario class >> nombre: unNombre contrasena: unaContra email: unEmail [
	^ self new
		nombre: unNombre
		contrasena: unaContra
		email: unEmail yourself
]

{ #category : #'adding/removing' }
Usuario >> agregarComentario: unText aPregunta: pregunta [
	|r|
	r:= Respuesta text: unText.
	pregunta agregarRespuesta: r	.
	misRespuestas add: r.
]

{ #category : #accesing }
Usuario >> agregarPregunta: unaPregunta [ 
	misPreguntas add: unaPregunta .
]

{ #category : #accesing }
Usuario >> calcularPuntaje [
	^ ((misPreguntas size) * 20) +
			 (misPreguntas sumNumbers: [ :each | each calcularPuntaje ]) + (self  puntajeParticipaciones) .
]

{ #category : #accessing }
Usuario >> contrasena [
	^ contrasena
]

{ #category : #accessing }
Usuario >> contrasena: anObject [
	contrasena := anObject
]

{ #category : #accesing }
Usuario >> darDislike:  posteo [
	posteo darDislike: self .
]

{ #category : #accesing }
Usuario >> darLike:  posteo [
	posteo like: self .
]

{ #category : #'adding/removing' }
Usuario >> dejarDeSeguirUsuer: unUsuario [ 

	"verificar si el usuario existe en la coleccion"
	follows remove: unUsuario .
]

{ #category : #'adding/removing' }
Usuario >> eliminarPregunta: unaPregunta [ 
	(misPreguntas detect: [ :p | p esIgualA: unaPregunta  ]) eliminarRespuestas .
	misPreguntas remove: unaPregunta . 
]

{ #category : #accessing }
Usuario >> email [
	^ email
]

{ #category : #accessing }
Usuario >> email: anObject [
	email := anObject
]

{ #category : #accessing }
Usuario >> follows [
	^ follows
]

{ #category : #accessing }
Usuario >> follows: anObject [
	follows := anObject
]

{ #category : #initialization }
Usuario >> initialize [ 
	follows := Set new.
	misPreguntas := Set new.
	misRespuestas  := Set new.
	topicoDeInteres := 'desconocido'
]

{ #category : #accessing }
Usuario >> misPreguntas [
	^ misPreguntas
]

{ #category : #accessing }
Usuario >> misPreguntas: anObject [
	misPreguntas := anObject
]

{ #category : #accessing }
Usuario >> misRespuestas: anObject [
	misRespuestas := anObject
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre
]

{ #category : #accessing }
Usuario >> nombre: anObject [
	nombre := anObject
]

{ #category : #'instance creation' }
Usuario >> nombre: unNombre contrasena: unaContra email: unEmail [
		nombre:= unNombre.
		contrasena:= unaContra.
		email:= unEmail.
]

{ #category : #accesing }
Usuario >> preguntasIncluye: unaPregunta [ 
	^ misPreguntas detect: [ :unaPreg | unaPreg esIgualA: unaPregunta  ]. 
]

{ #category : #accesing }
Usuario >> preguntasRelevantes: topicos [
	^ (topicos select: [ :topico | topico esIgualA: topicoDeInteres  ]) preguntas.
	
]

{ #category : #accesing }
Usuario >> puntajesParticipaciones [ 
	^ misPreguntas puntajeParticipaciones + misRespuestas puntajeParticipaciones .
]

{ #category : #'adding/removing' }
Usuario >> registrarTopicoDeInteres: unTopico [ 
	topicoDeInteres := unTopico .
]

{ #category : #accesing }
Usuario >> respuestas [ 
	^ misRespuestas .
]

{ #category : #'adding/removing' }
Usuario >> seguirUser: unUsuario [
	follows add: unUsuario 
]

{ #category : #accessing }
Usuario >> topicoDeInteres [
	^ topicoDeInteres
]
