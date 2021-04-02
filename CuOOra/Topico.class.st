Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion',
		'preguntas'
	],
	#category : #'CuOOra-model'
}

{ #category : #construction }
Topico class >> nombre: unNombre descripcion: unaDescripcion [ 
	^ self new nombre: unNombre descripcion: unaDescripcion 
]

{ #category : #accessing }
Topico >> esIgualA: unTopico [
 	^(nombre equals: unTopico).
	
]

{ #category : #accessing }
Topico >> nombre [
	^nombre .
]

{ #category : #construction }
Topico >> nombre: unNombre descripcion: unaDescripcion [ 
	nombre:= unNombre .
	descripcion:= unaDescripcion.
]

{ #category : #accessing }
Topico >> preguntas [
	^preguntas .
]
