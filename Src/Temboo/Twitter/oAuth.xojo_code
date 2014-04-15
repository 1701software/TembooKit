#tag Class
Protected Class oAuth
	#tag Method, Flags = &h0
		 Shared Function FinalizeOAuth(TembooApp As Temboo.TembooApplication, ConsumerKey As String, ConsumerSecret As String, CallbackID As String, OAuthTokenSecret As String, Timeout As Integer = 20) As Temboo.Twitter.oAuth
		  // Initialize Variables
		  Dim response As String
		  Dim responseObject As New Temboo.Twitter.oAuth
		  
		  // Verify method parameters.
		  If (ConsumerKey = "" Or ConsumerSecret = "" Or CallbackID = "" Or OAuthTokenSecret = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Twitter.oAuth.FinalizeOAuth"
		    Raise te
		    Return Nil
		  End If
		  If (TembooApp = Nil) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing TembooApplication instance in Temboo.Twitter.oAuth.FinalizeOAuth"
		    Raise te
		    Return Nil
		  End If
		  If (Timeout < 0 Or Timeout > 60) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Timeout parameter in Temboo.Twitter.oAuth.FinalizeOAuth must be between 0-60 seconds."
		    Raise te
		    Return Nil
		  End If
		  
		  // Create TembooRequest object.
		  Dim tr As New Temboo.TembooRequest(TembooApp)
		  tr.AddInputValue("ConsumerSecret", ConsumerSecret)
		  tr.AddInputValue("ConsumerKey", ConsumerKey)
		  tr.AddInputValue("CallbackID", CallbackID)
		  tr.AddInputValue("OAuthTokenSecret", OAuthTokenSecret)
		  If (Timeout <> 20) Then
		    tr.AddInputValue("Timeout", Str(Timeout))
		  End If
		  
		  // Send TembooRequest object.
		  response = tr.SendRequest("/Twitter/OAuth/FinalizeOAuth", "POST")
		  
		  // Let's decipher the response
		  Dim responseJSON As New JSONItem(response)
		  Dim outputJSON As JSONItem
		  outputJSON = responseJSON.Child("output")
		  responseObject.AccessToken = outputJSON.Lookup("AccessToken", "")
		  responseObject.AccessTokenSecret = outputJSON.Lookup("AccessTokenSecret", "")
		  responseObject.ScreenName = outputJSON.Lookup("ScreenName", "")
		  responseObject.UserID = outputJSON.Lookup("UserID", "")
		  
		  // Return Response
		  Return responseObject
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function InitializeOAuth(TembooApp As Temboo.TembooApplication, ConsumerKey As String, ConsumerSecret As String, ForwardingURL As String = "") As Temboo.Twitter.oAuth
		  // Initialize Variables
		  Dim response As String
		  Dim responseObject As New Temboo.Twitter.oAuth
		  
		  // Verify method parameters.
		  If (ConsumerKey = "" Or ConsumerSecret = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Twitter.oAuth.InitializeOAuth"
		    Raise te
		    Return Nil
		  End If
		  If (TembooApp = Nil) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing TembooApplication instance in Temboo.Twitter.oAuth.InitializeOAuth"
		    Raise te
		    Return Nil
		  End If
		  
		  // Create TembooRequest object.
		  Dim tr As New Temboo.TembooRequest(TembooApp)
		  tr.AddInputValue("ConsumerSecret", ConsumerSecret)
		  tr.AddInputValue("ConsumerKey", ConsumerKey)
		  If (ForwardingURL <> "") Then
		    tr.AddInputValue("ForwardingURL", ForwardingURL)
		  End If
		  
		  // Send TembooRequest object.
		  response = tr.SendRequest("/Twitter/OAuth/InitializeOAuth", "POST")
		  
		  // Let's decipher the response
		  Dim responseJSON As New JSONItem(response)
		  Dim outputJSON As JSONItem
		  outputJSON = responseJSON.Child("output")
		  responseObject.AuthorizationURL = outputJSON.Lookup("AuthorizationURL", "")
		  responseObject.CallbackID = outputJSON.Lookup("CallbackID", "")
		  responseObject.OAuthTokenSecret = outputJSON.Lookup("OAuthTokenSecret", "")
		  
		  // Return Response
		  Return responseObject
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AccessToken As String
	#tag EndProperty

	#tag Property, Flags = &h0
		AccessTokenSecret As String
	#tag EndProperty

	#tag Property, Flags = &h0
		AuthorizationURL As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CallbackID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		OAuthTokenSecret As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ScreenName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		UserID As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessToken"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessTokenSecret"
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
			Name="OAuthTokenSecret"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScreenName"
			Group="Behavior"
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
		#tag ViewProperty
			Name="UserID"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
