



Private Sub cmdClose_Click()

End Sub

Private Sub cmdLoadFlashcard_Click()

End Sub

Private Sub cmdSaveHash_Click()
    Dim ws As Worksheet
    Dim searchValue As String
    Dim foundRow As Range
    Dim nextBanditLevelRow As Long

    ' Set the worksheet object
    Set ws = ThisWorkbook.Sheets("Sheet1")
    
    ' Get the search value from the TextBox
    searchValue = Trim(Me.txtSearch.Value)
    
    ' Validate the search input
    If searchValue = "" Then
        MsgBox "Please enter a Bandit level to search.", vbExclamation
        Exit Sub
    End If
    
    ' Validate the hash input
    If Me.txtHash.Value = "" Then
        MsgBox "Please enter the hash for the next level.", vbExclamation
        Exit Sub
    End If
    
    ' Search for the current Bandit level in Column A
    Set foundRow = ws.Columns("A").Find(What:=searchValue, LookIn:=xlValues, LookAt:=xlWhole)
    
    If Not foundRow Is Nothing Then
        ' Determine the next Bandit level row (assuming it's the next row)
        nextBanditLevelRow = foundRow.Row + 1
        
        ' Check if the next row is valid (i.e., it contains the next Bandit level)
        If ws.Cells(nextBanditLevelRow, "A").Value <> "" Then
            ' Save the hash into Column G of the next Bandit level row
            ws.Cells(nextBanditLevelRow, "G").Value = Me.txtHash.Value
            MsgBox "Hash saved successfully for " & ws.Cells(nextBanditLevelRow, "A").Value, vbInformation
        Else
            MsgBox "Next Bandit level not found or no data available in the expected row.", vbExclamation
        End If
    Else
        MsgBox "Bandit level not found.", vbExclamation
    End If
End Sub


Private Sub cmdSearch_Click()
    Dim ws As Worksheet
    Dim searchValue As String
    Dim foundRow As Range
    Dim nextBanditLevelRow As Long
    Dim imgPath As String

    ' Set the worksheet object
    Set ws = ThisWorkbook.Sheets("Sheet1")
    
    ' Get the search value from the TextBox
    searchValue = Trim(Me.txtSearch.Value)
    
    ' Clear the txtHash and imgFlashcard before populating with new results
    Me.txtHash.Value = ""
    Me.imgFlashcard.Picture = LoadPicture("") ' Clear the image
    
    ' Validate the search input
    If searchValue = "" Then
        MsgBox "Please enter a Bandit level to search.", vbExclamation
        Exit Sub
    End If
    
    ' Search for the Bandit level in Column A
    Set foundRow = ws.Columns("A").Find(What:=searchValue, LookIn:=xlValues, LookAt:=xlWhole)
    
    If Not foundRow Is Nothing Then
        ' Determine the next Bandit level row (assuming it's the next row)
        nextBanditLevelRow = foundRow.Row + 1
        
        ' Check if the next row is valid (i.e., it contains the next Bandit level)
        If ws.Cells(nextBanditLevelRow, "A").Value <> "" Then
            ' Populate the txtHash TextBox with the password from Column G of the next Bandit level row
            Me.txtHash.Value = ws.Cells(nextBanditLevelRow, "G").Value
            
            ' Get the image path from Column H of the next Bandit level row
            imgPath = ws.Cells(nextBanditLevelRow, "H").Value
            
            ' Load the image into imgFlashcard if the path is valid
            If Dir(imgPath) <> "" Then
                Me.imgFlashcard.Picture = LoadPicture(imgPath)
            Else
                MsgBox "Flashcard image not found at " & imgPath, vbExclamation
                Me.imgFlashcard.Picture = LoadPicture("") ' Clear the image if not found
            End If
        Else
            MsgBox "Next Bandit level not found or no data available in the expected row.", vbExclamation
        End If
    Else
        MsgBox "Bandit level not found.", vbExclamation
    End If
End Sub
