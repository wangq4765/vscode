
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
        CreateITEMNAMEData = Right(CreateITEMNAMEData, Len(CreateITEMNAMEData) - 1)
    End If
End Function

Function GetMachineNameByUnitName(UnitID) As String
    Dim machineType As Variant
    Dim machineNum As Variant
    
    machineType = Mid(UnitID, 3, 1)
    machineNum = Right(UnitID, 1)
    
    If (machineType = "C") Then
        machineType = "P"
        GetMachineNameByUnitName = "LINE" & machineNum & machineType
    ElseIf (machineType = "G") Then
        machineType = "G"
        GetMachineNameByUnitName = "LINE" & machineNum & machineType
    ElseIf (machineType = "L") Then
        machineType = "L"
        GetMachineNameByUnitName = "LINE" & machineNum & machineType
    Else
        GetMachineNameByUnitName = "LINE" & machineNum & machineType
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

Public Sub CreateSPCCONTROLSPECITEMData(SPCCONTROLSPECNAME, ITEMNAME, CONTROLCHARTTYPE, LASTCREATEDTIME, SPECLIMITTYPE, TARGET, UPPERSPECLIMIT, LOWERSPECLIMIT, UPPERSCREENLIMIT, LOWERSCREENLIMIT, SCREENLIMITREMOVEOPTION, Count)
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 2) = SPCCONTROLSPECNAME
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 3) = ITEMNAME
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 4) = CONTROLCHARTTYPE
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 5) = "Measurable"
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

       Worksheets("SPCCONTROLSPECITEM").Cells(Count, 20) = SITEOUTCHECK
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 19) = "INSERT INTO SPCCONTROLSPECITEM VALUES('" & _
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
      SITEOUTCHECK & "','" & _
    Worksheets("SPCCONTROLSPECITEM").Cells(Count, 18) & "');"
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

