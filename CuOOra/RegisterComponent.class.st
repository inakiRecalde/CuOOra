Class {
	#name : #RegisterComponent,
	#superclass : #WelcomePageComponent,
	#instVars : [
		'name'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
RegisterComponent >> name [
	^ name
]

{ #category : #accessing }
RegisterComponent >> name: anObject [
	name := anObject
]

{ #category : #callback }
RegisterComponent >> register [
	| theUser |
	theUser := Usuario nombre: name contrasena: pass email: email.
	self session model addUsuario: theUser.
	"pordria evaluar que retorna addUsuario y mostrar cartel de user registrado ?"
	self answer .
]

{ #category : #rendering }
RegisterComponent >> registerAndLogin [
	| theUser |
	theUser := User name: name email: email password: password.
	self model addUser: theUser.
	self proceedWith: theUser
]

{ #category : #rendering }
RegisterComponent >> renderButtonsOn: aCanvas [ 
	self renderSignUpButtonOn: aCanvas
]

{ #category : #rendering }
RegisterComponent >> renderContentOn: canvas [
	canvas heading: 'CuOOra'.
	canvas horizontalRule .
	canvas form: [  
	self renderInputElementsOn: canvas.
	self renderSignInButtonOn: canvas. 
	canvas text: 'una vez registrado volvera a la pagina de login'. ]
]

{ #category : #rendering }
RegisterComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Name'.
	aCanvas paragraph: [ aCanvas textInput on: #name of: self ].
	super renderInputElementsOn: aCanvas
]

{ #category : #rendering }
RegisterComponent >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self register ];
		with: 'Registrar'
]

{ #category : #rendering }
RegisterComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerAndLogin ];
		with: 'Register'
]
