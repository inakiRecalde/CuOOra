Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'contrasena',
		'email',
		'follows',
		'topicoDeInteres'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
Usuario class >> nombre: unNombre contrasena: unaContra [
		^ self new
		nombre: unNombre
		contrasena: unaContra
		yourself 
]

{ #category : #'instance creation' }
Usuario class >> nombre: unNombre contrasena: unaContra email: unMail [.
	^ self new
		nombre: unNombre
		contrasena: unaContra
		email: unMail
		yourself
]

{ #category : #'adding/removing' }
Usuario >> agregarComentario: unText aPregunta: pregunta [
	|r|
	r:= Respuesta text: unText.
	pregunta agregarRespuesta: r	.
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
	follows add: anObject
]

{ #category : #initialization }
Usuario >> initialize [ 
	follows := Set new.
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
Usuario >> nombre: unNombre contrasena: unaContra email: unMail [
		nombre:= unNombre.
		contrasena:= unaContra.
		email:= unMail.
]

{ #category : #accesing }
Usuario >> preguntasRelevantes: topicos [
	"(topicos select: [ :topico | topico esIgualA: topicoDeInteres  ]) 
	   add: (follows collect: [ :fol | fol misPreguntas ]))  preguntas."
]

{ #category : #accesing }
Usuario >> puntajeParticipacionesRespuestas [
	(self respuestasDeUser: self size ) * 50. 
]

{ #category : #'adding/removing' }
Usuario >> registrarTopicoDeInteres: unTopico [ 
	topicoDeInteres := unTopico .
]

{ #category : #'adding/removing' }
Usuario >> seguirUser: unUsuario [
	(follows includes: unUsuario )
	ifFalse: [ follows add: unUsuario ]
]

{ #category : #accessing }
Usuario >> topicoDeInteres [
	^ topicoDeInteres
]

{ #category : #accessing }
Usuario >> topicoDeInteres: unTopico [ 
	 topicoDeInteres:= unTopico .
]
