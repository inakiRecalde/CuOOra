Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion'
	],
	#category : #'CuOOra-model'
}

{ #category : #construction }
Topico class >> nombre: unNombre descripcion: unaDescripcion [ 
	^ self new nombre: unNombre descripcion: unaDescripcion 
]

{ #category : #accessing }
Topico >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Topico >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #accessing }
Topico >> esIgualA: unTopico [
 	^( nombre == unTopico nombre).
	
]

{ #category : #construction }
Topico >> initialize [ 
	nombre := ''.
	descripcion := ''.
]

{ #category : #accessing }
Topico >> nombre [
	^nombre .
]

{ #category : #accessing }
Topico >> nombre: anObject [
	nombre := anObject
]

{ #category : #construction }
Topico >> nombre: unNombre descripcion: unaDescripcion [ 
	nombre:= unNombre .
	descripcion:= unaDescripcion.
]
