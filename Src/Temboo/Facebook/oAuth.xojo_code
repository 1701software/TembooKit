#tag Class
Protected Class oAuth
	#tag Method, Flags = &h0
		 Shared Function FinalizeOAuth(TembooApp As Temboo.TembooApplication, AppID As String, AppSecret As String, CallbackID As String, LongLivedToken As Boolean = False, Timeout As Integer = 20) As Temboo.Facebook.oAuth
		  // Initialize Variables
		  Dim response As String
		  Dim responseObject As New Temboo.Facebook.oAuth
		  
		  // Verify method parameters.
		  If (AppID = "" Or AppSecret = "" Or CallbackID = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Facebook.oAuth.FinalizeOAuth"
		    Raise te
		    Return Nil
		  End If
		  If (TembooApp = Nil) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing TembooApplication instance in Temboo.Facebook.oAuth.FinalizeOAuth"
		    Raise te
		    Return Nil
		  End If
		  If (Timeout < 0 Or Timeout > 60) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Timeout parameter in Temboo.Facebook.oAuth.FinalizeOAuth must be between 0-60 seconds."
		    Raise te
		    Return Nil
		  End If
		  
		  // Create TembooRequest object.
		  Dim tr As New Temboo.TembooRequest(TembooApp)
		  tr.AddInputValue("AppID", AppID)
		  tr.AddInputValue("AppSecret", AppSecret)
		  tr.AddInputValue("CallbackID", CallbackID)
		  If (LongLivedToken = True) Then
		    tr.AddInputValue("LongLivedToken", "1")
		  Else
		    tr.AddInputValue("LongLivedToken", "0")
		  End If
		  If (Timeout <> 20) Then
		    tr.AddInputValue("Timeout", Str(Timeout))
		  End If
		  
		  // Initialize Expiration Date of Access Token
		  responseObject.TokenExpirationDate = New Date
		  
		  // Send TembooRequest object.
		  response = tr.SendRequest("/Facebook/OAuth/FinalizeOAuth", "POST")
		  
		  // Let's decipher the response
		  Dim responseJSON As New JSONItem(response)
		  Dim outputJSON As JSONItem
		  outputJSON = responseJSON.Child("output")
		  responseObject.AccessToken = outputJSON.Lookup("AccessToken", "")
		  responseObject.ErrorMessage = outputJSON.Lookup("ErrorMessage", "")
		  responseObject.TokenExpirationDate.TotalSeconds = responseObject.TokenExpirationDate.TotalSeconds + CDbl(outputJSON.Lookup("Expires", "0")) ' Add the number of seconds
		  
		  // Return Response
		  Return responseObject
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function InitializeOAuth(TembooApp As Temboo.TembooApplication, AppID As String, CustomCallbackID As String = "", ForwardingURL As String = "", Scope As String = "") As Temboo.Facebook.oAuth
		  // Initialize Variables
		  Dim response As String
		  Dim responseObject As New Temboo.Facebook.oAuth
		  
		  // Verify method parameters.
		  If (AppID = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Facebook.oAuth.InitializeOAuth"
		    Raise te
		    Return Nil
		  End If
		  If (TembooApp = Nil) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing TembooApplication instance in Temboo.Facebook.oAuth.InitializeOAuth"
		    Raise te
		    Return Nil
		  End If
		  
		  // Create TembooRequest object.
		  Dim tr As New Temboo.TembooRequest(TembooApp)
		  tr.AddInputValue("AppID", AppID)
		  If (CustomCallbackID <> "") Then
		    tr.AddInputValue("CustomCallbackID", CustomCallbackID)
		  End if
		  If (ForwardingURL <> "") Then
		    tr.AddInputValue("ForwardingURL", ForwardingURL)
		  End If
		  If (Scope <> "") Then
		    tr.AddInputValue("Scope", Scope)
		  End If
		  
		  // Send TembooRequest object.
		  response = tr.SendRequest("/Facebook/OAuth/InitializeOAuth", "POST")
		  
		  // Let's decipher the response
		  Dim responseJSON As New JSONItem(response)
		  Dim outputJSON As JSONItem
		  outputJSON = responseJSON.Child("output")
		  responseObject.AuthorizationURL = outputJSON.Lookup("AuthorizationURL", "")
		  responseObject.CallbackID = outputJSON.Lookup("CallbackID", "")
		  
		  // Return Response
		  Return responseObject
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AccessToken As String
	#tag EndProperty

	#tag Property, Flags = &h0
		AuthorizationURL As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CallbackID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorMessage As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TokenExpirationDate As Date
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessToken"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AuthorizationURL"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CallbackID"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorMessage"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
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
