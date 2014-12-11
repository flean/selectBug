Schemas = {}

Schemas.optionsSchema = new SimpleSchema
  label:
    type:String
    label:"label"
  value:
    type:String
    label:"Value"

@Options = new Meteor.Collection "options"

Options.attachSchema(Schemas.optionsSchema)

Schemas.testSchema = new SimpleSchema
	itemArray:
		type:String
		label:"Static Array select"
		allowedValues: ['0','1','2','3', '4','5']
		autoform:
			options:[
				{label:'Ok' , value:"0"}
				{label:'Contact' , value:"1"}
				{label:'Payment Issues' , value:"2"}
				{label:'24hr' , value:"3"}
				{label:'2 Week' , value:"4"}
				{label:'6 Week' , value:"5"}
		  ]

	item2:
		type:String
		label:"Mapped Options select"
		allowedValues: ['0','1','2','3', '4','5']
		autoform:
				options: ->
					_.map Options.find().fetch(),(item, i) ->
						{label: item.label, value: item.value}

	'item.nested':
		type:String
		label:"Nested and Mapped select"
		allowedValues: ['0','1','2','3', '4','5']
		autoform:
				options: ->
					_.map Options.find().fetch(),(item, i) ->
						{label: item.label, value: item.value}


	'item3.nest.nested':
		type:String
		label:"Nestedx2 and Mapped select"
		allowedValues: ['0','1','2','3', '4','5']
		autoform:
				options: ->
					_.map Options.find().fetch(),(item, i) ->
						{label: item.label, value: item.value}


@Test = new Meteor.Collection "test"

Test.attachSchema(Schemas.testSchema)
