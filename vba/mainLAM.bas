
Public Sub CreateData()
    
    Worksheets("DATACOLLECTSPEC").Range("B3:N1000").ClearContents
    Worksheets("DATACOLLECTSPECITEM").Range("B3:N1000").ClearContents
    Worksheets("POSDCSPEC").Range("B3:F1000").ClearContents
    Worksheets("SPCCONTROLSPEC").Range("B3:T1000").ClearContents
    Worksheets("SPCCONTROLSPECCHART").Range("B3:M1000").ClearContents
    Worksheets("SPCCONTROLSPECCAPABILITY").Range("B3:H1000").ClearContents
    Worksheets("SPCCONTROLSPECRULE").Range("B3:H1000").ClearContents
    Worksheets("SPCCONTROLSPECITEM").Range("B3:T1000").ClearContents
    Worksheets("TPFOMPOLICY").Range("B3:T1000").ClearContents
    Worksheets("POSMACHINE").Range("B3:T1000").ClearContents
    
    Dim DATACOLLECTSPECRowCount
    Dim DATACOLLECTSPECITEMRowCount
    Dim POSDCSPECRowCount
    Dim SPCCONSPECRowCount
    Dim SPCCONSPECCHARTRowCount
    Dim SPCCONSPECCAPABILITYRowCount
    Dim SPCCONSPECRULERowCount
    Dim SPCCONSPECITEMRowCount
    Dim TPFOMPOLICYRowCount
    Dim POSMACHINERowCount
    Dim UnitArray As Variant
    Dim EqpArray As Variant
    
    
    
    DATACOLLECTSPECRowCount = 2
    DATACOLLECTSPECITEMRowCount = 2
    POSDCSPECRowCount = 2
    SPCCONSPECRowCount = 2
    SPCCONSPECCHARTRowCount = 2
    SPCCONSPECCAPABILITYRowCount = 2
    SPCCONSPECRULERowCount = 2
    SPCCONSPECITEMRowCount = 2
    TPFOMPOLICYRowCount = 2
    POSMACHINERowCount = 2
    
    '去除可能存在的空格,Trim()函数只能去除前后空格，不能去除中间空格，必须使用replace
    Sheets("NO").Activate
    For i = 1 To 50
        Worksheets("NO").Range("C5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("C5").Offset(i - 1, 0), " ", "")
        Worksheets("NO").Range("F5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("F5").Offset(i - 1, 0), " ", "")
        Worksheets("NO").Range("G5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("G5").Offset(i - 1, 0), " ", "")
        Worksheets("NO").Range("H5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("H5").Offset(i - 1, 0), " ", "")
        Worksheets("NO").Range("I5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("I5").Offset(i - 1, 0), " ", "")
        Worksheets("NO").Range("J5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("J5").Offset(i - 1, 0), " ", "")
    Next
    
    '找到各个项目对应的列，Ucase转大写，Lcase转小写
    For i = 1 To 10
        For j = 1 To 20
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "PRODUCTSPECNAME" Or UCase(Trim(Worksheets("NO").Cells(i, j))) = "SENSORNO." Then
                ProductSpecColumns = j
            End If
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "CONFIRMITEM" Then
                ConfirmItemColumns = j
            End If
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "PROCESSOPERATION" Then
                ProcessOperationColumns = j
            End If
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "FLOW" Then
                ProcessFlowColumns = j
            End If
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "STEPID" Then
                StepIDColumns = j
            End If
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "线别名" Then
                EqpColumns = j
            End If
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "设备名" Then
                UnitIDColumns = j
            End If
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "DCSPECNAME" Then
                DCSpecNameColumns = j
            End If
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "DCITEMDETAILS" Then
                DCItemDetailsColumns = j
        Exit For
            End If
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "USL" Then
                UpperLimitColumns = j
                CenterLineColumns = j + 1
                LowerLimitColumns = j + 2
        Exit For
            End If
        Next
    Next
    
    For i = 1 To 10
        For j = 10 To 25
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "SAMPLES" Then
                StartCount = i + 1
                SamplesCount = j
                PointCount = j + 1
        Exit For
            End If
        Next
    Next
    
    For i = 1 To 10
        For j = 25 To 35
            If UCase(Replace(Worksheets("NO").Cells(i, j), " ", "")) = "MAIN" Then
                MainChartTypeColumns = j
                SubChartTypeColumns = j + 1
        Exit For
            End If
        Next
    Next
    
    '生成各个表
    For Count = StartCount To 80
        '----------------------DATACOLLECTSPEC表------------------------'
        If Worksheets("NO").Cells(Count, 1) <> "" Then
            flag = False
            For Count2nd = 2 To DATACOLLECTSPECRowCount
                If Worksheets("NO").Cells(Count, DCSpecNameColumns) = Worksheets("DATACOLLECTSPEC").Cells(Count2nd, 2) Then
                    flag = True
            Exit For
                End If
            Next
            
            If flag = False Then
                DCSPECNAME = Worksheets("NO").Cells(Count, DCSpecNameColumns)
                DESCRIPTION = Worksheets("NO").Cells(Count, ConfirmItemColumns)
                CHECKSTATE = "CheckedIn"
                'Year(Now) & "/" & Month(Now) & "/" & Day(Now) & " " & Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)'
                CREATETIME = "SYSDATE"
                CREATEUSER = "BOE"
                MATERIALTYPE = "Lot"
                SAMPLEMATERIALTYPE = "Product"
                SAMPLECOUNT = 1
'                If Worksheets("NO").Cells(Count, SamplesCount) <> "" Then
'                    SAMPLECOUNT = Worksheets("NO").Cells(Count, SamplesCount)
'                Else
'                    For LoopCount = 1 To 5
'                        If Worksheets("NO").Cells(Count - LoopCount, SamplesCount) <> "" Then
'                            SAMPLECOUNT = Worksheets("NO").Cells(Count - LoopCount, SamplesCount)
'                    Exit For
'                        End If
'                    Next
'                End If
                DATACOLLECTSPECRowCount = DATACOLLECTSPECRowCount + 1
                Call CreateDATACOLLECTSPECData(DCSPECNAME, DESCRIPTION, CHECKSTATE, CREATETIME, CREATEUSER, MATERIALTYPE, SAMPLEMATERIALTYPE, SAMPLECOUNT, DATACOLLECTSPECRowCount)
                'Worksheets("DATACOLLECTSPEC").Row(DATACOLLECTSPECRowCount).BorderAround ColorIndex:=1, Weight:=xlThin
            End If
        End If
        
        
    Next
    Sheets("DATACOLLECTSPEC").Activate
    Worksheets("DATACOLLECTSPEC").Range(Cells(2, 2), Cells(DATACOLLECTSPECRowCount, 14)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("DATACOLLECTSPEC").Range(Cells(3, 14), Cells(DATACOLLECTSPECRowCount, 14)).Select
    
    '----------------------DATACOLLECTSPECITEM表------------------------'
    Sheets("DATACOLLECTSPECITEM").Activate

    For Count = StartCount To 80
        If Worksheets("NO").Cells(Count, 1) <> "" Then
            DCSPECNAME = Worksheets("NO").Cells(Count, DCSpecNameColumns)
            ITEMNAME = Worksheets("NO").Cells(Count, DCItemDetailsColumns)
            
            DATATYPE = "String"
            If Worksheets("NO").Cells(Count, PointCount) <> "" Then
                SITECOUNT = Worksheets("NO").Cells(Count, PointCount)
                If (SITECOUNT <> 1) Then
                    vbResult = MsgBox("发现点位大于1，是否继续？", vbOKCancel, "提示")
                    If vbResult = vbCancel Then
                        Exit Sub
                    End If
                End If
                
            Else
                For LoopCount = 1 To 5
                    If Worksheets("NO").Cells(Count - LoopCount, PointCount) <> "" Then
                        SITECOUNT = Worksheets("NO").Cells(Count - LoopCount, PointCount)
                Exit For
                    End If
                Next
            End If
            SITENAMES = ITEMNAME
            DATACOLLECTSPECITEMRowCount = DATACOLLECTSPECITEMRowCount + 1
            Call CreateDATACOLLECTSPECITEMData(DCSPECNAME, ITEMNAME, DATATYPE, SITECOUNT, SITENAMES, DATACOLLECTSPECITEMRowCount)
        End If
    Next
    
    '删除重复项
    For i = 4 To DATACOLLECTSPECITEMRowCount
        For j = 3 To i - 1
            If Worksheets("DATACOLLECTSPECITEM").Cells(i, 14) <> "" And Worksheets("DATACOLLECTSPECITEM").Cells(i, 14) = Worksheets("DATACOLLECTSPECITEM").Cells(j, 14) Then
                Worksheets("DATACOLLECTSPECITEM").Rows(i).Delete
                j = 3
            End If
        Next
    Next
    For i = 3 To 80
        If Worksheets("DATACOLLECTSPECITEM").Cells(i, 14) = "" Then
    Exit For
        End If
    Next
    
    '将结果选中
    Sheets("DATACOLLECTSPECITEM").Activate
    Worksheets("DATACOLLECTSPECITEM").Range(Cells(2, 2), Cells(i - 1, 14)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("DATACOLLECTSPECITEM").Range(Cells(3, 14), Cells(i - 1, 14)).Select
    
    '----------------------POSDCSPEC,SPCCONTROLSPEC,SPCCONTROLSPECCAPABILITY,SPCCONTROLSPECCHART,SPCCONTROLSPECRULE表------------------------'
    Sheets("POSDCSPEC").Activate
    snsFACTORYNAME = "LAMINATION"
    For Count = StartCount To 80
        If Worksheets("NO").Cells(Count, ProductSpecColumns) <> "" Then
            snsPRODUCTSPECNAME = Worksheets("NO").Cells(Count, ProductSpecColumns)
    Exit For
        End If
    Next
    
    For Count = StartCount To 80
        If Worksheets("NO").Cells(Count, ProcessFlowColumns) <> "" Then
            snsPROCESSFLOWNAME = Worksheets("NO").Cells(Count, ProcessFlowColumns)
    Exit For
        End If
    Next
    
    For Count = StartCount To 80 '遍历所有行
        If Worksheets("NO").Cells(Count, StepIDColumns) <> "" Then '判断StepID是否为空，为空则结束
            snsPROCESSOPERATIONNAME = Worksheets("NO").Cells(Count, StepIDColumns) '获取ProcessFlowName
            If (Worksheets("NO").Cells(Count, UnitIDColumns) <> "") Then '判断UnitID是否为空，如果为空，则结束
                LAMUnit = Worksheets("NO").Cells(Count, UnitIDColumns) '获取UnitID列表
                UnitArray = Split(LAMUnit, "、") '将UnitID列表分离成数组
                LAMEqp = Worksheets("NO").Cells(Count, EqpColumns) '获取LineID列表
                EqpArray = Split(LAMEqp, "、") '将LineID列表分离成数组
                For j = 1 To 50
                    If (Worksheets("NO").Cells(Count + j, UnitIDColumns) <> "") Or (Worksheets("NO").Cells(Count + j, UnitIDColumns) = "" And Worksheets("NO").Cells(Count + j + 1, UnitIDColumns) = "" And Worksheets("NO").Cells(Count + j, StepIDColumns) = "" And Worksheets("NO").Cells(Count + j + 1, StepIDColumns) = "") Then
                        DCSpecCount = j '获取UnitID列表对应的DCSpecName
                Exit For
                    End If
                Next
                
                For i = 0 To UBound(UnitArray) '遍历每个UnitID
                    For k = 0 To DCSpecCount - 1 '遍历DCSpecName
                        'POSDCSPEC表项
                        SNSUnitName = UnitArray(i)
                        snsMACHINENAME = EqpArray(i)
                        SNSDCSpecName = Worksheets("NO").Cells(Count + k, DCSpecNameColumns)
                        SNSDCSpecType = "String"
                        SNSConditionid = snsFACTORYNAME & "_" & snsPRODUCTSPECNAME & "_" & snsPROCESSFLOWNAME & "_" & snsPROCESSOPERATIONNAME & "_" & snsMACHINENAME
                        POSDCSPECRowCount = POSDCSPECRowCount + 1
                        'SPCCONTROLSPEC表项
                        SNSSPCControlSpecName = SNSDCSpecName & "-TPFOM0" & (i + 1)
                        SPCCONSPECRowCount = SPCCONSPECRowCount + 1
                        'SPCCONTROLSPECCAPABILITY,SPCCONTROLSPECCHART表项
                        SNSItemName = Worksheets("NO").Cells(Count + k, DCItemDetailsColumns)
                        'SPCCONSPECCHARTRowCount = SPCCONSPECCHARTRowCount + 2
                        SPCCONSPECCAPABILITYRowCount = SPCCONSPECCAPABILITYRowCount + 1
                        SNSLastCreatedTime = "SYSDATE"
                        Call CreateSPCCONTROLSPECCAPABILITYData(SNSSPCControlSpecName, SNSItemName, SNSLastCreatedTime, SPCCONSPECCAPABILITYRowCount)
                        For x = MainChartTypeColumns To SubChartTypeColumns
                            SNSChartName = Worksheets("NO").Cells(Count + k, x)
                            SPCCONSPECCHARTRowCount = SPCCONSPECCHARTRowCount + 1
                            Call CreateSPCCONTROLSPECCHARTData(SNSSPCControlSpecName, SNSItemName, SNSChartName, SPCCONSPECCHARTRowCount)
                        Next
                        'SPCCONTROLSPECRULE表项
                        For x = MainChartTypeColumns To SubChartTypeColumns
                            SNSChartName = Worksheets("NO").Cells(Count + k, MainChartTypeColumns)
                            If x = MainChartTypeColumns Then
                                SNSSPCControlRuleName = "OOC003"
                            Else
                                SNSSPCControlRuleName = "OOS008"
                            End If
                            SPCCONSPECRULERowCount = SPCCONSPECRULERowCount + 1
                            Call CreateSPCCONTROLSPECRULEData(SNSSPCControlSpecName, SNSItemName, SNSChartName, SNSSPCControlRuleName, SPCCONSPECRULERowCount)
                            
                            'Add By Sun 20160606
                            If x = MainChartTypeColumns Then
                                SNSSPCControlRuleName = "OOR001"
                            Else
                                SNSSPCControlRuleName = "OOT001"
                            End If
                            SPCCONSPECRULERowCount = SPCCONSPECRULERowCount + 1
                            Call CreateSPCCONTROLSPECRULEData(SNSSPCControlSpecName, SNSItemName, SNSChartName, SNSSPCControlRuleName, SPCCONSPECRULERowCount)
                        Next
                        SNSControlChartType = Worksheets("NO").Cells(Count + k, MainChartTypeColumns) & Worksheets("NO").Cells(Count + k, SubChartTypeColumns)
                        If Worksheets("NO").Cells(Count + k, UpperLimitColumns) = "-" Or Worksheets("NO").Cells(Count + k, UpperLimitColumns) = "" Or Worksheets("NO").Cells(Count + k, UpperLimitColumns) = 0 Then
                            SNSSpecLimitType = "LowerOnly"
                            SNSScreenLimitRemoveOption = ""
                        ElseIf Worksheets("NO").Cells(Count + k, LowerLimitColumns) = "-" Or Worksheets("NO").Cells(Count + k, LowerLimitColumns) = "" Or Worksheets("NO").Cells(Count + k, LowerLimitColumns) = 0 Then
                            SNSSpecLimitType = "UpperOnly"
                            SNSScreenLimitRemoveOption = ""
                        Else
                            SNSSpecLimitType = "Both"
                            SNSScreenLimitRemoveOption = ""
                        End If
                        SNSTarget = Worksheets("NO").Cells(Count + k, CenterLineColumns)
                        If SNSTarget = "" Or SNSTarget = "-" Or SNSTarget = 0 Then
                            SNSTarget = 0
                        End If
                        SNSUpperSpecLimit = Worksheets("NO").Cells(Count + k, UpperLimitColumns)
                        If SNSUpperSpecLimit = "" Or SNSUpperSpecLimit = "-" Or SNSUpperSpecLimit = 0 Then
                            SNSUpperSpecLimit = 0
                        End If
                        SNSLowerSpecLimit = Worksheets("NO").Cells(Count + k, LowerLimitColumns)
                        If SNSLowerSpecLimit = "" Or SNSLowerSpecLimit = "-" Or SNSLowerSpecLimit = 0 Then
                            SNSLowerSpecLimit = 0
                        End If
                        SNSUpperScreenLimit = 0
                        SNSLowerScreenLimit = 0
                        SPCCONSPECITEMRowCount = SPCCONSPECITEMRowCount + 1
                        Call CreateSPCCONTROLSPECITEMData(SNSSPCControlSpecName, SNSItemName, SNSControlChartType, SNSLastCreatedTime, SNSSpecLimitType, SNSTarget, SNSUpperSpecLimit, SNSLowerSpecLimit, SNSUpperScreenLimit, SNSLowerScreenLimit, SNSScreenLimitRemoveOption, SPCCONSPECITEMRowCount)
                        Call CreatePOSDCSPECData(SNSConditionid, SNSDCSpecName, SNSUnitName, SNSDCSpecType, POSDCSPECRowCount)
                        Call CreateSPCCONTROLSPECData(SNSSPCControlSpecName, SNSDCSpecName, snsFACTORYNAME, snsPRODUCTSPECNAME, snsPROCESSFLOWNAME, snsPROCESSOPERATIONNAME, snsMACHINENAME, SPCCONSPECRowCount)
                        

                    '遍历DCSpecName
                    Next
                '遍历每个UnitID
                Next
            '判断UnitID是否为空，如果为空，则结束
            End If
            
            '--------------------------------------------------------TPFOMPOLICY,POSMACHINE表------------------------------------------------------'
            If (Worksheets("NO").Cells(Count, EqpColumns) <> "") Then '判断LineID是否为空，如果为空，则结束
                LAMEqp = Worksheets("NO").Cells(Count, EqpColumns) '获取LineID列表
                EqpArray = Split(LAMEqp, "、") '将LineID列表分离成数组
'                For y = 1 To 50
'                    If (Worksheets("NO").Cells(Count + y, EqpColumns) <> "") Then
'                        DCSpecCount = j '获取UnitID列表对应的DCSpecName
'                Exit For
'                    End If
'                Next
                
                For i = 0 To UBound(EqpArray) '遍历每个UnitID
                    snsEQPID = EqpArray(i)
                    TPFOMPOLICYRowCount = TPFOMPOLICYRowCount + 1
                    POSMACHINERowCount = POSMACHINERowCount + 1
                    Call CreateTPFOMPOLICYData(snsFACTORYNAME, snsPRODUCTSPECNAME, snsPROCESSFLOWNAME, snsPROCESSOPERATIONNAME, snsEQPID, TPFOMPOLICYRowCount)
                    Call CreatePOSMACHINEData(snsFACTORYNAME, snsPRODUCTSPECNAME, snsPROCESSFLOWNAME, snsPROCESSOPERATIONNAME, snsEQPID, POSMACHINERowCount)
                Next
            End If
            
            
        '判断StepID是否为空，为空则结束
        End If
    '遍历所有行
    Next
    
    '删除重复项
    For i = 4 To POSDCSPECRowCount
        For j = 3 To i - 1
            If Worksheets("POSDCSPEC").Cells(i, 6) <> "" And Worksheets("POSDCSPEC").Cells(i, 6) = Worksheets("POSDCSPEC").Cells(j, 6) Then
                Worksheets("POSDCSPEC").Rows(i).Delete
                j = 2
            End If
        Next
    Next
    
    '将结果选中
    For i = 3 To 100
        If Worksheets("POSDCSPEC").Cells(i, 6) = "" Then
    Exit For
        End If
    Next
    Sheets("POSDCSPEC").Activate
    'Worksheets("POSDCSPEC").Range(Cells(2, 2), Cells(i - 1, 6)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("POSDCSPEC").Range(Cells(3, 6), Cells(i - 1, 6)).Select
    
    '删除重复项
    For i = 4 To SPCCONSPECRowCount
        For j = 3 To i - 1
            If Worksheets("SPCCONTROLSPEC").Cells(i, 19) <> "" And Worksheets("SPCCONTROLSPEC").Cells(i, 19) = Worksheets("SPCCONTROLSPEC").Cells(j, 19) Then
                Worksheets("SPCCONTROLSPEC").Rows(i).Delete
                j = 2
            End If
        Next
    Next
    
    '将结果选中
    For i = 3 To 100
        If Worksheets("SPCCONTROLSPEC").Cells(i, 19) = "" Then
    Exit For
        End If
    Next
    Sheets("SPCCONTROLSPEC").Activate
    'Worksheets("SPCCONTROLSPEC").Range(Cells(2, 2), Cells(i - 1, 19)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("SPCCONTROLSPEC").Range(Cells(3, 19), Cells(i - 1, 19)).Select
  
    '删除重复项
    For i = 4 To SPCCONSPECCHARTRowCount
        For j = 3 To i - 1
            If Worksheets("SPCCONTROLSPECCHART").Cells(i, 11) <> "" And Worksheets("SPCCONTROLSPECCHART").Cells(i, 11) = Worksheets("SPCCONTROLSPECCHART").Cells(j, 11) Then
                Worksheets("SPCCONTROLSPECCHART").Rows(i).Delete
                j = 2
            End If
        Next
    Next
    
    '将结果选中
    For i = 3 To 800
        If Worksheets("SPCCONTROLSPECCHART").Cells(i, 11) = "" Then
    Exit For
        End If
    Next
    Sheets("SPCCONTROLSPECCHART").Activate
    'Worksheets("SPCCONTROLSPECCHART").Range(Cells(2, 2), Cells(i - 1, 11)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("SPCCONTROLSPECCHART").Range(Cells(3, 11), Cells(i - 1, 11)).Select
    
    '删除重复项
    For i = 4 To SPCCONSPECCAPABILITYRowCount
        For j = 3 To i - 1
            If Worksheets("SPCCONTROLSPECCAPABILITY").Cells(i, 6) <> "" And Worksheets("SPCCONTROLSPECCAPABILITY").Cells(i, 6) = Worksheets("SPCCONTROLSPECCAPABILITY").Cells(j, 6) Then
                Worksheets("SPCCONTROLSPECCAPABILITY").Rows(i).Delete
                j = 2
            End If
        Next
    Next
    
    '将结果选中
    For i = 3 To 800
        If Worksheets("SPCCONTROLSPECCAPABILITY").Cells(i, 6) = "" Then
    Exit For
        End If
    Next
    Sheets("SPCCONTROLSPECCAPABILITY").Activate
    'Worksheets("SPCCONTROLSPECCAPABILITY").Range(Cells(2, 2), Cells(i - 1, 6)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("SPCCONTROLSPECCAPABILITY").Range(Cells(3, 6), Cells(i - 1, 6)).Select
    
    '删除重复项
    For i = 4 To SPCCONSPECRULERowCount
        For j = 3 To i - 1
            If Worksheets("SPCCONTROLSPECRULE").Cells(i, 6) <> "" And Worksheets("SPCCONTROLSPECRULE").Cells(i, 6) = Worksheets("SPCCONTROLSPECRULE").Cells(j, 6) Then
                Worksheets("SPCCONTROLSPECRULE").Rows(i).Delete
                j = 2
            End If
        Next
    Next
    
    '将结果选中
    For i = 3 To 1200
        If Worksheets("SPCCONTROLSPECRULE").Cells(i, 6) = "" Then
    Exit For
        End If
    Next
    Sheets("SPCCONTROLSPECRULE").Activate
    'Worksheets("SPCCONTROLSPECRULE").Range(Cells(2, 2), Cells(i - 1, 6)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("SPCCONTROLSPECRULE").Range(Cells(3, 6), Cells(i - 1, 6)).Select
    
    
    '删除重复项
    For i = 4 To SPCCONSPECITEMRowCount
        For j = 3 To i - 1
            If Worksheets("SPCCONTROLSPECITEM").Cells(i, 19) <> "" And Worksheets("SPCCONTROLSPECITEM").Cells(i, 19) = Worksheets("SPCCONTROLSPECITEM").Cells(j, 19) Then
                Worksheets("SPCCONTROLSPECITEM").Rows(i).Delete
                j = 2
            End If
        Next
    Next
    
    '将结果选中
    For i = 3 To 800
        If Worksheets("SPCCONTROLSPECITEM").Cells(i, 19) = "" Then
    Exit For
        End If
    Next
    Sheets("SPCCONTROLSPECITEM").Activate
    'Worksheets("SPCCONTROLSPECITEM").Range(Cells(2, 2), Cells(i - 1, 19)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("SPCCONTROLSPECITEM").Range(Cells(3, 19), Cells(i - 1, 19)).Select
    
    '删除重复项
    For i = 4 To TPFOMPOLICYRowCount
        For j = 3 To i - 1
            If Worksheets("TPFOMPOLICY").Cells(i, 8) <> "" And Worksheets("TPFOMPOLICY").Cells(i, 8) = Worksheets("TPFOMPOLICY").Cells(j, 8) Then
                Worksheets("TPFOMPOLICY").Rows(i).Delete
                j = 2
            End If
        Next
    Next
    
    '将结果选中
    For i = 3 To 800
        If Worksheets("TPFOMPOLICY").Cells(i, 8) = "" Then
    Exit For
        End If
    Next
    Sheets("TPFOMPOLICY").Activate
    'Worksheets("TPFOMPOLICY").Range(Cells(2, 2), Cells(i - 1, 8)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("TPFOMPOLICY").Range(Cells(3, 8), Cells(i - 1, 8)).Select
    
    '删除重复项
    For i = 4 To POSMACHINERowCount
        For j = 3 To i - 1
            If Worksheets("POSMACHINE").Cells(i, 6) <> "" And Worksheets("POSMACHINE").Cells(i, 6) = Worksheets("POSMACHINE").Cells(j, 6) Then
                Worksheets("POSMACHINE").Rows(i).Delete
                j = 2
            End If
        Next
    Next
    
    '将结果选中
    For i = 3 To 800
        If Worksheets("POSMACHINE").Cells(i, 6) = "" Then
    Exit For
        End If
    Next
    Sheets("POSMACHINE").Activate
    'Worksheets("POSMACHINE").Range(Cells(2, 2), Cells(i - 1, 6)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("POSMACHINE").Range(Cells(3, 6), Cells(i - 1, 6)).Select
    
End Sub
