Class {
	#name : #Posteo,
	#superclass : #Object,
	#instVars : [
		'text',
		'fecha',
		'likes',
		'dislikes',
		'user'
	],
	#category : #'CuOOra-model'
}

{ #category : #accesing }
Posteo >> cantDislikes [
	^dislikes size.
]

{ #category : #accesing }
Posteo >> cantLikes [
	^likes size.
]

{ #category : #'adding/removing' }
Posteo >> chequearCol: aCol user: aUser [
	aCol detect: [ :interaccion | interaccion esDe: aUser ] 
	ifFound: [ :it | aCol remove: it] .
]

{ #category : #'adding/removing' }
Posteo >> darDislike: aUser [
	 dislikes detect: [ :interaccion | interaccion esDe: aUser ] 
	ifFound: [ :it | dislikes remove: it ]
	ifNone:  [ dislikes add: (Interacciones user: aUser).
		self chequearCol: likes user: aUser . ].
]

{ #category : #'adding/removing' }
Posteo >> darLike: aUser [
	 likes detect: [ :interaccion | interaccion esDe: aUser ] 
	ifFound: [ :it | likes remove: it ]
	ifNone:  [ likes add: (Interacciones user: aUser).
		self chequearCol: dislikes user: aUser . ].
]

{ #category : #accessing }
Posteo >> dislikes [
	^ dislikes
]

{ #category : #'adding/removing' }
Posteo >> eliminarParticipaciones [
	likes removeAll .
	dislikes removeAll .
	self eliminarRespuestas.
]

{ #category : #accesing }
Posteo >> esDe: aUser [
	^ user == aUser.
]

{ #category : #accessing }
Posteo >> fecha [
	^ fecha
]

{ #category : #initialization }
Posteo >> initialize [ 
	fecha:= DateAndTime now.
	likes:= OrderedCollection  new.
	dislikes := OrderedCollection new. 
]

{ #category : #accessing }
Posteo >> likes [
	^ likes
]

{ #category : #accesing }
Posteo >> puntajeParticipaciones [ 
	^ likes size - dislikes size 
]

{ #category : #accessing }
Posteo >> text [
	^ text
]

{ #category : #accessing }
Posteo >> user [
	^ user
]

{ #category : #accessing }
Posteo >> user: anObject [
	user := anObject
]

{ #category : #abstract }
Posteo >> userPuntaje: aUser [
	self subclassResponsibility .
]
