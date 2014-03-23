#tag Class
Protected Class Email
	#tag Method, Flags = &h0
		 Shared Function SendEmail(TembooApp As Temboo.TembooApplication, Password As String, Username As String, FromAddress As String, MessageBody As String, Port As Integer, Server As String, Subject As String, ToAddress As String, CC As String = "", BCC As String = "") As String
		  // Initialize Variables
		  Dim response As String
		  
		  // Verify method parameters.
		  If (TembooApp = Nil) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing TembooApplication instance in Temboo.Twitter.oAuth.FinalizeOAuth"
		    Raise te
		    Return ""
		  End If
		  If (FromAddress = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Utilities.Email.SendEmail"
		    Raise te
		    Return ""
		  End If
		  If (MessageBody = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Utilities.Email.SendEmail"
		    Raise te
		    Return ""
		  End If
		  If (Server = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Utilities.Email.SendEmail"
		    Raise te
		    Return ""
		  End If
		  If (Subject = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Utilities.Email.SendEmail"
		    Raise te
		    Return ""
		  End If
		  If (ToAddress = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Utilities.Email.SendEmail"
		    Raise te
		    Return ""
		  End If
		  
		  // Create TembooRequest object.
		  Dim tr As New Temboo.TembooRequest(TembooApp)
		  If (Password <> "") Then
		    tr.AddInputValue("Password", Password)
		  End If
		  If (Username <> "") Then
		    tr.AddInputValue("Username", Username)
		  End If
		  tr.AddInputValue("FromAddress", FromAddress)
		  tr.AddInputValue("MessageBody", MessageBody)
		  tr.AddInputValue("Port", Str(Port))
		  tr.AddInputValue("Server", Server)
		  tr.AddInputValue("ToAddress", ToAddress)
		  tr.AddInputValue("Subject", Subject)
		  If (CC <> "") Then
		    tr.AddInputValue("CC", CC)
		  End If
		  If (BCC <> "") Then
		    tr.AddInputValue("BCC", BCC)
		  End If
		  
		  // Send TembooRequest object.
		  response = tr.SendRequest("/Utilities/Email/SendEmail", "POST")
		  
		  // Return Response
		  Return response
		End Function
	#tag EndMethod


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
