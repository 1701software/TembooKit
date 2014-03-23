#tag Class
Protected Class Tweets
	#tag Method, Flags = &h0
		 Shared Function StatusesUpdate(TembooApp As Temboo.TembooApplication, ConsumerKey As String, ConsumerSecret As String, AccessToken As String, AccessTokenSecret As String, StatusUpdate As String) As Boolean
		  // Initialize Variables
		  Dim response As String
		  
		  // Verify method parameters.
		  If (ConsumerKey = "" Or ConsumerSecret = "" Or AccessToken = "" Or AccessTokenSecret = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Twitter.Tweets.StatusesUpdate"
		    Raise te
		    Return False
		  End If
		  If (TembooApp = Nil) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing TembooApplication instance in Temboo.Twitter.Tweets.StatusesUpdate"
		    Raise te
		    Return False
		  End If
		  If (StatusUpdate = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Tweet in Temboo.Twitter.Tweets.StatusesUpdate"
		    Raise te
		    Return False
		  End If
		  If (StatusUpdate.Len > 160) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Tweet must be no longer than 160 characters in Temboo.Twitter.Tweets.StatusesUpdate"
		    Raise te
		    Return False
		  End If
		  
		  // Create TembooRequest object.
		  Dim tr As New Temboo.TembooRequest(TembooApp)
		  tr.AddInputValue("ConsumerSecret", ConsumerSecret)
		  tr.AddInputValue("ConsumerKey", ConsumerKey)
		  tr.AddInputValue("AccessToken", AccessToken)
		  tr.AddInputValue("AccessTokenSecret", AccessTokenSecret)
		  tr.AddInputValue("StatusUpdate", StatusUpdate)
		  
		  // Send TembooRequest object.
		  response = tr.SendRequest("/Twitter/Tweets/StatusesUpdate", "POST")
		  
		  // Return Response
		  Return True
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
