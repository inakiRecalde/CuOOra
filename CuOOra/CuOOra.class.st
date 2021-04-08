Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
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
CuOOra >> agregarPregunta: unaPregunta aUsuario: user [
	user agregarPregunta: unaPregunta .
]

{ #category : #adding }
CuOOra >> agregarTopico: unTopico [
	topicos add: unTopico.
]

{ #category : #accesing }
CuOOra >> calcularPuntaje: unUsuario [
	^ unUsuario calcularPuntaje .
	
]

{ #category : #initialization }
CuOOra >> initialize [
	topicos := Set new.
	usuarios := Set new.
]

{ #category : #accesing }
CuOOra >> preguntasDeUnTopico: unTopico [ 
	"al eliminar la relacion bidireccional hay q buscarlos por usuarios/preguntas/topicos"
	^ usuarios collect: [ :user | user preguntasDeUnTopico: unTopico  ] .
]

{ #category : #accesing }
CuOOra >> preguntasRelevantesDeUsuario: usuario [
	^ usuario preguntasRelevantes: topicos.
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
