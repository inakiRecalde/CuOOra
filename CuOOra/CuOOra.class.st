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

{ #category : #'as yet unclassified' }
CuOOra class >> constructorInterface [
	^ self new 
			pruebas .
]

{ #category : #accessing }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self constructorInterface]
]

{ #category : #initialization }
CuOOra >> addUsuario: aUser [
		^ usuarios
		detect: [ :each | 
			each email = aUser email | (each nombre = aUser nombre) ]
		ifNone: [  usuarios add: aUser].
]

{ #category : #adding }
CuOOra >> agregarPregunta: unaPregunta [
	preguntas add: unaPregunta.
]

{ #category : #adding }
CuOOra >> agregarTopico: unTopico [
	topicos detect: [ :topic | topic esIgualA: unTopico ]
	 ifNone:[topicos add: unTopico]
]

{ #category : #accesing }
CuOOra >> buscarUsuario: unNombre [
	^ usuarios detect: [ :user | user nombre == unNombre ].
]

{ #category : #accesing }
CuOOra >> calcularPuntaje: user [ 
	|pregUser|
	pregUser := self preguntasDeUser: user.
	^ (( pregUser size) * 20) +
			 (pregUser sumNumbers: [ :each | each calcularPuntaje ]) + (self  puntajeParticipaciones: user) .
]

{ #category : #accesing }
CuOOra >> elegirTopicoInteres: aUser topico: topico [ 
	topicos add: topico.
	aUser agregarTopico: topico.

]

{ #category : #accesing }
CuOOra >> eliminarPregunta: unaPregunta [
	preguntas
		detect: [ :p | p esIgualA: unaPregunta ]
		ifFound: [ :it | (it preguntaDeUser: unaPregunta user)
				ifTrue:
					[ unaPregunta eliminarRespuestas.
					preguntas remove: unaPregunta ] ]
]

{ #category : #private }
CuOOra >> incluyePregunta: unaPregunta [
	^preguntas includes: unaPregunta.
]

{ #category : #private }
CuOOra >> incluyeTopico: unTopico [
	^topicos includes: unTopico.
]

{ #category : #private }
CuOOra >> incluyeUsuario: unUser [
	^usuarios includes: unUser.
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
CuOOra >> preguntasDeSeguidores: follows [
	^ preguntas select: [ :each | follows includes: each user ].
]

{ #category : #accesing }
CuOOra >> preguntasDeUnTopico: unTopico [ 
	^ self preguntas select: [ :preg | preg preguntaDeTopico: unTopico ].
]

{ #category : #accesing }
CuOOra >> preguntasDeUser: aUser [
	^ preguntas select: [ :each | each esDe: aUser ].
]

{ #category : #accesing }
CuOOra >> preguntasRelevantes: user [
	^(self preguntasDeUnTopico: user topicoDeInteres ) union: 
		(self preguntasDeSeguidores: user follows ).
]

{ #category : #initialization }
CuOOra >> pruebas [

| pedro diego  juan oo1 test smalltalk admin preg  topicos1 |
	topicos1:=  OrderedCollection new.
	
	"Nuevo topic"
	oo1 := Topico nombre:'OO1' descripcion:'Información sobre la materia OO1' .
	test := Topico nombre:' Test de unidad' descripcion:'Información sobre los test' .
	smalltalk := Topico nombre:'Smalltalk' descripcion:'Información sobre Smalltalk' .
	self agregarTopico: oo1.
	self agregarTopico: test.
	self agregarTopico: smalltalk.
	
	"Usuarios: pedro@cuoora.com, diego@cuoora.com, juan@cuoora.com"
	"Nuevo usuario"
	pedro := Usuario nombre: 'pedro' contrasena: 'pedro' email: 'pedro@cuoora.com@gmail.com'.
	topicos1 add:oo1.
	topicos1 add: test.
	preg :=Pregunta titulo: 'Duda metodo setUp' descripcion: '¿Para qué sirve el método SetUp?' topicos: topicos1 user: pedro .
	self agregarPregunta: preg.
	self addUsuario: pedro.
	"Nuevo usuario"
	juan := Usuario nombre: 'juan' contrasena: 'juan@cuoora.com' email: 'juan@cuoora.com'.
	self addUsuario: juan.
	self agregarPregunta: preg.
	"Nuevo usuario"
	topicos1:=  OrderedCollection new.
	topicos1 add:oo1.
	topicos1 add: smalltalk.
	diego := Usuario nombre: 'diego' contrasena: 'diego@cuoora.com' email: 'diego@cuoora.com'.
	preg :=Pregunta titulo: 'Ayuda con error SmallTalk' descripcion: '¿Qué significa #messageNotUnderstood?' topicos:topicos1 user: diego .
	self addUsuario: diego.
	self agregarPregunta: preg.
	
	
	
	
	"relaciones"
	juan seguirUser: diego.
	pedro seguirUser: juan.
	
	
	
	
	
	
	"Nuevo usuario"
	admin := Usuario nombre: 'admin' contrasena: 'admin' email: 'admin@gmail.com'.
	self addUsuario: admin.
	


	
]

{ #category : #accesing }
CuOOra >> puntajeParticipaciones: user [
	^ preguntas sumNumbers:  [ :preg | preg userPuntaje: user ].
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

{ #category : #utility }
CuOOra >> usersMatchingNamePart: aString [
	^ usuarios
		select:
			[ :each | each nombre asLowercase includesSubstring: aString asLowercase ]
]

{ #category : #utilities }
CuOOra >> usuario: unEmail protectedBy: contraseña [
	^ usuarios
		detect: [ :each | 
			((each email = unEmail) | (each nombre = unEmail)
				& (each contrasena = contraseña)) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]
