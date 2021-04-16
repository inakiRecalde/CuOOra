"
| application |
    application := WAAdmin register: WelcomePageComponent asApplicationAt: 'Welcome'.
    application preferenceAt: #sessionClass put: SessionWithUser .
"
Class {
	#name : #WelcomePageComponent,
	#superclass : #WAComponent,
	#instVars : [
		'email',
		'pass'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
WelcomePageComponent >> email [
	^ email
]

{ #category : #accessing }
WelcomePageComponent >> email: anObject [
	email := anObject
]

{ #category : #callbacks }
WelcomePageComponent >> loguear [
	(self model usuario: email protectedBy: pass)
		ifNotNil: [ :it | self proceedWith: it ].
	email := nil.
	pass := nil.
 "CuOOra clearSoleInstance" .
]

{ #category : #model }
WelcomePageComponent >> model [
	^ CuOOra soleInstance
]

{ #category : #accessing }
WelcomePageComponent >> pass [
	^ pass
]

{ #category : #accessing }
WelcomePageComponent >> pass: anObject [
	pass := anObject
]

{ #category : #private }
WelcomePageComponent >> proceedWith: aUser [
	self session user: aUser. 
	self call: HomeComponent new.
]

{ #category : #callbacks }
WelcomePageComponent >> registerNewUser [
	self call: RegisterComponent new.
]

{ #category : #rendering }
WelcomePageComponent >> renderContentOn: canvas [
	canvas heading: 'CuOOra'.
	canvas horizontalRule .
		canvas
		form: [
			self renderInputElementsOn: canvas.
			canvas button
				callback: [ self loguear ];
				with: 'Iniciar sesion' .
			self renderSignUpButtonOn: canvas ].

	
]

{ #category : #rendering }
WelcomePageComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Ingrese su email o su usuario'.
	aCanvas paragraph: [ aCanvas textInput on: #email of: self ].
	aCanvas label: 'Ingrese su contraseña'.
	aCanvas paragraph: [ aCanvas passwordInput on: #pass of: self ]
]

{ #category : #rendering }
WelcomePageComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerNewUser ];
		with: 'Registrarse'.
]
