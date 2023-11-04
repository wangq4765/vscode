'下面的数字12修改成6是最合适的
Sub CreateRecipeData(snsRECIPENAMESPACENAME, snsRECIPENAME, Count)
Worksheets("RECIPE").Cells(Count, 2) = snsRECIPENAMESPACENAME
Worksheets("RECIPE").Cells(Count, 3) = snsRECIPENAME
Worksheets("RECIPE").Cells(Count, 5) = "MachineRecipe"
Worksheets("RECIPE").Cells(Count, 12) = "INSERT INTO RECIPE(RECIPENAMESPACENAME,RECIPENAME,RECIPETYPE) VALUES('" & _
snsRECIPENAMESPACENAME & "','" & _
snsRECIPENAME & "','" & _
Worksheets("RECIPE").Cells(Count, 5) & "');"
End Sub

Sub CreateTPFOPOLICYData(snsFACTORYNAME, snsPRODUCTSPECNAME, snsPROCESSFLOWNAME, snsPROCESSOPERATIONNAME, Count)
Worksheets("TPFOPOLICY").Cells(Count, 2) = snsFACTORYNAME
Worksheets("TPFOPOLICY").Cells(Count, 3) = snsPRODUCTSPECNAME
Worksheets("TPFOPOLICY").Cells(Count, 4) = snsPROCESSFLOWNAME
Worksheets("TPFOPOLICY").Cells(Count, 5) = snsPROCESSOPERATIONNAME
Worksheets("TPFOPOLICY").Cells(Count, 6) = snsFACTORYNAME & "_" & snsPRODUCTSPECNAME & "_" & snsPROCESSFLOWNAME & "_" & snsPROCESSOPERATIONNAME
Worksheets("TPFOPOLICY").Cells(Count, 7) = "INSERT INTO TPFOPOLICY VALUES('" & _
snsFACTORYNAME & "','" & _
snsPRODUCTSPECNAME & "','" & _
snsPROCESSFLOWNAME & "','" & _
snsPROCESSOPERATIONNAME & "','" & _
Worksheets("TPFOPOLICY").Cells(Count, 6) & "');"
End Sub

Sub CreateTPFOMPOLICYData(snsFACTORYNAME, snsPRODUCTSPECNAME, snsPROCESSFLOWNAME, snsPROCESSOPERATIONNAME, snsMACHINENAME, Count)
 Worksheets("TPFOMPOLICY").Cells(Count, 2) = snsFACTORYNAME
 Worksheets("TPFOMPOLICY").Cells(Count, 3) = snsPRODUCTSPECNAME
 Worksheets("TPFOMPOLICY").Cells(Count, 4) = snsPROCESSFLOWNAME
 Worksheets("TPFOMPOLICY").Cells(Count, 5) = snsPROCESSOPERATIONNAME
 Worksheets("TPFOMPOLICY").Cells(Count, 6) = snsMACHINENAME
 Worksheets("TPFOMPOLICY").Cells(Count, 7) = snsFACTORYNAME & "_" & snsPRODUCTSPECNAME & "_" & snsPROCESSFLOWNAME & "_" & snsPROCESSOPERATIONNAME & "_" & snsMACHINENAME
 Worksheets("TPFOMPOLICY").Cells(Count, 8) = "INSERT INTO TPFOMPOLICY VALUES('" & _
 snsFACTORYNAME & "','" & _
 snsPRODUCTSPECNAME & "','" & _
 snsPROCESSFLOWNAME & "','" & _
 snsPROCESSOPERATIONNAME & "','" & _
 snsMACHINENAME & "','" & _
 Worksheets("TPFOMPOLICY").Cells(Count, 7) & "');"
End Sub
Sub CreatePOSMACHINEData(snsFACTORYNAME, snsPRODUCTSPECNAME, snsPROCESSFLOWNAME, snsPROCESSOPERATIONNAME, snsMACHINENAME, Count)
 Worksheets("POSMACHINE").Cells(Count, 4) = 1
 Worksheets("POSMACHINE").Cells(Count, 3) = snsMACHINENAME
 Worksheets("POSMACHINE").Cells(Count, 2) = snsFACTORYNAME & "_" & snsPRODUCTSPECNAME & "_" & snsPROCESSFLOWNAME & "_" & snsPROCESSOPERATIONNAME
 Worksheets("POSMACHINE").Cells(Count, 6) = "INSERT INTO POSMACHINE(CONDITIONID,MACHINENAME,PRIORITY) VALUES('" & _
 Worksheets("POSMACHINE").Cells(Count, 2) & "','" & _
 snsMACHINENAME & "','" & _
 "1" & "');"
End Sub
Sub CreatePOSMACHINERECIPEData(snsFACTORYNAME, snsPRODUCTSPECNAME, snsPROCESSFLOWNAME, snsPROCESSOPERATIONNAME, snsMACHINENAME, snsRECIPE, Count)
 Worksheets("POSMACHINERECIPE").Cells(Count, 4) = "Y"
 Worksheets("POSMACHINERECIPE").Cells(Count, 3) = snsRECIPE
 Worksheets("POSMACHINERECIPE").Cells(Count, 2) = snsFACTORYNAME & "_" & snsPRODUCTSPECNAME & "_" & snsPROCESSFLOWNAME & "_" & snsPROCESSOPERATIONNAME & "_" & snsMACHINENAME
 Worksheets("POSMACHINERECIPE").Cells(Count, 5) = "INSERT INTO POSMACHINERECIPE VALUES('" & _
 Worksheets("POSMACHINERECIPE").Cells(Count, 2) & "','" & _
 snsRECIPE & "','" & _
 "Y" & "');"
End Sub


Public Function insertSQL(A As Range, B As Range)

    insertSQL = "insert into " & ActiveSheet.Name & " (" & data(A) & ") VALUES (" & splitData(B) & ");"


End Function

 

Public Function splitData(Sdata As Range)

    Dim column

    splitData = ""

    For Each i In Sdata.Cells
        If i.Value <> "" Then
        column = "'" & i.Value & "',"
        Else
        column = "Null,"
        End If
        splitData = splitData & column

     Next

     splitData = Left(splitData, Len(splitData) - 1)

End Function

'.RemoveDuplicates`应用于`Selection`，也就是当前选定范围
'Columns:=.Columns.Count` 表示要在选中列中查找重复项
'Header:=xlNo` 表示选定范围中没有标题行。如果选定范围中有标题行，应该将 `Header:=xlYes`
'这段代码将删除选定范围内的所有重复行，并保留第一次出现的行(删除后下面的单元格向上移动)
Sub RemoveDuplicatesRows()
    With Selection
        .RemoveDuplicates Columns:=.Columns.Count, Header:=xlNo
    End With
End Sub


Public Function data(tdata As Range)

    Dim column

    data = ""

    For Each i In tdata.Cells
        If i.Value <> "" Then
        column = i.Value & ","
        Else
        column = "Null,"
        End If
        data = data & column

     Next

     data = Left(data, Len(data) - 1)

End Function


Public Sub CreateTPPOLICYData(snsFACTORYNAME, snsPRODUCTSPECNAME, Count)
  Worksheets("TPPOLICY").Cells(Count, 2) = snsFACTORYNAME
  Worksheets("TPPOLICY").Cells(Count, 3) = snsPRODUCTSPECNAME
  Worksheets("TPPOLICY").Cells(Count, 4) = snsFACTORYNAME & "_" & snsPRODUCTSPECNAME
  Worksheets("TPPOLICY").Cells(Count, 5) = "INSERT INTO TPPOLICY VALUES('" & _
  snsFACTORYNAME & "','" & _
  snsPRODUCTSPECNAME & "','" & _
  Worksheets("TPPOLICY").Cells(Count, 4) & "');"
End Sub
Public Sub CreatePOSPRODUCTSAMPLINGData(snsFACTORYNAME, snsPRODUCTSPECNAME, snsPROCESSFLOWNAME, snsPROCESSOPERATIONNAME, snsMACHINENAME, snsTOPROCESSOPERATIONNAME, snsLOTSAMPLINGCOUNT, snsPRODUCTSAMPLINGCOUNT, snsPRODUCTSAMPLINGPOSITION, snsPRIORTY, Count)
  Worksheets("POSPRODUCTSAMPLING").Cells(Count, 2) = snsFACTORYNAME & "_" & snsPRODUCTSPECNAME & "_" & snsPROCESSFLOWNAME & "_" & snsPROCESSOPERATIONNAME & "_" & snsMACHINENAME
  Worksheets("POSPRODUCTSAMPLING").Cells(Count, 3) = snsTOPROCESSOPERATIONNAME
  Worksheets("POSPRODUCTSAMPLING").Cells(Count, 4) = snsLOTSAMPLINGCOUNT
  Worksheets("POSPRODUCTSAMPLING").Cells(Count, 5) = snsPRODUCTSAMPLINGCOUNT
  Worksheets("POSPRODUCTSAMPLING").Cells(Count, 6) = snsPRODUCTSAMPLINGPOSITION
  Worksheets("POSPRODUCTSAMPLING").Cells(Count, 7) = snsPRIORTY
  Worksheets("POSPRODUCTSAMPLING").Cells(Count, 8) = "INSERT INTO POSPRODUCTSAMPLING VALUES('" & _
  Worksheets("POSPRODUCTSAMPLING").Cells(Count, 2) & "','" & _
  snsTOPROCESSOPERATIONNAME & "','" & _
  snsLOTSAMPLINGCOUNT & "','" & _
  snsPRODUCTSAMPLINGCOUNT & "','" & _
  snsPRODUCTSAMPLINGPOSITION & "','" & _
  snsPRIORTY & "');"
End Sub

Public Sub CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(snsFACTORYNAME, snsPRODUCTSPECNAME, snsPROCESSFLOWNAME, snsPROCESSOPERATIONNAME, snsMACHINENAME, snsPOSITION, snsSAMPLINGMACHINENAME, Count)
  Worksheets("POSPRODUCTSAMPLINGEQP").Cells(Count, 2) = snsFACTORYNAME & "_" & snsPRODUCTSPECNAME & "_" & snsPROCESSFLOWNAME & "_" & snsPROCESSOPERATIONNAME & "_" & snsMACHINENAME
  Worksheets("POSPRODUCTSAMPLINGEQP").Cells(Count, 3) = snsPOSITION
  Worksheets("POSPRODUCTSAMPLINGEQP").Cells(Count, 4) = snsSAMPLINGMACHINENAME
  Worksheets("POSPRODUCTSAMPLINGEQP").Cells(Count, 5) = "Y"
  Worksheets("POSPRODUCTSAMPLINGEQP").Cells(Count, 6) = "INSERT INTO POSPRODUCTSAMPLINGEQPBYSLOT VALUES('" & _
  Worksheets("POSPRODUCTSAMPLINGEQP").Cells(Count, 2) & "','" & _
  snsPOSITION & "','" & _
  snsSAMPLINGMACHINENAME & "','" & _
  "Y" & "');"
End Sub

'Chr(39)代表单引号字符(')
'符号+和&都可以用于字符串的连接。它们的主要区别在于+可以用于数字类型的运算，而&只能用于字符串的连接
Public Sub CreateBSPRODUCTMASKINFOData(snsPRODUCTSPECNAME, snsLOTTYPE, snsPROCESSOPERATIONNAME, snsMASKID, Count)
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 2) = snsPRODUCTSPECNAME
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 3) = snsPROCESSOPERATIONNAME
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 4) = snsMASKID
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 5) = "InitProductMaskInfo"
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 6) = "TO_CHAR(SYSDATE, " + Chr(39) + "yyyyMMddHH24miss" + Chr(39) + ")"
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 7) = Environ("username")
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 8) = "新机种维护时同步导入Mask信息"
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 9) = snsLOTTYPE
  
  
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 10) = "INSERT INTO BSPRODUCTMASKINFO(PRODUCTSPECNAME, PROCESSOPERATIONNAME, DURABLENAME, EVENTNAME, EVENTTIMEKEY, EVENTUSER, EVENTCOMMENT, LOTTYPE) VALUES('" & _
  snsPRODUCTSPECNAME & "','" & _
  snsPROCESSOPERATIONNAME & "','" & _
  snsMASKID & "','" & _
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 5) & "'," & _
  "TO_CHAR(SYSDATE, " + Chr(39) + "yyyyMMddHH24miss" + Chr(39) + ")" & ",'" & _
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 7) & "','" & _
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 8) & "','" & _
  Worksheets("BSPRODUCTMASKINFO").Cells(Count, 9) & "');"
End Sub

'Range("L1:L2")：包含两个单元格，分别是 L列的第一行和第二行(用Range("L1")效果相同)
'Range("L1:L2").column：返回 L列的列号，即 12
'Cells(65536, Range("L1:L2").column)：第65536行第12列
'Cells(65536, Range("L1:L2").column).End(xlUp)：返回 L列的最后一个非空单元格(End(xlUp)从当前单元格开始向上搜索，直到遇到第一个非空单元格并返回)
Public Sub SelectRg(iCol As Range)
    lastrow = Cells(65536, iCol.column).End(xlUp).Row
    Range(Cells(3, iCol.column), Cells(lastrow, iCol.column)).Select
End Sub

Public Function GetMandatoryFlag(PROCESSOPERATIONNAME)

 Dim strConn As String '连接字符串
 Dim dbConn As Object '连接对象
 Dim resSet As Object '查询结果集
 Dim db_sid, db_user, db_pass As String 'sid,用户名,密码
 Dim sql As String
 '设置自己的链接数据
 db_sid = "SRV_SNS"
 db_user = "SNSMESADM"
 db_pass = "oracle"
  
 'db_sid = "UNIXTEST"
 'db_user = "TMSENADM"
 'db_pass = "TMSENADM"
 '创建对象
 Set dbConn = CreateObject("ADODB.Connection")
 Set resSet = CreateObject("ADODB.Recordset")
 '拼接链接字符串 下面两个选一个
 strConn = "Provider=OraOLEDB.Oracle.1; user id=" & db_user & "; password=" & db_pass & "; data source = " & db_sid & "; Persist Security Info=True"
 'strConn = "Provider=MSDAORA.1; user id=" & db_user & "; password=" & db_pass & "; data source = " & db_sid & "; Persist Security Info=True"
 '-----打开数据库----
 dbConn.Open strConn
 '执行查询
 sql = "SELECT MANDATORYOPERATIONFLAG FROM PROCESSOPERATIONSPEC WHERE PROCESSOPERATIONNAME ='" & PROCESSOPERATIONNAME & "'"
 Set resSet = dbConn.Execute(sql)
 Dim oDict As Collection
 Set oDict = New Collection
  
 While Not resSet.EOF
  For i = 1 To resSet.Fields.Count
    oDict.Add resSet.Fields(i - 1).Value
  Next i
  resSet.MoveNext
 Wend
  
 Set GetMandatoryFlag = oDict
 '打印表头
 'For j = 0 To resSet.Fields.Count - 1
  'Cells(1, j + 1) = resSet.Fields(j).Name
 'Next
 '粘贴结果
 'Range("A2").CopyFromRecordset resSet
 '-----关闭连接----
 dbConn.Close '关闭数据库
End Function
