Class {
	#name : #Posteo,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'likes',
		'dislikes'
	],
	#category : #'CuOOra-model'
}

{ #category : #'adding/removing' }
Posteo >> chequearCol: aCol user: aUser [
	|interac |
	interac:= aCol detect: [ :interaccion | interaccion esIgualA: aUser ] 
	ifFound: [ aCol remove: interac ] .
]

{ #category : #'adding/removing' }
Posteo >> darDislike: aUser [
	|in|
	in := dislikes detect: [ :interaccion | interaccion esIgualA: aUser ] 
	ifFound: [ dislikes remove: in ]
	ifNone:  [ dislikes add: (Interacciones user: aUser).
		self chequearCol: likes user: aUser . ].
]

{ #category : #'adding/removing' }
Posteo >> darLike: aUser [
	|in|
	in := likes detect: [ :interaccion | interaccion esIgualA: aUser ] 
	ifFound: [ likes remove: in ]
	ifNone:  [ likes add: (Interacciones user: aUser).
		self chequearCol: dislikes user: aUser . ].
]

{ #category : #'adding/removing' }
Posteo >> eliminarParticipaciones [
	likes removeAll .
	dislikes removeAll .
	self eliminarRespuestas.
]

{ #category : #abstract }
Posteo >> eliminarRespuestas [ 
	self subclassResponsibility .
]

{ #category : #initialization }
Posteo >> initialize [ 
	fecha:= DateAndTime now.
	likes:= Interacciones new.
	dislikes := Interacciones new. 
]

{ #category : #accesing }
Posteo >> puntajeParticipaciones [ 
	^ likes size - dislikes size 
]
