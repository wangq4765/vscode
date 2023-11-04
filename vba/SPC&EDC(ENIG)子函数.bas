'这边形参是Count，那边实参是DATACOLLECTSPECRowCount
Public Sub CreateDATACOLLECTSPECData(DCSPECNAME, DESCRIPTION, CHECKSTATE, CREATETIME, CREATEUSER, MATERIALTYPE, SAMPLEMATERIALTYPE, SAMPLECOUNT, Count)
   Worksheets("DATACOLLECTSPEC").Cells(Count, 2) = DCSPECNAME
   'Worksheets("DATACOLLECTSPEC").Cells(Count, 2).BorderAround ColorIndex:=1, Weight:=xlThin
   Worksheets("DATACOLLECTSPEC").Cells(Count, 3) = DESCRIPTION
   'Worksheets("DATACOLLECTSPEC").Cells(Count, 3).BorderAround ColorIndex:=1, Weight:=xlThin
   Worksheets("DATACOLLECTSPEC").Cells(Count, 4) = CHECKSTATE
   'Worksheets("DATACOLLECTSPEC").Cells(Count, 4).BorderAround ColorIndex:=1, Weight:=xlThin
   Worksheets("DATACOLLECTSPEC").Cells(Count, 5) = CREATETIME
   'Worksheets("DATACOLLECTSPEC").Cells(Count, 5).BorderAround ColorIndex:=1, Weight:=xlThin
   Worksheets("DATACOLLECTSPEC").Cells(Count, 6) = CREATEUSER
   'Worksheets("DATACOLLECTSPEC").Cells(Count, 6).BorderAround ColorIndex:=1, Weight:=xlThin
   Worksheets("DATACOLLECTSPEC").Cells(Count, 11) = MATERIALTYPE
   'Worksheets("DATACOLLECTSPEC").Cells(Count, 11).BorderAround ColorIndex:=1, Weight:=xlThin
   Worksheets("DATACOLLECTSPEC").Cells(Count, 12) = SAMPLEMATERIALTYPE
   'Worksheets("DATACOLLECTSPEC").Cells(Count, 12).BorderAround ColorIndex:=1, Weight:=xlThin
   Worksheets("DATACOLLECTSPEC").Cells(Count, 13) = SAMPLECOUNT
   
   '无变量需要双引号& "','" & 
   '有变量不需要双引号& _CREATETIME &
   '合成insert语句，和在excel上操作方法一样
   '="INSERT INTO POSGLASSMAP VALUES('" & B3 & "','" & C3 & "','" & D3 & "','" & E3 & "','" & F3 & "','" & G3 & "','" & H3 & "');"
   'insert into dataCollectSpec(dcspecname, description, checkState, CreateTime, createuser, MaterialType, SampleMaterialType, SampleCount) values('156E1F1602_BMMSK_OD','Ni层厚度','CheckedIn',SYSDATE,'BOE','Lot','Product','3');
   Worksheets("DATACOLLECTSPEC").Cells(Count, 14) = "insert into dataCollectSpec(dcspecname, description, checkState, CreateTime, createuser, MaterialType, SampleMaterialType, SampleCount) values('" & _
   DCSPECNAME & "','" & _
   DESCRIPTION & "','" & _
   CHECKSTATE & "'," & _
   CREATETIME & ",'" & _
   CREATEUSER & "','" & _
   MATERIALTYPE & "','" & _
   SAMPLEMATERIALTYPE & "','" & _
   SAMPLECOUNT & "');"
   'Worksheets("DATACOLLECTSPEC").Cells(Count, 14).BorderAround ColorIndex:=1, Weight:=xlThin
   'Worksheets("DATACOLLECTSPEC").Range("B3:(N & Count)").BorderAround ColorIndex:=3, Weight:=xlThin
End Sub

Public Sub CreateDATACOLLECTSPECITEMData(DCSPECNAME, ITEMNAME, DATATYPE, SITECOUNT, SITENAMES, Count)
   Worksheets("DATACOLLECTSPECITEM").Cells(Count, 2) = DCSPECNAME
   Worksheets("DATACOLLECTSPECITEM").Cells(Count, 3) = ITEMNAME
   Worksheets("DATACOLLECTSPECITEM").Cells(Count, 4) = DATATYPE
   Worksheets("DATACOLLECTSPECITEM").Cells(Count, 5) = SITECOUNT
   Worksheets("DATACOLLECTSPECITEM").Cells(Count, 6) = SITENAMES
   
   Worksheets("DATACOLLECTSPECITEM").Cells(Count, 14) = "INSERT INTO DATACOLLECTSPECITEM(DCSPECNAME, ITEMNAME, DATATYPE, SITECOUNT, SITENAMES) VALUES('" & _
   DCSPECNAME & "','" & _
   ITEMNAME & "','" & _
   DATATYPE & "','" & _
   SITECOUNT & "','" & _
   SITENAMES & "');"
End Sub

Public Sub CreatePOSDCSPECData(CONDITIONID, DCSPECNAME, UNITNAME, DCSPECTYPE, Count)
  Worksheets("POSDCSPEC").Cells(Count, 2) = CONDITIONID
  Worksheets("POSDCSPEC").Cells(Count, 3) = DCSPECNAME
  Worksheets("POSDCSPEC").Cells(Count, 4) = UNITNAME
  Worksheets("POSDCSPEC").Cells(Count, 5) = DCSPECTYPE
  
  Worksheets("POSDCSPEC").Cells(Count, 6) = "INSERT INTO POSDCSPEC VALUES('" & _
  CONDITIONID & "','" & _
  DCSPECNAME & "','" & _
  UNITNAME & "','" & _
  DCSPECTYPE & "');"
End Sub


Function CreateITEMNAMEData(Count) As String
    If Count = 1 Then
        CreateITEMNAMEData = "G"
    Else
        For i = 1 To Count
        If i < 10 Then
            CreateITEMNAMEData = CreateITEMNAMEData & "^S0" & i
        Else
            CreateITEMNAMEData = CreateITEMNAMEData & "^S" & i
        End If
        Next
        '为了去掉第一个字符^
        'Right：返回在右侧指定数量字符的字符串
        CreateITEMNAMEData = Right(CreateITEMNAMEData, Len(CreateITEMNAMEData) - 1)
    End If
End Function

Public Sub CreateSPCCONTROLSPECData(SPCCONTROLSPECNAME, DCSPECNAME, FACTORYNAME, PRODUCTSPECNAME, PROCESSFLOWNAME, PROCESSOPERATIONNAME, MACHINENAME, Count)
    Worksheets("SPCCONTROLSPEC").Cells(Count, 2) = SPCCONTROLSPECNAME
    Worksheets("SPCCONTROLSPEC").Cells(Count, 4) = DCSPECNAME
    Worksheets("SPCCONTROLSPEC").Cells(Count, 5) = "11110000|"
    Worksheets("SPCCONTROLSPEC").Cells(Count, 6) = 30
    Worksheets("SPCCONTROLSPEC").Cells(Count, 7) = FACTORYNAME
    Worksheets("SPCCONTROLSPEC").Cells(Count, 8) = PRODUCTSPECNAME
    Worksheets("SPCCONTROLSPEC").Cells(Count, 9) = PROCESSFLOWNAME
    Worksheets("SPCCONTROLSPEC").Cells(Count, 10) = PROCESSOPERATIONNAME
    Worksheets("SPCCONTROLSPEC").Cells(Count, 11) = MACHINENAME
    Worksheets("SPCCONTROLSPEC").Cells(Count, 12) = "-"
    Worksheets("SPCCONTROLSPEC").Cells(Count, 13) = "-"
    Worksheets("SPCCONTROLSPEC").Cells(Count, 14) = "N"
    Worksheets("SPCCONTROLSPEC").Cells(Count, 15) = "N"
'    Worksheets("SPCCONTROLSPEC").Cells(Count, 16) = "-"
'    Worksheets("SPCCONTROLSPEC").Cells(Count, 17) = "-"
    Worksheets("SPCCONTROLSPEC").Cells(Count, 19) = "INSERT INTO SPCCONTROLSPEC VALUES('" & _
    SPCCONTROLSPECNAME & "','" & _
    Worksheets("SPCCONTROLSPEC").Cells(Count, 3) & "','" & _
    DCSPECNAME & "','" & _
    Worksheets("SPCCONTROLSPEC").Cells(Count, 5) & "','" & _
    Worksheets("SPCCONTROLSPEC").Cells(Count, 6) & "','" & _
    FACTORYNAME & "','" & _
    PRODUCTSPECNAME & "','" & _
    PROCESSFLOWNAME & "','" & _
    PROCESSOPERATIONNAME & "','" & _
    MACHINENAME & "','" & _
    Worksheets("SPCCONTROLSPEC").Cells(Count, 12) & "','" & _
    Worksheets("SPCCONTROLSPEC").Cells(Count, 13) & "','" & _
    Worksheets("SPCCONTROLSPEC").Cells(Count, 14) & "','" & _
    Worksheets("SPCCONTROLSPEC").Cells(Count, 15) & "','" & _
    Worksheets("SPCCONTROLSPEC").Cells(Count, 16) & "','" & _
    Worksheets("SPCCONTROLSPEC").Cells(Count, 17) & "','" & _
    Worksheets("SPCCONTROLSPEC").Cells(Count, 18) & "');"
End Sub

Public Sub CreateSPCCONTROLSPECCHARTData(SPCCONTROLSPECNAME, ITEMNAME, CHARTNAME, Count)
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 2) = SPCCONTROLSPECNAME
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 3) = ITEMNAME
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 4) = CHARTNAME
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 6) = 0
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 7) = 0
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 8) = 0
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 9) = 0
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 10) = 0
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 11) = "INSERT INTO SPCCONTROLSPECCHART VALUES('" & _
    SPCCONTROLSPECNAME & "','" & _
    ITEMNAME & "','" & _
    CHARTNAME & "','" & _
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 5) & "','" & _
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 6) & "','" & _
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 7) & "','" & _
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 8) & "','" & _
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 9) & "','" & _
    Worksheets("SPCCONTROLSPECCHART").Cells(Count, 10) & "');"
End Sub

Public Sub CreateSPCCONTROLSPECCAPABILITYData(SPCCONTROLSPECNAME, ITEMNAME, LASTCREATEDTIME, Count)
    Worksheets("SPCCONTROLSPECCAPABILITY").Cells(Count, 2) = SPCCONTROLSPECNAME
    Worksheets("SPCCONTROLSPECCAPABILITY").Cells(Count, 3) = ITEMNAME
    Worksheets("SPCCONTROLSPECCAPABILITY").Cells(Count, 5) = LASTCREATEDTIME
    Worksheets("SPCCONTROLSPECCAPABILITY").Cells(Count, 6) = "INSERT INTO SPCCONTROLSPECCAPABILITY VALUES('" & _
    SPCCONTROLSPECNAME & "','" & _
    ITEMNAME & "','" & _
    Worksheets("SPCCONTROLSPECCAPABILITY").Cells(Count, 4) & "'," & _
    LASTCREATEDTIME & ");"

End Sub

Public Sub CreateSPCCONTROLSPECRULEData(SPCCONTROLSPECNAME, ITEMNAME, CHARTNAME, SPCCONTROLRULENAME, Count)
    Worksheets("SPCCONTROLSPECRULE").Cells(Count, 2) = SPCCONTROLSPECNAME
    Worksheets("SPCCONTROLSPECRULE").Cells(Count, 3) = ITEMNAME
    Worksheets("SPCCONTROLSPECRULE").Cells(Count, 4) = CHARTNAME
    Worksheets("SPCCONTROLSPECRULE").Cells(Count, 5) = SPCCONTROLRULENAME
    Worksheets("SPCCONTROLSPECRULE").Cells(Count, 6) = "INSERT INTO SPCCONTROLSPECRULE VALUES('" & _
    SPCCONTROLSPECNAME & "','" & _
    ITEMNAME & "','" & _
    CHARTNAME & "','" & _
    SPCCONTROLRULENAME & "');"
End Sub

Public Sub CreateSPCCONTROLSPECITEMData(SPCCONTROLSPECNAME, ITEMNAME, CONTROLCHARTTYPE, LASTCREATEDTIME, SPECLIMITTYPE, TARGET, UPPERSPECLIMIT, LOWERSPECLIMIT, UPPERSCREENLIMIT, LOWERSCREENLIMIT, SCREENLIMITREMOVEOPTION, SITEOUTCHECK, Count)
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 2) = SPCCONTROLSPECNAME
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 3) = ITEMNAME
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 4) = CONTROLCHARTTYPE
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 5) = "Measurable"

    'excel中给单元格赋值CStr("010")后单元格出现10是怎么回事?
    '在 Excel 中，当你将 CStr("010") 赋值给一个单元格时，Excel 会将其视为一个文本字符串，并尝试将其自动转换为数值类型。由于文本字符串 "010" 可以被解释为一个数字，Excel 将其转换为数值类型的整数 10。这种行为是 Excel 中的默认行为，被称为隐式类型转换（Implicit Type Conversion）。
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 6) = CStr("010")

    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 7) = CONTROLCHARTTYPE & "^*^^*||"
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 8) = "EVERYTIME|"
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 9) = "Y"
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 10) = LASTCREATEDTIME
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 11) = SPECLIMITTYPE
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 12) = TARGET
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 13) = UPPERSPECLIMIT
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 14) = LOWERSPECLIMIT
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 15) = UPPERSCREENLIMIT
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 16) = LOWERSCREENLIMIT
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 17) = SCREENLIMITREMOVEOPTION
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 19) = SITEOUTCHECK
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 20) = "INSERT INTO SPCCONTROLSPECITEM VALUES('" & _
    SPCCONTROLSPECNAME & "','" & _
    ITEMNAME & "','" & _
    CONTROLCHARTTYPE & "','" & _
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 5) & "','" & _
    CStr("010") & "','" & _
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 7) & "','" & _
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 8) & "','" & _
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 9) & "'," & _
    LASTCREATEDTIME & ",'" & _
    SPECLIMITTYPE & "','" & _
    TARGET & "','" & _
    UPPERSPECLIMIT & "','" & _
    LOWERSPECLIMIT & "','" & _
    UPPERSCREENLIMIT & "','" & _
    LOWERSCREENLIMIT & "','" & _
    SCREENLIMITREMOVEOPTION & "','" & _
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 18) & "','" & _
    SITEOUTCHECK & "');"
End Sub

Public Function GetProcessFlowName(PRODUCTSPECNAME)

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
 Set dbConn = CreateObject("ADODB.Connection")  'CreateObject是自带的函数
 Set resSet = CreateObject("ADODB.Recordset")
 '拼接链接字符串 下面两个选一个
 strConn = "Provider=OraOLEDB.Oracle.1; user id=" & db_user & "; password=" & db_pass & "; data source = " & db_sid & "; Persist Security Info=True"
 'strConn = "Provider=MSDAORA.1; user id=" & db_user & "; password=" & db_pass & "; data source = " & db_sid & "; Persist Security Info=True"
 '-----打开数据库----
 dbConn.Open strConn
 '执行查询
 sql = "SELECT PROCESSFLOWNAME FROM PRODUCTSPEC WHERE PRODUCTSPECNAME ='" & PRODUCTSPECNAME & "'"
 Set resSet = dbConn.Execute(sql)
 Dim oDict As Collection
 Set oDict = New Collection
  
 While Not resSet.EOF
  For i = 1 To resSet.Fields.Count
    oDict.Add resSet.Fields(i - 1).Value
  Next i
  resSet.MoveNext
 Wend
  
 Set GetProcessFlowName = oDict
 '打印表头
 'For j = 0 To resSet.Fields.Count - 1
  'Cells(1, j + 1) = resSet.Fields(j).Name
 'Next
 '粘贴结果
 'Range("A2").CopyFromRecordset resSet
 '-----关闭连接----
 dbConn.Close '关闭数据库
End Function
