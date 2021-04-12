Class {
	#name : #HomePage,
	#superclass : #WAComponent,
	#category : #'CuOOra-ui'
}

{ #category : #callback }
HomePage >> createNewPost [
	self call: NewPostPage new.
]

{ #category : #callback }
HomePage >> darDislike: unPost [
	 unPost darDislike: self session user .
]

{ #category : #callback }
HomePage >> darLike: unPost [
	 unPost darLike: self session user.
]

{ #category : #callback }
HomePage >> elegirTopico [
	self call: ElegirTopicoComponent new.
]

{ #category : #callback }
HomePage >> findFriend [
	self call: FriendsFinderPage new.
]

{ #category : #accessing }
HomePage >> model [
	^ CuOOra soleInstance.
]

{ #category : #callback }
HomePage >> perfilUser: aUser [

	(self session user == aUser)
	ifTrue: [self call: (PerfilUserComponent user: aUser)].
	self call: (PerfilVisitorComponent new user: aUser).
]

{ #category : #rendering }
HomePage >> renderCabecera: aCanvas [
	aCanvas heading: 'CuOOra'. 
	self renderPerfilUserOn: aCanvas.
	aCanvas space.
	self renderLogoutButtonOn: aCanvas.
	aCanvas space.
	self renderbuttonsOn: aCanvas.

	
]

{ #category : #rendering }
HomePage >> renderContentOn: aCanvas [
	self renderCabecera: aCanvas.
	aCanvas horizontalRule.
	
	self renderPostsOn: aCanvas.
	aCanvas horizontalRule.
	
	"self renderFriendsOn: aCanvas.
	aCanvas horizontalRule."
	
	self renderTopicoInteresOn: aCanvas.
	aCanvas horizontalRule.
	
	aCanvas text: 'Registro de usuarios'.
	aCanvas
		unorderedList: [ self model usuarios
				do: [ :each | 
					aCanvas
						listItem:[
							aCanvas anchor
								callback: [ self perfilUser: each ];
								with: each nombre ]] ].
	aCanvas text: 'Topicos'.
	aCanvas
		unorderedList: [ self model topicos do: [ :each | aCanvas listItem: each nombre ] ]
]

{ #category : #rendering }
HomePage >> renderFriendsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Friends'.
	aCanvas
		unorderedList: [ self session user follows
				do: [ :each | 
					aCanvas
						listItem:
							[aCanvas anchor
								callback: [ self perfilUser: (self model buscarUsuario: each  nombre) ];
								with: each  nombre]] ].
	aCanvas anchor
		callback: [ self findFriend ];
		with: [ aCanvas button: 'Buscar Amigos' ]
]

{ #category : #rendering }
HomePage >> renderHomeButtonOn: aCanvas [
	aCanvas space.
	aCanvas anchor
		callback: [ self volverHome ];
		with: [ aCanvas button: 'Home' ].
	aCanvas space.
	aCanvas horizontalRule
]

{ #category : #rendering }
HomePage >> renderListItem: canvas post: each [
	canvas text: each text.
	canvas text: 'Realizada por: '.
	canvas anchor
		callback: [ self
				perfilUser: (CuOOra soleInstance buscarUsuario: each user nombre) ];
		with: each user nombre.
	canvas space.
	canvas anchor
		callback: [ self darLike: each ];
		with: 'like'.
	canvas space.
	canvas text: each cantLikes.
	canvas anchor
		callback: [ self darDislike: each ];
		with: 'Dislike'.
	canvas space.
	
]

{ #category : #rendering }
HomePage >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Logout' ] ]
]

{ #category : #rendering }
HomePage >> renderPerfilUserOn: aCanvas [.
	aCanvas anchor
			callback: [ self perfilUser: self session user];
			with: self session user nombre.
]

{ #category : #rendering }
HomePage >> renderPostsOn: canvas [
	canvas heading
			level: 2;
			with: 'Ultimas Preguntas'.
	canvas 
			unorderedList: [ 
				( self session model preguntasRelevantes: self session user )
				do: [ :each |  
					canvas listItem: [ 
								(canvas anchor 
								callback:[(self verPregunta: each)];
								with: each titulo).
							   canvas space.
								canvas text: 'Realizada por: '. 
								(canvas anchor 
									callback:[(self perfilUser: each user)];
									with: each user nombre).
								canvas space.
								canvas text: 'Topicos: '. 
								each topicos do:[ :topic |  canvas text: topic nombre. canvas space.].
								canvas space.
								canvas text:'Respuestas: '. canvas text: each cantRespuestas .
								canvas space.
								
								(canvas anchor 
									callback:[(self darLike: each)];
									with: 'like').
								canvas space.
								canvas text: each cantLikes.
								(canvas anchor 
									callback:[(self darDislike: each)];
									with: 'Dislike').
								
								canvas space.
								canvas text: each cantDislikes.]]].
	canvas anchor 
			callback: [ self createNewPost ];
			with: [ canvas button: 'Nueva Pregunta' ].
]

{ #category : #rendering }
HomePage >> renderTopicoInteresOn: aCanvas [
	aCanvas form:[
		aCanvas submitButton 
					callback: [ self elegirTopico ];	
					with: 'Elegir Topico de Interes'.].
]

{ #category : #rendering }
HomePage >> renderbuttonsOn: aCanvas [
	aCanvas anchor 
			callback: [ self answer];
			with: [ aCanvas button: 'volver' ].
		
]

{ #category : #callback }
HomePage >> verPregunta: unaPregunta [ 
	self call: (PreguntaComponent pregunta: unaPregunta ).
]

{ #category : #callback }
HomePage >> volverHome [
	self call: HomePage new.
]
