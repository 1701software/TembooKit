#tag Class
Protected Class Publishing
	#tag Method, Flags = &h0
		 Shared Function CreateAlbum(TembooApp As Temboo.TembooApplication, AccessToken As String, Album_Name as String,profile_id as string) As Temboo.Facebook.Publishing
		  // Initialize Variables
		  Dim response As String
		  Dim responseObject As New Temboo.Facebook.Publishing
		  
		  // Verify method parameters.
		  If (TembooApp = Nil) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing TembooApplication instance in Temboo.Facebook.Publishing.CreateAlbum"
		    Raise te
		    Return Nil
		  End If
		  
		  If (AccessToken = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Access Token in Temboo.Facebook.Publishing.CreateAlbum"
		    Raise te
		    Return Nil
		  End If
		  
		  If (Album_Name = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Album Name in Temboo.Facebook.Publishing.CreateAlbum"
		    Raise te
		    Return Nil
		  End If
		  
		  
		  // Create TembooRequest object.
		  Dim tr As New Temboo.TembooRequest(TembooApp)
		  tr.AddInputValue("AccessToken", AccessToken)
		  
		  If (Album_Name <> "") Then
		    tr.AddInputValue("Name", Album_Name)
		    tr.AddInputValue("ProfileID",profile_id)
		  End If
		  
		  // Send TembooRequest object.
		  response = tr.SendRequest("/Facebook/Publishing/CreateAlbum", "POST")
		  
		  // Let's decipher the response
		  Dim responseJSON As New JSONItem(response)
		  Dim outputJSON As JSONItem
		  outputJSON = responseJSON.Child("output")
		  responseObject.ID = outputJSON.Lookup("Response", "")
		  Dim idJSON As New JSONItem(responseObject.ID)
		  responseObject.ID = idJSON.Lookup("id", "")
		  
		  // Return Response
		  Return responseObject
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Post(TembooApp As Temboo.TembooApplication, AccessToken As String, Link As String, Message As String, Caption As String = "", Description As String = "", Name As String = "", Picture As String = "", PlaceID As String = "", ProfileID As String = "me", Tags As String = "") As Temboo.Facebook.Publishing
		  // Initialize Variables
		  Dim response As String
		  Dim responseObject As New Temboo.Facebook.Publishing
		  
		  // Verify method parameters.
		  If (TembooApp = Nil) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing TembooApplication instance in Temboo.Twitter.oAuth.FinalizeOAuth"
		    Raise te
		    Return Nil
		  End If
		  If (AccessToken = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Facebook.Publishing.Post"
		    Raise te
		    Return Nil
		  End If
		  If (Link = "" And Message = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Facebook.Publishing.Post"
		    Raise te
		    Return Nil
		  End If
		  If (Link = "" And Caption <> "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Caption can only be used with Link property in Temboo.Facebook.Publishing.Post"
		    Raise te
		    Return Nil
		  End If
		  If (Link = "" And Description <> "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Description can only be used with Link property in Temboo.Facebook.Publishing.Post"
		    Raise te
		    Return Nil
		  End If
		  If (Link = "" And Name <> "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Name can only be used with Link property in Temboo.Facebook.Publishing.Post"
		    Raise te
		    Return Nil
		  End If
		  If (Link = "" And Picture <> "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Picture can only be used with Link property in Temboo.Facebook.Publishing.Post"
		    Raise te
		    Return Nil
		  End If
		  If (PlaceID = "" And Tags <> "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Tags can only be used with PlaceID property in Temboo.Facebook.Publishing.Post"
		    Raise te
		    Return Nil
		  End If
		  
		  // Create TembooRequest object.
		  Dim tr As New Temboo.TembooRequest(TembooApp)
		  tr.AddInputValue("AccessToken", AccessToken)
		  If (Link <> "") Then
		    tr.AddInputValue("Link", Link)
		  End If
		  If (Message <> "") Then
		    tr.AddInputValue("Message", Message)
		  End If
		  If (Caption <> "") Then
		    tr.AddInputValue("Caption", Caption)
		  End If
		  If (Description <> "") Then
		    tr.AddInputValue("Description", Description)
		  End If
		  If (Name <> "") Then
		    tr.AddInputValue("Name", Name)
		  End If
		  If (Picture <> "") Then
		    tr.AddInputValue("Picture", Picture)
		  End If
		  If (PlaceID <> "") Then
		    tr.AddInputValue("PlaceID", PlaceID)
		  End If
		  tr.AddInputValue("ProfileID", ProfileID)
		  tr.AddInputValue("ResponseFormat", "json")
		  If (Tags <> "") Then
		    tr.AddInputValue("Tags", Tags)
		  End if
		  
		  // Send TembooRequest object.
		  response = tr.SendRequest("/Facebook/Publishing/Post", "POST")
		  
		  // Let's decipher the response
		  Dim responseJSON As New JSONItem(response)
		  Dim outputJSON As JSONItem
		  outputJSON = responseJSON.Child("output")
		  responseObject.ID = outputJSON.Lookup("Response", "")
		  Dim idJSON As New JSONItem(responseObject.ID)
		  responseObject.ID = idJSON.Lookup("id", "")
		  
		  // Return Response
		  Return responseObject
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PublishLink(TembooApp As Temboo.TembooApplication, AccessToken As String, Web_Link as string) As Temboo.Facebook.Publishing
		  // Initialize Variables
		  Dim response As String
		  Dim responseObject As New Temboo.Facebook.Publishing
		  
		  // Verify method parameters.
		  If (TembooApp = Nil) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing TembooApplication instance in Temboo.Facebook.Publishing.PublishLink"
		    Raise te
		    Return Nil
		  End If
		  
		  If (AccessToken = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Access Token in Temboo.Facebook.Publishing.PublishLink"
		    Raise te
		    Return Nil
		  End If
		  
		  If (Web_Link = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Web Link in Temboo.Facebook.Publishing.PublishLink"
		    Raise te
		    Return Nil
		  End If
		  
		  
		  // Create TembooRequest object.
		  Dim tr As New Temboo.TembooRequest(TembooApp)
		  tr.AddInputValue("AccessToken", AccessToken)
		  
		  If (Web_Link <> "") Then
		    tr.AddInputValue("Link", Web_Link)
		    'tr.AddInputValue("ProfileID","me")
		  End If
		  
		  // Send TembooRequest object.
		  response = tr.SendRequest("/Facebook/Publishing/PublishLink", "POST")
		  
		  // Let's decipher the response
		  Dim responseJSON As New JSONItem(response)
		  Dim outputJSON As JSONItem
		  outputJSON = responseJSON.Child("output")
		  responseObject.ID = outputJSON.Lookup("Response", "")
		  Dim idJSON As New JSONItem(responseObject.ID)
		  responseObject.ID = idJSON.Lookup("id", "")
		  
		  // Return Response
		  Return responseObject
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PublishNote(TembooApp As Temboo.TembooApplication, AccessToken As String, Message as string, subject as string) As Temboo.Facebook.Publishing
		  // Initialize Variables
		  Dim response As String
		  Dim responseObject As New Temboo.Facebook.Publishing
		  
		  // Verify method parameters.
		  If (TembooApp = Nil) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing TembooApplication instance in Temboo.Facebook.Publishing.PublishNote"
		    Raise te
		    Return Nil
		  End If
		  
		  If (AccessToken = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Access Token in Temboo.Facebook.Publishing.PublishNote"
		    Raise te
		    Return Nil
		  End If
		  
		  If (Message = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Message in Temboo.Facebook.Publishing.PublishNote"
		    Raise te
		    Return Nil
		  End If
		  
		  If (subject = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Subject in Temboo.Facebook.Publishing.PublishNote"
		    Raise te
		    Return Nil
		  End If
		  
		  
		  // Create TembooRequest object.
		  Dim tr As New Temboo.TembooRequest(TembooApp)
		  tr.AddInputValue("AccessToken", AccessToken)
		  
		  If (Message <> "") Then
		    tr.AddInputValue("Message", Message)
		    tr.AddInputValue("ProfileID","me")
		  End If
		  
		  If (subject <> "") Then
		    tr.AddInputValue("Subject", subject)
		  End If
		  
		  // Send TembooRequest object.
		  response = tr.SendRequest("/Facebook/Publishing/PublishNote", "POST")
		  
		  // Let's decipher the response
		  Dim responseJSON As New JSONItem(response)
		  Dim outputJSON As JSONItem
		  outputJSON = responseJSON.Child("output")
		  responseObject.ID = outputJSON.Lookup("Response", "")
		  Dim idJSON As New JSONItem(responseObject.ID)
		  responseObject.ID = idJSON.Lookup("id", "")
		  
		  // Return Response
		  Return responseObject
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function UploadPhoto(TembooApp As Temboo.TembooApplication, AccessToken As String, Album as string, Picture as string, Message as string) As Temboo.Facebook.Publishing
		  // Initialize Variables
		  Dim response As String
		  Dim responseObject As New Temboo.Facebook.Publishing
		  
		  // Verify method parameters.
		  If (TembooApp = Nil) Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing TembooApplication instance in Temboo.Facebook.Publishing.UploadPhoto"
		    Raise te
		    Return Nil
		  End If
		  If (AccessToken = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Parameters in Temboo.Facebook.Publishing.UploadPhoto"
		    Raise te
		    Return Nil
		  End If
		  If (Message = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Message in Temboo.Facebook.Publishing.UploadPhoto"
		    Raise te
		    Return Nil
		  End If
		  If (Album = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Missing Album ID in Temboo.Facebook.Publishing.UploadPhoto"
		    Raise te
		    Return Nil
		  End If
		  If (Picture = "") Then
		    Dim te As New Temboo.TembooException
		    te.Message = "Picture is Missing in Temboo.Facebook.Publishing.UploadPhoto"
		    Raise te
		    Return Nil
		  End If
		  
		  
		  // Create TembooRequest object.
		  Dim tr As New Temboo.TembooRequest(TembooApp)
		  tr.AddInputValue("AccessToken", AccessToken)
		  If (Message <> "") Then
		    tr.AddInputValue("Message", Message)
		  End If
		  If (Album <> "") Then
		    tr.AddInputValue("AlbumID", Album)
		  End If
		  If (Picture <> "") Then
		    tr.AddInputValue("Photo", Picture)
		  End If
		  
		  
		  // Send TembooRequest object.
		  response = tr.SendRequest("/Facebook/Publishing/UploadPhoto", "POST")
		  
		  // Let's decipher the response
		  Dim responseJSON As New JSONItem(response)
		  Dim outputJSON As JSONItem
		  outputJSON = responseJSON.Child("output")
		  responseObject.ID = outputJSON.Lookup("Response", "")
		  Dim idJSON As New JSONItem(responseObject.ID)
		  responseObject.ID = idJSON.Lookup("id", "")
		  
		  // Return Response
		  Return responseObject
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ID As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ID"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
