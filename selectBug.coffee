
if Meteor.isClient
  ## counter starts at 0
  Session.setDefault("counter", 0)

  Template.hello.helpers
    docTest: () ->
      Test.findOne()

  Template.hello.events


if Meteor.isServer
  Meteor.startup ->
    ## code to run on server at startup
    if Options.find().count() is 0
      options = [
			    {label:'Ok' , value:"0"}
			    {label:'Contact' , value:"1"}
  				{label:'Payment Issues' , value:"2"}
  				{label:'24hr' , value:"3"}
  				{label:'2 Week' , value:"4"}
  				{label:'6 Week' , value:"5"}
      ]
      _.each options, (option) ->
        console.log option.label
        Options.insert option

    if Test.find().count() is 0
        Test.insert
          itemArray:'0'
          item2:'1'
          item:
            nested:'2'
          item3:
            nest:
              nested:'3'
