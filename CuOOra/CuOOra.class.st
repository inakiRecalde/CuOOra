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
	self pruebas.
]

{ #category : #accessing }
CuOOra >> preguntas [
	^ preguntas
]

{ #category : #accesing }
CuOOra >> preguntasDeSeguidores: follows [
	|pregs|
	pregs:= OrderedCollection new.
	follows do: [ :each | pregs addAll: (self preguntasDeUser: each) ] .
	^pregs.
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
	pregRelevantes := Set new.
	pregRelevantes addAll: (self preguntasDeUnTopico: user topicoDeInteres ).
	pregRelevantes addAll: (self preguntasDeSeguidores: user follows ).
	^pregRelevantes.
]

{ #category : #initialization }
CuOOra >> pruebas [

| aguero messi ronaldo  obama trump admin preg topic|
	
	"Nuevo topic"
	topic := Topico nombre:'Futbol' descripcion:'todo sobre futbol' .
	self agregarTopico: topic.
	"Nuevo usuario"
	messi := Usuario nombre: 'Messi' contrasena: 'messi' email: 'Messi@gmail.com'.
	"nueva preg"
	preg :=Pregunta titulo: 'Me voy del barsa?' descripcion: 'Que dicen gente, me voy al city aunque se vaya el kun o me voy con neymar al psg???' topicos: topic user: messi .
	
	self addUsuario: messi.
	self agregarPregunta: preg.
	
	"Nuevo usuario"
	
	ronaldo := Usuario nombre: 'Ronaldo' contrasena: 'ronaldo' email: 'Ronaldo@gmail.com'.
	preg :=Pregunta titulo: 'Que dicen sigo en la juve?' descripcion: 'Fua chaval es que no se si irme con messi al psg y que nos vean juntos o si me quedo en la aburrida liga italiana. 100 likes y me voy!!!' topicos: topic user: ronaldo .
	self addUsuario: ronaldo.
	self agregarPregunta: preg.
	
		
	"Nuevo usuario"
		aguero := Usuario nombre: 'Aguero' contrasena: 'aguero' email: 'Aguero@gmail.com'.
	preg :=Pregunta titulo: 'Encuesta gente' descripcion: 'Psg con messi? o sigo stremeando??? los del rojo sigan esperando jaja' 	topicos: topic user: aguero .
		aguero topicoDeInteres: topic.
		self addUsuario: aguero .
		self agregarPregunta: preg.
		
		aguero seguirUser: messi.
		aguero  seguirUser: ronaldo.
	
	"Nuevo topic"
	
	topic := Topico nombre:'Politica' descripcion:'todo sobre politica' .
	self agregarTopico: topic.
	
		"Nuevo usuario"
	obama := Usuario nombre: 'Obama' contrasena: 'obama' email: 'Obama@gmail.com'.
	preg :=Pregunta titulo: 'Did you buy my new book?' descripcion: 'I just released my new book on the secret passages of the white house and a 30% discount offer !!' topicos: topic user: obama .
	self addUsuario: obama.
	self agregarPregunta: preg.
	
	"Nuevo usuario"
	trump := Usuario nombre: 'Trump' contrasena: 'trump' email: 'Trump@gmail.com'.
	preg :=Pregunta titulo: 'Help me now !' descripcion: 'Does anyone know where to buy orange paint?' topicos: topic  user: trump .
	self addUsuario: trump.
	self agregarPregunta: preg.
	
	"Nuevo usuario"
	admin := Usuario nombre: 'admin' contrasena: 'admin' email: 'admin@gmail.com'.
	self addUsuario: admin.
	admin seguirUser: messi.
	admin seguirUser: ronaldo.
	admin seguirUser: aguero.
	admin seguirUser: obama.
	admin seguirUser: trump.
	"Topicos"
	topic := Topico nombre:'Futbol' descripcion:'todo sobre futbol' .
	self agregarTopico: topic.
	topic := Topico nombre:'Politica' descripcion:'todo sobre politica' .
	self agregarTopico: topic.

	
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
