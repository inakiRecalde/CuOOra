Class {
	#name : #HomePage,
	#superclass : #WAComponent,
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
HomePage >> renderContentOn: canvas [
	
	canvas heading: 'Welcome to CuOOra ' , self session user nombre.
]
