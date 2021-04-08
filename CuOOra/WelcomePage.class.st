Class {
	#name : #WelcomePage,
	#superclass : #WAComponent,
	#instVars : [
		'email',
		'pass'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
WelcomePage >> email [
	^ email
]

{ #category : #accessing }
WelcomePage >> email: anObject [
	email := anObject
]

{ #category : #callbacks }
WelcomePage >> loguear [
	(self model usuario: email protectedBy: pass)
		ifNotNil: [ :it | self proceedWith: it ].
	email := nil.
	pass := nil.
]

{ #category : #model }
WelcomePage >> model [
	^ CuOOra soleInstance
]

{ #category : #accessing }
WelcomePage >> pass [
	^ pass
]

{ #category : #accessing }
WelcomePage >> pass: anObject [
	pass := anObject
]

{ #category : #private }
WelcomePage >> proceedWith: aUser [
	self session user: aUser. 
	self call: HomePage new.
]

{ #category : #callbacks }
WelcomePage >> registerNewUser [
	self call: RegisterPage new.
]

{ #category : #rendering }
WelcomePage >> renderContentOn: canvas [
	canvas heading: 'CuOOra'.
	canvas horizontalRule .
		canvas
		form: [
			self renderInputElementsOn: canvas.
			canvas button
				callback: [ self loguear ];
				with: 'Iniciar sesion' .
			canvas button
				callback: [ self registerNewUser ];
				with: 'Registrarse' ]
	
]

{ #category : #rendering }
WelcomePage >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Email'.
	aCanvas paragraph: [ aCanvas textInput on: #email of: self ].
	aCanvas label: 'Password'.
	aCanvas paragraph: [ aCanvas passwordInput on: #pass of: self ]
]

{ #category : #rendering }
WelcomePage >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerNewUser ];
		with: 'Registrarse'.
]
