Class {
	#name : #PerfilUserComponent,
	#superclass : #PerfilComponent,
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
PerfilUserComponent class >> user: aUser [
	^self new 
		user: aUser.
]

{ #category : #rendering }
PerfilUserComponent >> renderContentOn: aCanvas [
	self renderCabecera: aCanvas .
	self renderBackButtonOn: aCanvas.
	self renderNombreOn: aCanvas.
	self renderPreguntasOn: aCanvas.
	self renderSeguidosOn: aCanvas.
]

{ #category : #rendering }
PerfilUserComponent >> renderNombreOn: aCanvas [
	aCanvas heading
			level: 2;
			with: 'Perfil de: ',self session user nombre.
	
]

{ #category : #rendering }
PerfilUserComponent >> renderPreguntasOn: aCanvas [

	aCanvas heading
			level: 2;
			with:' Mis preguntas'.
	super renderPreguntasOn: aCanvas.
]

{ #category : #rendering }
PerfilUserComponent >> renderSeguidosOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Friends'.
	aCanvas
		unorderedList: [ self session user follows
				do: [ :each | 
					aCanvas
						listItem:
							[aCanvas anchor
								callback: [ self perfilUser: 
									( CuOOra soleInstance  buscarUsuario: each  nombre) ];
								with: each  nombre]] ].
]
