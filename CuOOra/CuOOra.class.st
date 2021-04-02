Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#category : #'CuOOra-model'
}

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

{ #category : #adding }
CuOOra >> crearUsuario: unNombre contrasena: unaContra [ 
	usuarios add: (Usuario nombre: unNombre contrasena: unaContra) .
]

{ #category : #initialization }
CuOOra >> initialize [
	topicos := Set new.
	usuarios := Set new.
]

{ #category : #accesing }
CuOOra >> preguntasDeUnTopico: unTopico [ 
	"al eliminar la relacion bidireccional hay q buscarlos por usuarios/preguntas/topicos"
]

{ #category : #accesing }
CuOOra >> preguntasRelevantesDeUsuario: usuario [
	^ usuario preguntasRelevantes: topicos.
]

{ #category : #accesing }
CuOOra >> respuestasDePreguntas: unaPregunta [
	 ^ (usuarios detect: [ :user | user preguntasIncluye: unaPregunta ] ) respuestas .
]

{ #category : #accesing }
CuOOra >> respuestasDeUsuario: unUsuario [
	^ unUsuario respuestas .
]
