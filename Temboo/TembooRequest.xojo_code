#tag Class
Protected Class TembooRequest
	#tag Method, Flags = &h0
		Sub AddInputValue(Name As String, Value As Integer)
		  // Add Value to p_jsonInputs
		  p_jsonInputs.Value(Name) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddInputValue(Name As String, Value As String)
		  // Add Value to p_jsonInputs
		  p_jsonInputs.Value(Name) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(TembooApp As TembooApplication)
		  // Set p_tembooUsername
		  p_tembooApplication = TembooApp
		  
		  // Initialize JSON Inputs Dictionary
		  p_jsonInputs = New Dictionary()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendRequest(RequestURL As String, RequestMethod As String) As String
		  // Initialize Variables
		  Dim https As New HTTPSecureSocket
		  Dim content As String
		  Dim response As String
		  
		  // Create Temboo Request URL
		  //
		  // RequestURL should be passed in as the path following https://username.temboolive.com/temboo-api/1.0/choreos/Library
		  // For instance for Twitter oAuth "/Twitter/OAuth/InitializeOAuth"
		  // would be https://username.temboolive.com/temboo-api/1.0/choreos/Library/Twitter/OAuth/InitializeOAuth
		  //
		  Dim url() As String
		  url.Append("https://")
		  url.Append(p_tembooApplication.Username)
		  url.Append(".temboolive.com/temboo-api/1.0/choreos/Library")
		  url.Append(RequestURL)
		  
		  // Create Temboo Basic Authorization Header
		  Dim tempBasicAuth As String
		  tempBasicAuth = p_tembooApplication.AppName + ":" + p_tembooApplication.AppKey ' Format is AppName:AppKey
		  
		  // Set Request Headers for Temboo
		  https.SetRequestHeader("x-temboo-domain", "/" + p_tembooApplication.Username + "/master")
		  https.SetRequestHeader("Content-Type", "application/json")
		  https.SetRequestHeader("Accept", "application/json")
		  https.SetRequestHeader("Authorization", "Basic " + EncodeBase64(tempBasicAuth)) ' Base64 the AppName:AppKey
		  
		  // Convert p_jsonInputs Dictionary values to JSON object.
		  Dim jsonContent As New JSONItem
		  Dim jsonInputs As New JSONItem
		  Dim inputItem As JSONItem
		  For Each Key As String In p_jsonInputs.Keys
		    inputItem = New JSONItem
		    inputItem.Value("name") = Key
		    inputItem.Value("value") = p_jsonInputs.Lookup(Key, "")
		    jsonInputs.Append(inputItem)
		  Next
		  jsonContent.Child("inputs") = jsonInputs
		  
		  // Set Request Content for Temboo
		  https.SetRequestContent(jsonContent.ToString(), "application/json")
		  
		  // Send Temboo Request
		  response = https.SendRequest(RequestMethod, Join(url, ""), p_requestTimeoutInSeconds)
		  
		  // Return response
		  Return response
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private p_jsonInputs As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private p_requestTimeoutInSeconds As Integer = 30
	#tag EndProperty

	#tag Property, Flags = &h21
		Private p_tembooApplication As TembooApplication
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
