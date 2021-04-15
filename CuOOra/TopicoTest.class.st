Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#category : #'CuOOra-model'
}

{ #category : #accessing }
TopicoTest >> testCompararTopicos [
	|topico topico2|
	topico := Topico nombre: 'futbol' descripcion: 'deporte con pelota'.
	topico2 := Topico nombre: 'futbol' descripcion: 'deporte con pelota'.
	self assert: topico descripcion equals: 'deporte con pelota'.
	self assert: topico nombre equals: 'futbol'.
	self assert: (topico esIgualA: topico2)
]

{ #category : #accessing }
TopicoTest >> testConstructor [
	|topico|
	topico := Topico nombre: 'futbol' descripcion: 'deporte con pelota'.
	self assert: topico descripcion equals: 'deporte con pelota'.
	self assert: topico nombre equals: 'futbol'.
]
