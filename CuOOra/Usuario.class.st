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
Usuario class >> nombre: unNombre contrasena: unaContra email: unMail [
	^ self new
		nombre: unNombre
		contrasena: unaContra
		email: unMail
		yourself
]

{ #category : #'adding/removing' }
Usuario >> agregarComentario: unText aPregunta: pregunta [
	|r|
	r:= Respuesta text: unText user: self.
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
Usuario >> dejarDeSeguirA: unUsuario [
	(follows includes: unUsuario )
	ifTrue: [ follows remove: unUsuario ]
]

{ #category : #accessing }
Usuario >> email [
	^ email
]

{ #category : #accessing }
Usuario >> email: anObject [
	email := anObject
]

{ #category : #accesing }
Usuario >> emailIgual: aUserEmail [
	^ email == aUserEmail .
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
	topicoDeInteres := Topico new.
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
Usuario >> nombreIgual: aUserNombre [
	^ nombre == aUserNombre.
]

{ #category : #testing }
Usuario >> puedeSeguirA: aUser [
	aUser == self
		ifTrue: [ ^ false ].
	(follows includes: aUser)
		ifTrue: [ ^ false ].
	^ true
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

{ #category : #'adding/removing' }
Usuario >> sigoA: unUsuario [
	^follows includes: unUsuario.
]

{ #category : #accessing }
Usuario >> topicoDeInteres [
	^ topicoDeInteres
]

{ #category : #accessing }
Usuario >> topicoDeInteres: unTopico [ 
	 topicoDeInteres:= unTopico .
]
