#tag Class
Protected Class TembooApplication
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(TembooUsername As String, TembooAppName As String, TembooAppKey As String)
		  // Verify that the correct parameters were passed.
		  If (TembooUsername = "" Or TembooAppName = "" Or TembooAppKey = "") Then
		    // Raise Exception
		    Dim te As New TembooException
		    te.Message = "You must set all the TembooApplication.Constructor properties."
		    Raise te
		    Return
		  End If
		  
		  // Set TembooApplication properties
		  p_Username = TembooUsername
		  p_AppName = TembooAppName
		  p_AppKey = TembooAppKey
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return p_AppKey
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Raise Exception
			  Dim te As New TembooException
			  te.Message = "You cannot set the value of the AppKey property."
			  Raise te
			End Set
		#tag EndSetter
		AppKey As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return p_AppName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Raise Exception
			  Dim te As New TembooException
			  te.Message = "You cannot set the value of the AppName property."
			  Raise te
			End Set
		#tag EndSetter
		AppName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private p_AppKey As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private p_AppName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private p_Username As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return p_Username
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Raise Exception
			  Dim te As New TembooException
			  te.Message = "You cannot set the value of the Username property."
			  Raise te
			End Set
		#tag EndSetter
		Username As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AppKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AppName"
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
		#tag ViewProperty
			Name="Username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
