'这个文件只有一个sub函数(宏名就是CreateData)

'CreateData：创建数据
Public Sub CreateData()

    'ClearContents：清除内容(清除的是一个域的内容)
    Worksheets("DATACOLLECTSPEC").Range("B3:N500").ClearContents
    Worksheets("DATACOLLECTSPECITEM").Range("B3:N500").ClearContents
    Worksheets("POSDCSPEC").Range("B3:F500").ClearContents
    Worksheets("SPCCONTROLSPEC").Range("B3:T500").ClearContents
    Worksheets("SPCCONTROLSPECCHART").Range("B3:M500").ClearContents
    Worksheets("SPCCONTROLSPECCAPABILITY").Range("B3:H500").ClearContents
    Worksheets("SPCCONTROLSPECRULE").Range("B3:H500").ClearContents
    Worksheets("SPCCONTROLSPECITEM").Range("B3:T500").ClearContents
    
    Dim DATACOLLECTSPECRowCount
    Dim DATACOLLECTSPECITEMRowCount
    Dim POSDCSPECRowCount
    Dim SPCCONSPECRowCount
    Dim SPCCONSPECCHARTRowCount
    Dim SPCCONSPECCAPABILITYRowCount
    Dim SPCCONSPECRULERowCount
    Dim SPCCONSPECITEMRowCount
    
    '将变量全部赋值为2
    DATACOLLECTSPECRowCount = 2
    DATACOLLECTSPECITEMRowCount = 2
    POSDCSPECRowCount = 2
    SPCCONSPECRowCount = 2
    SPCCONSPECCHARTRowCount = 2
    SPCCONSPECCAPABILITYRowCount = 2
    SPCCONSPECRULERowCount = 2
    SPCCONSPECITEMRowCount = 2
    

    '去除可能存在的空格(将单元格所有的空格都清除)
    Sheets("NO").Activate
    For i = 1 To 50
        '将字段SensorNo.到字段DCSpecName下面的数据清除单元格
        Worksheets("NO").Range("C5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("C5").Offset(i - 1, 0), " ", "")
        Worksheets("NO").Range("F5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("F5").Offset(i - 1, 0), " ", "")
        Worksheets("NO").Range("G5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("G5").Offset(i - 1, 0), " ", "")
        Worksheets("NO").Range("H5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("H5").Offset(i - 1, 0), " ", "")
        Worksheets("NO").Range("I5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("I5").Offset(i - 1, 0), " ", "")
        Worksheets("NO").Range("J5").Offset(i - 1, 0) = Replace(Sheets("NO").Range("J5").Offset(i - 1, 0), " ", "")
    Next
    '由于Replace函数只替换字符串中的指定字符（或字符串），因此只有A1单元格中的前后空格被替换为空字符串，而其他位置的空格不受影响
    'caa1 = Sheets ("sheet1").Range ("A1").Offset (0, 0) .value  ' 将 A1 的值赋给变量 Caa1
    'caa2= Sheets ("sheet1").Range ("A1").Offset (1, 0).value ' 将 A2 的值赋给变量 Caa2


    '上面这样表示单元格： Worksheets("NO").Range("C5")
    '下面这样表示单元格： Worksheets("NO").Cells(i, j)

    '找到各个项目对应的列(从区域(1,1)到(10,20)检索判断条件)
    For i = 1 To 10
        For j = 1 To 20
            'SensorNo≠Sensor No(有空格)
            If Worksheets("NO").Cells(i, j) = "ProductSpecName" Or Worksheets("NO").Cells(i, j) = "ProductSpec Name" Or Worksheets("NO").Cells(i, j) = "SensorNo." Or Worksheets("NO").Cells(i, j) = "Sensor No." Then
                '给SensorNo的列定个位(下面同理)
                ProductSpecColumns = j
            End If
            If Worksheets("NO").Cells(i, j) = "Confirm Item" Or Worksheets("NO").Cells(i, j) = "ConfirmItem" Then
                ConfirmItemColumns = j
            End If
            If Worksheets("NO").Cells(i, j) = "Process Operation" Or Worksheets("NO").Cells(i, j) = "ProcessOperation" Then
                ProcessOperationColumns = j
            End If
            If Worksheets("NO").Cells(i, j) = "Step ID" Or Worksheets("NO").Cells(i, j) = "StepID" Then
                StepIDColumns = j
            End If
            If Left(Worksheets("NO").Cells(i, j), 3) = "EQP" Then
                UnitIDColumns = j
            End If
            If Worksheets("NO").Cells(i, j) = "DC Spec Name" Or Worksheets("NO").Cells(i, j) = "DCSpecName" Then
                DCSpecNameColumns = j
            End If
            If Worksheets("NO").Cells(i, j) = "DC Item Details" Or Worksheets("NO").Cells(i, j) = "DCItemDetails" Then
                DCItemDetailsColumns = j
        Exit For
            End If
            If UCase(Worksheets("NO").Cells(i, j)) = "USL" Then
                UpperLimitColumns = j
                '字段Target在字段USL后面，所以+1就可以了
                CenterLineColumns = j + 1
                'LSL同理
                LowerLimitColumns = j + 2
        Exit For
            End If  
        Next
    Next
    
    For i = 1 To 10
        For j = 10 To 25
            If Worksheets("NO").Cells(i, j) = "Samples" Then
            '和上面一样
                StartCount = i + 1
                SamplesCount = j
                PointCount = j + 1
        Exit For
            End If
        Next
    Next
    
    For i = 1 To 10
        For j = 25 To 35
            If Worksheets("NO").Cells(i, j) = "Main" Then
            '和上面一样
                MainChartTypeColumns = j
                SubChartTypeColumns1 = j + 1
                SubChartTypeColumns2 = j + 2
                '这段代码的功能是判断在名为“NO”的工作表中，第i行的SubChartTypeColumns2列是否为空，如果不为空，则会弹出一个消息框，提示用户在“Sub”后添加一列。
                If Worksheets("NO").Cells(i, SubChartTypeColumns2) <> "" Then
                    messagebox = MsgBox("请在Sub后添加一列！", vbYesNo, "警告")
                End If
        Exit For
            End If
        Next
    Next
    
    '生成各个表

    'If Worksheets("NO").Cells(6, 17) = "Samples" Then
    'StartCount = i + 1 = 6 + 1
    '变量StartCount最开始是7(sheet表NO第7行才有数据)
    For Count = StartCount To 80
        '----------------------DATACOLLECTSPEC表------------------------'
        '最开始是Worksheets("NO").Cells(7, 3)
        '判断字段SensorNo.下的数据前后是否有空格
        If Worksheets("NO").Cells(Count, ProductSpecColumns) <> "" And Left(Worksheets("NO").Cells(Count, ProductSpecColumns), 1) <> " " And Right(Worksheets("NO").Cells(Count, ProductSpecColumns), 1) <> " " Then
            flag = False
            'DATACOLLECTSPECRowCount = 2
            For Count2nd = 2 To DATACOLLECTSPECRowCount
                '判断表NO中的字段DCSPECNAME和表DATACOLLECTSPEC中的是否相等
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
                If Worksheets("NO").Cells(Count, SamplesCount) <> "" Then
                    SAMPLECOUNT = Worksheets("NO").Cells(Count, SamplesCount)
                Else
                    For LoopCount = 1 To 5
                        'Count = StartCount = 7(count的值在前面并没有变化)
                        If Worksheets("NO").Cells(Count - LoopCount, SamplesCount) <> "" Then
                            SAMPLECOUNT = Worksheets("NO").Cells(Count - LoopCount, SamplesCount)
                    Exit For
                        End If
                    Next
                End If
                '每次+1都会给表DATACOLLECTSPEC增加一条记录
                DATACOLLECTSPECRowCount = DATACOLLECTSPECRowCount + 1
                '变量在前面设置好了
                Call CreateDATACOLLECTSPECData(DCSPECNAME, DESCRIPTION, CHECKSTATE, CREATETIME, CREATEUSER, MATERIALTYPE, SAMPLEMATERIALTYPE, SAMPLECOUNT, DATACOLLECTSPECRowCount)
                'Worksheets("DATACOLLECTSPEC").Row(DATACOLLECTSPECRowCount).BorderAround ColorIndex:=1, Weight:=xlThin
            End If
        End If
        
        
    Next
    '通过Activate方法激活名为“DATACOLLECTSPEC”的工作表
    Sheets("DATACOLLECTSPEC").Activate
    '给域添加外侧框线
    '选中该工作表中从第2行第2列到第DATACOLLECTSPECRowCount行第14列的所有单元格，通过BorderAround方法给选中的单元格添加边框，边框颜色为颜色索引1(通常是黑色)，边框线条粗细为xlThin(细线)。
    Worksheets("DATACOLLECTSPEC").Range(Cells(2, 2), Cells(DATACOLLECTSPECRowCount, 14)).BorderAround ColorIndex:=3, Weight:=xlThick
    '选中该工作表中从第3行第14列到第DATACOLLECTSPECRowCount行第14列的所有单元格，通过Select方法选中这些单元格。这里使用Select方法是为了对这些单元格进行后续的格式调整或数据处理，例如改变单元格背景颜色、进行数据筛选等。
    Worksheets("DATACOLLECTSPEC").Range(Cells(3, 14), Cells(DATACOLLECTSPECRowCount, 14)).Select
    
    ActiveSheet.Cells.Columns.AutoFit
    ActiveSheet.Cells.Rows.AutoFit

    '----------------------DATACOLLECTSPECITEM表------------------------'
    Sheets("DATACOLLECTSPECITEM").Activate
    '和上面一样Count = StartCount = 7
    For Count = StartCount To 80 
        If Worksheets("NO").Cells(Count, ProductSpecColumns) <> "" And Left(Worksheets("NO").Cells(Count, ProductSpecColumns), 1) <> " " And Right(Worksheets("NO").Cells(Count, ProductSpecColumns), 1) <> " " Then
            'sheet表NO中的字段DCSpecName
            DCSPECNAME = Worksheets("NO").Cells(Count, DCSpecNameColumns)
            'sheet表NO中的字段DC Item Details
            ITEMNAME = Worksheets("NO").Cells(Count, DCItemDetailsColumns)
            
            DATATYPE = "String"
            If Worksheets("NO").Cells(Count, PointCount) <> "" Then
                SITECOUNT = Worksheets("NO").Cells(Count, PointCount)
            Else
                '合并居中的问题，如果当前单元格没有数据，就往上看有没有
                For LoopCount = 1 To 5
                    If Worksheets("NO").Cells(Count - LoopCount, PointCount) <> "" Then
                        SITECOUNT = Worksheets("NO").Cells(Count - LoopCount, PointCount)
                Exit For
                    End If
                Next
            End If
            'S01^S02^S03^S04^S05^S06^S07^S08^S09^S10^S11^S12^S13^S14^S15^S16^S17^S18^S19^S20^S21^S22^S23^S24
            SITENAMES = CreateITEMNAMEData(SITECOUNT)
            '每次+1都会给表DATACOLLECTSPECITEM增加一条记录
            DATACOLLECTSPECITEMRowCount = DATACOLLECTSPECITEMRowCount + 1
            Call CreateDATACOLLECTSPECITEMData(DCSPECNAME, ITEMNAME, DATATYPE, SITECOUNT, SITENAMES, DATACOLLECTSPECITEMRowCount)
        End If
    Next
    
    '删除重复项
    '许多单元格(j)和单个单元格(i)作比较
    For i = 4 To DATACOLLECTSPECITEMRowCount
        For j = 3 To i - 1
            If Worksheets("DATACOLLECTSPECITEM").Cells(i, 14) <> "" And Worksheets("DATACOLLECTSPECITEM").Cells(i, 14) = Worksheets("DATACOLLECTSPECITEM").Cells(j, 14) Then
                '默认删除单元格后整体向上移动
                Worksheets("DATACOLLECTSPECITEM").Rows(i).Delete
                '如果相等，则将当前行删除，并将内层循环的计数器j重新设置为3，以重新开始比较新的行
                j = 3
            End If
        Next
    Next
    '请注意，在删除行时，循环变量i需要保持不变，以便正确地遍历所有行。因此，当发现重复行时，需要在内层循环中将计数器j重新设置为3，并从头开始比较新的行。这将确保所有重复行都被删除，并且没有跳过任何行。

    '该代码可以用于查找工作表中第一个空单元格的位置，并将其作为其他操作的起点，例如向该单元格所在的行中添加新数据
    For i = 3 To 80
        If Worksheets("DATACOLLECTSPECITEM").Cells(i, 14) = "" Then
    Exit For
        End If
    Next
    
    '将结果选中
    Sheets("DATACOLLECTSPECITEM").Activate
    Worksheets("DATACOLLECTSPECITEM").Range(Cells(2, 2), Cells(i - 1, 14)).BorderAround ColorIndex:=3, Weight:=xlThick
    '下面被注释的代码在有重复值时是错误的
    'Worksheets("DATACOLLECTSPEC").Range(Cells(3, 14), Cells(DATACOLLECTSPECITEMRowCount, 14)).Select
    Worksheets("DATACOLLECTSPECITEM").Range(Cells(3, 14), Cells(i - 1, 14)).Select

    ActiveSheet.Cells.Columns.AutoFit
    ActiveSheet.Cells.Rows.AutoFit
    
    '----------------------POSDCSPEC,SPCCONTROLSPEC,SPCCONTROLSPECCAPABILITY,SPCCONTROLSPECCHART,SPCCONTROLSPECRULE表------------------------'
    Sheets("POSDCSPEC").Activate
    SNSFactoryName = "ENIG"
    '和上面一样Count = StartCount = 7
    For Count = StartCount To 80
        If Worksheets("NO").Cells(Count, ProductSpecColumns) <> "" And Left(Worksheets("NO").Cells(Count, ProductSpecColumns), 1) <> " " And Right(Worksheets("NO").Cells(Count, ProductSpecColumns), 1) <> " "Then
            SNSProductSpecName = Worksheets("NO").Cells(Count, ProductSpecColumns)
    Exit For
        End If
    Next

    '函数GetProcessFlowName用于连接数据库(本地测试直接注释掉就可以运行了)
    SNSProcessFlowName = ""
    Dim r As Collection
    Set r = GetProcessFlowName(SNSProductSpecName)
    If r.Count > 0 Then
      '连接数据库是为了获取对应的processflow
      SNSProcessFlowName = r(1)
    Else
      messagebox = MsgBox("未查询到ProcessFlowName信息！", vbYesNo, "警告")
    End If
    
    For Count = StartCount To 80
        'Mid函数用于从一个字符串中提取指定长度的子串
        '下面是例子
        'Dim str As String
        'str = "Hello, World!"
        'MsgBox Mid(str, 2, 3) ' 输出 "ell"
        '从单元格第2个位置提取3个字符
        If Worksheets("NO").Cells(Count, StepIDColumns) <> "" And ((Mid(Worksheets("NO").Cells(Count, StepIDColumns), 3, 1) = "M" Or Mid(Worksheets("NO").Cells(Count, StepIDColumns), 6, 1) = "M")) Then
            SNSProcessOperationName = Worksheets("NO").Cells(Count, StepIDColumns)
            '从sheet表NO中的字段StepID到字段DCSpecName
            '两个字段之间的单元格如果有空的则触发下面的Else语句
            For LoopCount = StepIDColumns + 1 To DCSpecNameColumns - 1
                If Worksheets("NO").Cells(Count, LoopCount) = "" Then
            Exit For
                Else
                    'POSDCSPEC表项
                    SNSUnitName = Worksheets("NO").Cells(Count, LoopCount)
                    '5SMTE01-CD01  5SMTE01-MP01
                    If SNSUnitName = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                        SNSUnitName = "5SMTE01-CD01"
                    End If
                    If SNSUnitName = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                        SNSUnitName = "5SMTE01-MP01"
                    End If
                    '5SMTE02-MP02
                    If SNSUnitName = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                        SNSUnitName = "5SMTE02-MP02"
                    End If
                    '5SMTE03-MP03
                    If SNSUnitName = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                        SNSUnitName = "5SMTE03-MP03"
                    End If
                    '5SMTE04-CD02
                    If SNSUnitName = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                        SNSUnitName = "5SMTE04-CD02"
                    End If
                    '5SMTE05-CD03
                    If SNSUnitName = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                        SNSUnitName = "5SMTE05-CD03"
                    End If

                    'ENIG只有一台设备，所以Unit ID直接写死
                    'SNSUnitName = '5SMTE01-CD01'  '不知道对不对，需要检验一下

                    SNSDCSpecName = Worksheets("NO").Cells(Count, DCSpecNameColumns)
                    '提取前7个字符
                    SNSMachineName = Left(SNSUnitName, 7)
                    SNSDCSpecType = "String"
                    '表POSDCSPEC中的字段CONDITIONID
                    SNSConditionid = SNSFactoryName & "_" & SNSProductSpecName & "_" & SNSProcessFlowName & "_" & SNSProcessOperationName & "_" & SNSMachineName
                    '每次+1都会给表POSDCSPEC增加一条记录
                    POSDCSPECRowCount = POSDCSPECRowCount + 1
                    '表SPCCONTROLSPEC中的字段SPCCONTROLSPECNAME
                    'TPFOM01代表的是EQP1-UnitID，TPFOM02代表的是EQP2-UnitID(01和02是偏移量，一般也只有这两种情况)
                    SNSSPCControlSpecName = SNSDCSpecName & "-TPFOM0" & (LoopCount - StepIDColumns)
                    '每次+1都会给表SPCCONTROLSPEC增加一条记录
                    SPCCONSPECRowCount = SPCCONSPECRowCount + 1
                    'SPCCONTROLSPECCAPABILITY,SPCCONTROLSPECCHART表项
                    '一般情况下表NO中的字段DCItemDetailsColumns没有数据会等于TR和PI_TOTAL
                    If Worksheets("NO").Cells(Count, DCItemDetailsColumns) <> "TR" And Worksheets("NO").Cells(Count, DCItemDetailsColumns) <> "PI_TOTAL" Then
                        SNSItemName = Worksheets("NO").Cells(Count, DCItemDetailsColumns)
                        'SPCCONSPECCHARTRowCount = SPCCONSPECCHARTRowCount + 2
                        SPCCONSPECCAPABILITYRowCount = SPCCONSPECCAPABILITYRowCount + 1
                        SNSLastCreatedTime = "SYSDATE"
                        Call CreateSPCCONTROLSPECCAPABILITYData(SNSSPCControlSpecName, SNSItemName, SNSLastCreatedTime, SPCCONSPECCAPABILITYRowCount)
                        For k = MainChartTypeColumns To SubChartTypeColumns2
                            If Replace(Worksheets("NO").Cells(Count, k), " ", "") <> "" Then
                                SNSChartName = Worksheets("NO").Cells(Count, k)
                                SPCCONSPECCHARTRowCount = SPCCONSPECCHARTRowCount + 1
                                Call CreateSPCCONTROLSPECCHARTData(SNSSPCControlSpecName, SNSItemName, SNSChartName, SPCCONSPECCHARTRowCount)
                            End If
                        Next
                        'SPCCONTROLSPECRULE表项
                        For k = MainChartTypeColumns To SubChartTypeColumns2
                            If Replace(Worksheets("NO").Cells(Count, MainChartTypeColumns), " ", "") <> "" Then
                                SNSChartName = Worksheets("NO").Cells(Count, MainChartTypeColumns)
                                If k = MainChartTypeColumns Then
                                    If SNSItemName <> "TPDX" And SNSItemName <> "TPDY" And SNSItemName <> "OLX" And SNSItemName <> "OLY" Then
                                        SNSSPCControlRuleName = "OOC003"
                                        SPCCONSPECRULERowCount = SPCCONSPECRULERowCount + 1
                                        Call CreateSPCCONTROLSPECRULEData(SNSSPCControlSpecName, SNSItemName, SNSChartName, SNSSPCControlRuleName, SPCCONSPECRULERowCount)
                                    End If
                                Else
                                    SNSSPCControlRuleName = "OOS007"
                                    SPCCONSPECRULERowCount = SPCCONSPECRULERowCount + 1
                                Call CreateSPCCONTROLSPECRULEData(SNSSPCControlSpecName, SNSItemName, SNSChartName, SNSSPCControlRuleName, SPCCONSPECRULERowCount)
                                End If
                                
                                'Add By Sun 20160606
                                If k = MainChartTypeColumns Then
                                    SNSSPCControlRuleName = "OOR001"
                                Else
                                    SNSSPCControlRuleName = "OOT001"
                                End If
                                SPCCONSPECRULERowCount = SPCCONSPECRULERowCount + 1
                                Call CreateSPCCONTROLSPECRULEData(SNSSPCControlSpecName, SNSItemName, SNSChartName, SNSSPCControlRuleName, SPCCONSPECRULERowCount)
                            End If
                        Next
                        SNSControlChartType = Worksheets("NO").Cells(Count, MainChartTypeColumns) & Worksheets("NO").Cells(Count, SubChartTypeColumns1) & Replace(Worksheets("NO").Cells(Count, SubChartTypeColumns2), " ", "")
                        If Worksheets("NO").Cells(Count, UpperLimitColumns) = 0 Then
                            SNSSpecLimitType = "LowerOnly"
                            SNSScreenLimitRemoveOption = ""
                        ElseIf Worksheets("NO").Cells(Count, LowerLimitColumns) = 0 Then
                            SNSSpecLimitType = "UpperOnly"
                            SNSScreenLimitRemoveOption = ""
                        Else
                            SNSSpecLimitType = "Both"
                            SNSScreenLimitRemoveOption = "OnePoint"
                        End If
                        SNSTarget = Worksheets("NO").Cells(Count, CenterLineColumns)
                        If SNSTarget = "" Then
                            SNSTarget = 0
                        End If
                        '如果字段UpperLimitColumns为空就赋值为0
                        SNSUpperSpecLimit = Worksheets("NO").Cells(Count, UpperLimitColumns)
                        If SNSUpperSpecLimit = "" Then
                            SNSUpperSpecLimit = 0
                        End If
                        '同上
                        SNSLowerSpecLimit = Worksheets("NO").Cells(Count, LowerLimitColumns)
                        If SNSLowerSpecLimit = "" Then
                            SNSLowerSpecLimit = 0
                        End If
                        '看代码的好处
                        SNSUpperScreenLimit = SNSUpperSpecLimit * 5
                        If SNSLowerSpecLimit >= 0 Then
                            SNSLowerScreenLimit = SNSLowerSpecLimit / 5
                        Else
                            SNSLowerScreenLimit = SNSLowerSpecLimit * 5
                        End If
                        'Add 2021.09.29, SiteOutCheck
                        SNSSiteOutCheck = ""
                        If SNSControlChartType <> "LSR" Then
                            SNSSiteOutCheck = "SRO:1"
                        End If
                        SPCCONSPECITEMRowCount = SPCCONSPECITEMRowCount + 1
                        
                        Call CreateSPCCONTROLSPECITEMData(SNSSPCControlSpecName, SNSItemName, SNSControlChartType, SNSLastCreatedTime, SNSSpecLimitType, SNSTarget, SNSUpperSpecLimit, SNSLowerSpecLimit, SNSUpperScreenLimit, SNSLowerScreenLimit, SNSScreenLimitRemoveOption, SNSSiteOutCheck, SPCCONSPECITEMRowCount)
                    End If
                    Call CreatePOSDCSPECData(SNSConditionid, SNSDCSpecName, SNSUnitName, SNSDCSpecType, POSDCSPECRowCount)
                    Call CreateSPCCONTROLSPECData(SNSSPCControlSpecName, SNSDCSpecName, SNSFactoryName, SNSProductSpecName, SNSProcessFlowName, SNSProcessOperationName, SNSMachineName, SPCCONSPECRowCount)
                End If
            Next
        End If
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
    
    '感觉不删除重复项其实也可以(sql只会导入一行记录)

    '将结果选中
    For i = 3 To 80
        If Worksheets("POSDCSPEC").Cells(i, 6) = "" Then
    Exit For
        End If
    Next
    Sheets("POSDCSPEC").Activate
    Worksheets("POSDCSPEC").Range(Cells(2, 2), Cells(i - 1, 6)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("POSDCSPEC").Range(Cells(3, 6), Cells(i - 1, 6)).Select
    
    ActiveSheet.Cells.Columns.AutoFit
    ActiveSheet.Cells.Rows.AutoFit

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
    For i = 3 To 80
        If Worksheets("SPCCONTROLSPEC").Cells(i, 19) = "" Then
    Exit For
        End If
    Next
    Sheets("SPCCONTROLSPEC").Activate
    Worksheets("SPCCONTROLSPEC").Range(Cells(2, 2), Cells(i - 1, 19)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("SPCCONTROLSPEC").Range(Cells(3, 19), Cells(i - 1, 19)).Select
  
    ActiveSheet.Cells.Columns.AutoFit
    ActiveSheet.Cells.Rows.AutoFit

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
    For i = 3 To 200
        If Worksheets("SPCCONTROLSPECCHART").Cells(i, 11) = "" Then
    Exit For
        End If
    Next
    Sheets("SPCCONTROLSPECCHART").Activate
    Worksheets("SPCCONTROLSPECCHART").Range(Cells(2, 2), Cells(i - 1, 11)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("SPCCONTROLSPECCHART").Range(Cells(3, 11), Cells(i - 1, 11)).Select
    
    ActiveSheet.Cells.Columns.AutoFit
    ActiveSheet.Cells.Rows.AutoFit

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
    For i = 3 To 200
        If Worksheets("SPCCONTROLSPECCAPABILITY").Cells(i, 6) = "" Then
    Exit For
        End If
    Next
    Sheets("SPCCONTROLSPECCAPABILITY").Activate
    Worksheets("SPCCONTROLSPECCAPABILITY").Range(Cells(2, 2), Cells(i - 1, 6)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("SPCCONTROLSPECCAPABILITY").Range(Cells(3, 6), Cells(i - 1, 6)).Select
    
    ActiveSheet.Cells.Columns.AutoFit
    ActiveSheet.Cells.Rows.AutoFit

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
    For i = 3 To 200
        If Worksheets("SPCCONTROLSPECRULE").Cells(i, 6) = "" Then
    Exit For
        End If
    Next
    Sheets("SPCCONTROLSPECRULE").Activate
    Worksheets("SPCCONTROLSPECRULE").Range(Cells(2, 2), Cells(i - 1, 6)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("SPCCONTROLSPECRULE").Range(Cells(3, 6), Cells(i - 1, 6)).Select
    
    ActiveSheet.Cells.Columns.AutoFit
    ActiveSheet.Cells.Rows.AutoFit
    
    '删除重复项
    For i = 4 To SPCCONSPECITEMRowCount
        For j = 3 To i - 1
            If Worksheets("SPCCONTROLSPECITEM").Cells(i, 20) <> "" And Worksheets("SPCCONTROLSPECITEM").Cells(i, 20) = Worksheets("SPCCONTROLSPECITEM").Cells(j, 20) Then
                Worksheets("SPCCONTROLSPECITEM").Rows(i).Delete
                j = 2
            End If
        Next
    Next
    
    '将结果选中
    For i = 3 To 200
        If Worksheets("SPCCONTROLSPECITEM").Cells(i, 20) = "" Then
    Exit For
        End If
    Next
    Sheets("SPCCONTROLSPECITEM").Activate
    Worksheets("SPCCONTROLSPECITEM").Range(Cells(2, 2), Cells(i - 1, 20)).BorderAround ColorIndex:=1, Weight:=xlThin
    Worksheets("SPCCONTROLSPECITEM").Range(Cells(3, 20), Cells(i - 1, 20)).Select
    
    ActiveSheet.Cells.Columns.AutoFit
    ActiveSheet.Cells.Rows.AutoFit

    '添加这行代码后方便复制粘贴
    Sheets("DATACOLLECTSPEC").Select
    
End Sub



'这个VBA代码用于在多个工作表中创建数据。宏的名称是`CreateData`。
'
'### 下面是该脚本所做工作的摘要：
'
'1. 它首先清除了几个工作表中的单元格内容。
'2. 然后，它初始化各种变量，并将其全部赋值为2。
'3. 接下来，它删除了工作表 "NO "上某些范围内可能存在的空格。
'4. 之后，它通过在特定范围内的单元格中进行循环，为不同的项目确定列。
'5. 随后，脚本根据满足或不满足的条件生成像 "DATACOLLECTSPEC"、"DATACOLLECTSPECITEM "和其他表格。
'6. 在这些处理过程中，一些子程序被调用，这些子程序似乎是在其他地方定义的（如 "CreateDATACOLLECTSPECData"，"CreateSPCCONTROLSPECCAPABILITYData "等）。
'7. 它还通过检查任何两行是否相同来处理重复，如果是的话，其中一行将被删除。
'
'请注意，由于缺乏关于程序的其他部分和所涉及的确切业务逻辑的背景，这个简短的概述可能没有涵盖所有的细节。
'
'我建议你参考原始代码，或者在需要时询问作者以获得更全面的理解。
'
'```vba
'Public Sub CreateData()
'    ...
'End Sub
'```
'
'> 注意：这个函数看起来相当复杂，因为没有太多的注释来解释每个部分，也没有明确区分程序的不同逻辑部分--如果不花大量时间仔细检查这里的每一行以及这块以外的相关脚本（`CreateDATACOLLECTSPECData', `CreateSPCCONTROLSPECCAPILITYData'等），其他人很难快速理解每个部分到底做什么或者它们如何一起互动。

