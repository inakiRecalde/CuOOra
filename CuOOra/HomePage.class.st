Class {
	#name : #HomePage,
	#superclass : #WAComponent,
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
HomePage >> renderContentOn: canvas [
	canvas paragraph: 'CuOOra'.
]
