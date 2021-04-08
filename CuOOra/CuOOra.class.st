Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos',
		'preguntas'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'CuOOra-model'
}

{ #category : #accessing }
CuOOra class >> clearSoleInstance [
	soleInstance:= nil
]

{ #category : #accessing }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #initialization }
CuOOra >> addUsuario: aUser [
	usuarios add: aUser
]

{ #category : #initialization }
CuOOra >> addUsuario: aUser contraseña: aPass [
	|u|
	u:= Usuario nombre: aUser contrasena: aPass.
	usuarios add: u. 
	
]

{ #category : #initialization }
CuOOra >> addUsuario: aUser contraseña: aPass email: unMail [
	|u|
	u:= Usuario nombre: aUser contrasena: aPass email: unMail.
	usuarios add: u. 
	
]

{ #category : #adding }
CuOOra >> agregarPregunta: unaPregunta [
	preguntas add: unaPregunta.
]

{ #category : #adding }
CuOOra >> agregarTopico: unTopico [
	topicos add: unTopico.
]

{ #category : #accesing }
CuOOra >> calcularPuntaje: user [ 
	|pregUser|
	pregUser := self preguntasDeUser: user.
	^ (( pregUser size) * 20) +
			 (pregUser sumNumbers: [ :each | each calcularPuntaje ]) + (self  puntajeParticipaciones: user) .
]

{ #category : #accesing }
CuOOra >> eliminarPregunta: unaPregunta [ 
	|preg|
	preg:= preguntas detect: [ :p | p esIgualA: unaPregunta  ] 
	ifFound: [ (preg preguntaDeUser: unaPregunta user)
					ifTrue: [ unaPregunta eliminarRespuestas 
								preguntas remove: unaPregunta  ] ]. 
]

{ #category : #initialization }
CuOOra >> initialize [
	topicos := Set new.
	usuarios := Set new.
	preguntas := Set new.
]

{ #category : #accessing }
CuOOra >> preguntas [
	^ preguntas
]

{ #category : #accesing }
CuOOra >> preguntasDeUnTopico: unTopico [ 
	^ self preguntas select: [ :preg | preg preguntaDeTopico: unTopico ].
]

{ #category : #accesing }
CuOOra >> preguntasDeUser: user [
	^ preguntas select: [ :preg | preg preguntaDeUser: user ].
]

{ #category : #accesing }
CuOOra >> preguntasRelevantes: user [
	|pregRelevantes|
	pregRelevantes := OrderedCollection new.
	"pregRelevantes addAll: (self preguntasDeUnTopico: user topicoDeInteres ).
	pregRelevantes addAll: (user follows collect: [ :follower | self preguntasDeUser: follower ] )."
	^pregRelevantes .
]

{ #category : #accesing }
CuOOra >> puntajeParticipaciones: user [
	^ preguntas sumNumbers:  [ :preg | preg preguntaDeUserPuntaje: user ].
]

{ #category : #accesing }
CuOOra >> respuestasDePregunta: unaPregunta [
	"FALTA ordenar de manera decreciente por puntaje de likes"
	 ^ (usuarios collect: [ :user | user preguntasIncluye: unaPregunta ] ) respuestas .
]

{ #category : #accesing }
CuOOra >> respuestasDeUsuario: unUsuario [
	^ usuarios collect: [ :user | user respuestasDeUser: unUsuario  ].
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #utilities }
CuOOra >> usuario: unEmail protectedBy: contraseña [
	^ usuarios
		detect: [ :each | each email = unEmail & (each contrasena  = contraseña ) ]
		ifNone: [ nil ].
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]
