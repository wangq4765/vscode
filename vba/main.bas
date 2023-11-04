Sub CreateData()
    Dim i As Integer
    Dim wsheet As Worksheet
    Dim Dsheet As Worksheet
    
    '清理区域中的公式和值
    Worksheets("RECIPE").Range("B3:L500").ClearContents
    Worksheets("TPFOPOLICY").Range("B3:H500").ClearContents
    Worksheets("TPFOMPOLICY").Range("B3:J500").ClearContents
    Worksheets("POSMACHINE").Range("B3:G500").ClearContents
    Worksheets("POSMACHINERECIPE").Range("B3:G500").ClearContents
    Worksheets("TPPOLICY").Range("B3:G10").ClearContents
    Worksheets("POSPRODUCTSAMPLING").Range("B3:J500").ClearContents
    Worksheets("POSPRODUCTSAMPLINGEQP").Range("B3:K2000").ClearContents
    Worksheets("BSPRODUCTMASKINFO").Range("B3:I100").ClearContents
    
    '九张表行数
    Dim RecipeRowCount                'rcipe row count
    Dim TPFORowCount                  'tpfopolicy row count
    Dim TPFOMRowCount                 'tpfompolicy row count
    Dim POSMRowCount                  'posmachine row count
    Dim POSMRRowCount                 'posmachinerecipe row count
    Dim TPRowCount                    'tppolicy row count
    Dim POSPSRowCount                 'posproductsampling row count
    Dim POSPSEBSRowCount              'posproductsamplingeqpbyslot row count
    Dim ProductMaskRowCount           'bsproductmaskinfo row count
    
    Dim LOTSPCount As Integer        'lot spc count
    Dim PRODUCTSPCount As Integer    'product spc count
    
    
    Dim SortShopRow
    Dim CellShopRow
    Dim SortFlowRow
    Dim CellFlowRow
    Dim SortProdutSpecRow
    Dim CellProdutSpec1Row As Integer
    Dim CellProdutSpec2Row
    
    Dim SortShopRowCF
    Dim CellShopRowCF
    Dim SortFlowRowCF
    Dim CellFlowRowCF
    Dim SortProdutSpecRowCF
    Dim CellProdutSpec1RowCF As Integer
    
    Dim CellFlowRowSNS
    
    '给八张表行数赋值
    RecipeRowCount = 2               'recipe row count
    TPFORowCount = 2                 'tpfopolicy row count
    TPFOMRowCount = 2                'tpfompolicy row count
    POSMRowCount = 2                 'posmachine row count
    POSMRRowCount = 2                'posmachine row count
    TPRowCount = 2                   'tppolicy row count
    POSPSRowCount = 2                'posproductsampling row count
    POSPSEBSRowCount = 2             'posproductsamplingeqpbyslot row count
    
    '异常操作数和空白操作数
    MainAbnormalOperCount = 0        'Main Abnormal Oper Count：Main异常操作数
    MainBlankOperCount = 0           'Main Blank Oper Count：Main空白作业数
    MainNotExistOperCount = 0        'Main Not Exist Oper Count：Main不存在操作数
    ReworkAbnormalOperCount = 0      'Rework Abnormal Oper Count：Rework异常操作数
    ReworkBlankOperCount = 0         'Rework Blank Oper Count：Rework空白操作数
    ReworkNotExistOperCount = 0      'Rework Not Exist Oper Count：Rework不存在操作数
    ProductMaskRowCount = 0          'Product Mask Row Count：产品Mask行数
    

    '去除可能存在的空格(将单元格所有的空格都清除)
    Sheets("MainFlow").Activate
    '清除MainFlow(sheet表)中G4~Q4字段中数据的所有空格
    'Sheets("MainFlow").Range("G4").Offset(i - 1, 0)
    For i = 1 To 200
        Sheets("MainFlow").Range("G4").Offset(i - 1, 0) = Replace(Sheets("MainFlow").Range("G4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow").Range("J4").Offset(i - 1, 0) = Replace(Sheets("MainFlow").Range("J4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow").Range("K4").Offset(i - 1, 0) = Replace(Sheets("MainFlow").Range("K4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow").Range("L4").Offset(i - 1, 0) = Replace(Sheets("MainFlow").Range("L4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow").Range("M4").Offset(i - 1, 0) = Replace(Sheets("MainFlow").Range("M4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow").Range("N4").Offset(i - 1, 0) = Replace(Sheets("MainFlow").Range("N4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow").Range("O4").Offset(i - 1, 0) = Replace(Sheets("MainFlow").Range("O4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow").Range("Q4").Offset(i - 1, 0) = Left(Sheets("MainFlow").Range("Q4").Offset(i - 1, 0), 1)
        'If Sheets("MainFlow").Range("Q4").Offset(i - 1, 0) <> "" Then
           'Sheets("MainFlow").Range("Q4").Offset(i - 1, 0) = Right(Sheets("MainFlow").Range("Q4").Offset(i - 1, 0), Len(Sheets("MainFlow").Range("Q4").Offset(i - 1, 0)) - 1)
        'End If
    Next
    
    '作用和上面相同(清除空格)
    Sheets("MainFlow_Rework").Activate
    'Sheets("MainFlow_Rework").Range("A4").Activate
    For i = 1 To 200
        Sheets("MainFlow_Rework").Range("G4").Offset(i - 1, 0) = Replace(Sheets("MainFlow_Rework").Range("G4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow_Rework").Range("J4").Offset(i - 1, 0) = Replace(Sheets("MainFlow_Rework").Range("J4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow_Rework").Range("K4").Offset(i - 1, 0) = Replace(Sheets("MainFlow_Rework").Range("K4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow_Rework").Range("L4").Offset(i - 1, 0) = Replace(Sheets("MainFlow_Rework").Range("L4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow_Rework").Range("M4").Offset(i - 1, 0) = Replace(Sheets("MainFlow_Rework").Range("M4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow_Rework").Range("N4").Offset(i - 1, 0) = Replace(Sheets("MainFlow_Rework").Range("N4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow_Rework").Range("O4").Offset(i - 1, 0) = Replace(Sheets("MainFlow_Rework").Range("O4").Offset(i - 1, 0), " ", "")
        Sheets("MainFlow_Rework").Range("Q4").Offset(i - 1, 0) = Left(Sheets("MainFlow_Rework").Range("Q4").Offset(i - 1, 0), 1)
        'If Sheets("MainFlow_Rework").Range("Q4").Offset(i - 1, 0) <> "" Then
           'Sheets("MainFlow_Rework").Range("Q4").Offset(i - 1, 0) = Right(Sheets("MainFlow_Rework").Range("Q4").Offset(i - 1, 0), Len(Sheets("MainFlow_Rework").Range("Q4").Offset(i - 1, 0)) - 1)
        'End If
    Next
    
    '------------Check Operation MandatoryFlag, Add By Sun 2021.08.03-------------
    For Count = 4 To 200
        If Worksheets("MainFlow").Cells(Count, 7) <> "" Then
        '获取字段Step Id下面的数据
        SNSStepID = Worksheets("MainFlow").Cells(Count, 7)
        
        '将字段Mandatory下面的数据全部大写(UCase)
        SNSStepType = UCase(Worksheets("MainFlow").Cells(Count, 8))
        '判断是不是主站点
        If (SNSStepType <> "MAIN") Then
            MandatoryFlagFile = "N"
        Else
            MandatoryFlagFile = "Y"
        End If
        
        Dim r As Collection
        MandatoryFlagMES = ""
        Set r = GetMandatoryFlag(SNSStepID)
        If r.Count > 0 Then
          MandatoryFlagMES = r(1)
          '将不相等的StepID标记颜色
          If (MandatoryFlagFile <> MandatoryFlagMES) Then
            'Not Equal
            MainAbnormalOperCount = MainAbnormalOperCount + 1
            '7是桃红
            Worksheets("MainFlow").Cells(Count, 7).Interior.ColorIndex = 7
            Worksheets("MainFlow").Cells(Count, 8).Interior.ColorIndex = 7
          Else
            '2是白色
            Worksheets("MainFlow").Cells(Count, 7).Interior.ColorIndex = 2
            Worksheets("MainFlow").Cells(Count, 8).Interior.ColorIndex = 2
          End If
        Else
            MainNotExistOperCount = MainNotExistOperCount + 1
            '46是橙色
            Worksheets("MainFlow").Cells(Count, 7).Interior.ColorIndex = 46
            Worksheets("MainFlow").Cells(Count, 8).Interior.ColorIndex = 46
        End If
        '-----------------------------------------------------------------------------
    Else
        If Worksheets("MainFlow").Cells(Count, 8) <> "" Then
            MainBlankOperCount = MainBlankOperCount + 1
            '38是粉红色
            Worksheets("MainFlow").Cells(Count, 7).Interior.ColorIndex = 38
            Worksheets("MainFlow").Cells(Count, 8).Interior.ColorIndex = 38
        Else
            ContineFlag = ""
            For j = 1 To 5
                If Worksheets("MainFlow").Cells(Count + j, 7) <> "" Then
                    ContinueFlag = "Y"
                    Exit For
                End If
            Next
            
            If ContinueFlag = "" Then
                Exit For
            End If
        End If
    End If
    Next
    
    For Count = 4 To 200
        If Worksheets("MainFlow_Rework").Cells(Count, 7) <> "" Then
        ReworkStepID = Worksheets("MainFlow_Rework").Cells(Count, 7)
        
        '------------Check Operation MandatoryFlag, Add By Sun 2021.08.03-------------
        SNSStepType = UCase(Worksheets("MainFlow_Rework").Cells(Count, 8))
        If (SNSStepType <> "MAIN") Then
            MandatoryFlagFile = "N"
        Else
            MandatoryFlagFile = "Y"
        End If
        
        'Dim r As Collection
        MandatoryFlagMES = ""
        Set r = GetMandatoryFlag(ReworkStepID)
        If r.Count > 0 Then
          MandatoryFlagMES = r(1)
          If (MandatoryFlagFile <> MandatoryFlagMES) Then
            'Not Equal
            ReworkAbnormalOperCount = ReworkAbnormalOperCount + 1
            Worksheets("MainFlow_Rework").Cells(Count, 7).Interior.ColorIndex = 7
            Worksheets("MainFlow_Rework").Cells(Count, 8).Interior.ColorIndex = 7
          Else
            Worksheets("MainFlow_Rework").Cells(Count, 7).Interior.ColorIndex = 2
            Worksheets("MainFlow_Rework").Cells(Count, 8).Interior.ColorIndex = 2
          End If
        Else
            ReworkNotExistOperCount = ReworkNotExistOperCount + 1
            Worksheets("MainFlow_Rework").Cells(Count, 7).Interior.ColorIndex = 46
            Worksheets("MainFlow_Rework").Cells(Count, 8).Interior.ColorIndex = 46
        End If
        '-----------------------------------------------------------------------------
    Else
        If Worksheets("MainFlow_Rework").Cells(Count, 5) <> "" Then
            ReworkBlankOperCount = ReworkBlankOperCount + 1
            Worksheets("MainFlow_Rework").Cells(Count, 7).Interior.ColorIndex = 38
            Worksheets("MainFlow_Rework").Cells(Count, 8).Interior.ColorIndex = 38
        Else
            ContineFlag = ""
            For j = 1 To 5
                If Worksheets("MainFlow_Rework").Cells(Count + j, 7) <> "" Then
                    ContinueFlag = "Y"
                    Exit For
                End If
            Next
            
            If ContinueFlag = "" Then
                Exit For
            End If
        End If
    End If
    Next

    
    'Check Abnormal Oper
      If MainAbnormalOperCount > 0 Or MainBlankOperCount > 0 Or MainNotExistOperCount > 0 Or ReworkAbnormalOperCount > 0 Or ReworkBlankOperCount > 0 Or ReworkNotExistOperCount > 0 Then
        messagebox = MsgBox("站点信息存在异常：" & Chr(13) & _
        "Main页站点属性不匹配(粉色标记）:" & MainAbnormalOperCount & "个" & Chr(13) & _
        "Main页站点为空(淡粉色标记）：" & MainBlankOperCount & "个" & Chr(13) & _
        "Main页站点不存在(橙色标记）：" & MainNotExistOperCount & "个" & Chr(13) & _
        "Rework页站点属性不匹配(粉色标记）：" & ReworkAbnormalOperCount & "个" & Chr(13) & _
        "Rework页站点为空(淡粉色标记）：" & ReworkBlankOperCount & "个" & Chr(13) & _
        "Rework页站点不存在(橙色标记）：" & ReworkNotExistOperCount & "个" & Chr(13), vbYesNo, "警告")
        Exit Sub
      End If
    
    SNSStepType = ""
    ReworkStepID = ""
    
    For Count = 4 To 200
        '-------------------生成TPFO表 ----------------
        '------------------SNS ---------------------
      If Worksheets("MainFlow").Cells(Count, 7) <> "" Then
        SNSStepID = Worksheets("MainFlow").Cells(Count, 7)
        
        If Worksheets("MainFlow").Cells(Count, 1) <> "" Then
            SNSFactory = Worksheets("MainFlow").Cells(Count, 1)
         Else
            For Value = 1 To 50
                If Worksheets("MainFlow").Cells(Count - Value, 1) <> "" Then
                SNSFactory = Worksheets("MainFlow").Cells(Count - Value, 1)
            Exit For
                End If
             Next
        End If
        If Worksheets("MainFlow").Cells(Count, 2) <> "" Then
                SNSProductSpec = Worksheets("MainFlow").Cells(Count, 2)
            Else
                For Value = 1 To 50
                    If Worksheets("MainFlow").Cells(Count - Value, 2) <> "" Then
                    SNSProductSpec = Worksheets("MainFlow").Cells(Count - Value, 2)
                Exit For
                    End If
                Next
        End If
        If Worksheets("MainFlow").Cells(Count, 3) <> "" Then
            SNSProcessFlow = Worksheets("MainFlow").Cells(Count, 3)
        Else
            For Value = 1 To 50
                If Worksheets("MainFlow").Cells(Count - Value, 3) <> "" Then
                SNSProcessFlow = Worksheets("MainFlow").Cells(Count - Value, 3)
            Exit For
                End If
            Next
          End If
        TPFORowCount = TPFORowCount + 1
        Call CreateTPFOPOLICYData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, TPFORowCount)
      End If
          
        
         '------------------Rework---------------------
      
      If Worksheets("MainFlow_Rework").Cells(Count, 7) <> "" Then
        ReworkStepID = Worksheets("MainFlow_Rework").Cells(Count, 7)
        
        If Worksheets("MainFlow_Rework").Cells(Count, 1) <> "" Then
            ReworkFactory = Worksheets("MainFlow_Rework").Cells(Count, 1)
        Else
            For Value = 1 To 50
                If Worksheets("MainFlow_Rework").Cells(Count - Value, 1) <> "" Then
                ReworkFactory = Worksheets("MainFlow_Rework").Cells(Count - Value, 1)
            Exit For
                End If
             Next
        End If
        If Worksheets("MainFlow_Rework").Cells(Count, 2) <> "" Then
                ReworkProductSpec = Worksheets("MainFlow_Rework").Cells(Count, 2)
            Else
                For Value = 1 To 50
                    If Worksheets("MainFlow_Rework").Cells(Count - Value, 2) <> "" Then
                    ReworkProductSpec = Worksheets("MainFlow_Rework").Cells(Count - Value, 2)
                Exit For
                    End If
                Next
             End If
             
             If Worksheets("MainFlow_Rework").Cells(Count, 3) <> "" Then
                    ReworkProcessFlow = Worksheets("MainFlow_Rework").Cells(Count, 3)
                Else
                    For Value = 1 To 50
                        If Worksheets("MainFlow_Rework").Cells(Count - Value, 3) <> "" Then
                        ReworkProcessFlow = Worksheets("MainFlow_Rework").Cells(Count - Value, 3)
                    Exit For
                        End If
                    Next
                End If
        TPFORowCount = TPFORowCount + 1
        Call CreateTPFOPOLICYData(ReworkFactory, ReworkProductSpec, ReworkProcessFlow, ReworkStepID, TPFORowCount)
      End If
            
     For LoopCount = 10 To 14
        '------------------ Recipe,TPFOM,POSM,POSMRecipe ------------------------------------
        '*****************SNS***********************
     If Worksheets("MainFlow").Cells(Count, LoopCount) <> "" Then
        EQPID = Worksheets("MainFlow").Cells(Count, LoopCount)
            If Worksheets("MainFlow").Cells(Count, 15) <> "" Then
                RECIPE = Worksheets("MainFlow").Cells(Count, 15)
             Else
                 For Value = 1 To 6
                     If Worksheets("MainFlow").Cells(Count - Value, 15) <> "" Then
                     RECIPE = Worksheets("MainFlow").Cells(Count - Value, 15)
                 Exit For
                    End If
                 Next
            End If
'            RECIPE = Worksheets("MainFlow").Cells(Count, 15)
            'RecipeRowCount = 2
            RecipeRowCount = RecipeRowCount + 1
            Call CreateRecipeData(EQPID, RECIPE, RecipeRowCount)
          '-------------------生成Recipe表 ----------------
          
            If Worksheets("MainFlow").Cells(Count, 7) <> "" Then
                 SNSStepID = Worksheets("MainFlow").Cells(Count, 7)
             Else
                 For Value = 1 To 50
                     If Worksheets("MainFlow").Cells(Count - Value, 7) <> "" Then
                     SNSStepID = Worksheets("MainFlow").Cells(Count - Value, 7)
                 Exit For
                     End If
                 Next
                 If Worksheets("MainFlow").Cells(Count, 1) <> "" Then
                     SNSFactory = Worksheets("MainFlow").Cells(Count, 1)
                     If Worksheets("MainFlow").Cells(Count, 2) <> "" Then
                         SNSProductSpec = Worksheets("MainFlow").Cells(Count, 2)
                         If Worksheets("MainFlow").Cells(Count, 3) <> "" Then
                             SNSProcessFlow = Worksheets("MainFlow").Cells(Count, 3)
                         Else
                             For Value = 1 To 50
                                 If Worksheets("MainFlow").Cells(Count - Value, 3) <> "" Then
                                 SNSProcessFlow = Worksheets("MainFlow").Cells(Count - Value, 3)
                             Exit For
                                 End If
                             Next
                         End If
                     Else
                         For Value = 1 To 50
                             If Worksheets("MainFlow").Cells(Count - Value, 2) <> "" Then
                             SNSProductSpec = Worksheets("MainFlow").Cells(Count - Value, 2)
                         Exit For
                             End If
                         Next
                      End If
                 Else
                     For Value = 1 To 50
                         If Worksheets("MainFlow").Cells(Count - Value, 1) <> "" Then
                         SNSFactory = Worksheets("MainFlow").Cells(Count - Value, 1)
                     Exit For
                         End If
                      Next
                 End If
                 If Worksheets("MainFlow").Cells(Count, 15) <> "" Then
                         RECIPE = Worksheets("MainFlow").Cells(Count, 15)
                      Else
                          For Value = 1 To 6
                              If Worksheets("MainFlow").Cells(Count - Value, 15) <> "" Then
                              RECIPE = Worksheets("MainFlow").Cells(Count - Value, 15)
                          Exit For
                             End If
                          Next
                  End If

              End If
            TPFOMRowCount = TPFOMRowCount + 1
            Call CreateTPFOMPOLICYData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, TPFOMRowCount)
            Call CreatePOSMACHINEData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, TPFOMRowCount)
            Call CreatePOSMACHINERECIPEData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, RECIPE, TPFOMRowCount)
         End If
          '*****************SNS***********************
         
     '*****************Rework***********************
        If Worksheets("MainFlow_Rework").Cells(Count, LoopCount) <> "" Then
             EQPID = Worksheets("MainFlow_Rework").Cells(Count, LoopCount)
            If Worksheets("MainFlow_Rework").Cells(Count, 15) <> "" Then
                RECIPE = Worksheets("MainFlow_Rework").Cells(Count, 15)
             Else
                 For Value = 1 To 6
                     If Worksheets("MainFlow_Rework").Cells(Count - Value, 15) <> "" Then
                     RECIPE = Worksheets("MainFlow_Rework").Cells(Count - Value, 15)
                 Exit For
                    End If
                 Next
            End If
             'RECIPE = Worksheets("MainFlow_Rework").Cells(Count, 15)
            RecipeRowCount = RecipeRowCount + 1
            Call CreateRecipeData(EQPID, RECIPE, RecipeRowCount)
          '-------------------生成Recipe表 ----------------
            If Worksheets("MainFlow_Rework").Cells(Count, 7) <> "" Then
                    ReworkStepID = Worksheets("MainFlow_Rework").Cells(Count, 7)
                  Else
                    For Value = 1 To 50
                        If Worksheets("MainFlow_Rework").Cells(Count - Value, 7) <> "" Then
                        ReworkStepID = Worksheets("MainFlow_Rework").Cells(Count - Value, 7)
                    Exit For
                        End If
                    Next
                    If Worksheets("MainFlow_Rework").Cells(Count, 1) <> "" Then
                        ReworkFactory = Worksheets("MainFlow_Rework").Cells(Count, 1)
                        If Worksheets("MainFlow_Rework").Cells(Count, 2) <> "" Then
                            ReworkProductSpec = Worksheets("MainFlow_Rework").Cells(Count, 2)
                            If Worksheets("MainFlow_Rework").Cells(Count, 3) <> "" Then
                                ReworkProcessFlow = Worksheets("MainFlow_Rework").Cells(Count, 3)
                            Else
                                For Value = 1 To 50
                                    If Worksheets("MainFlow_Rework").Cells(Count - Value, 3) <> "" Then
                                    ReworkProcessFlow = Worksheets("MainFlow_Rework").Cells(Count - Value, 3)
                                Exit For
                                    End If
                                Next
                            End If
                        Else
                            For Value = 1 To 50
                                If Worksheets("MainFlow_Rework").Cells(Count - Value, 2) <> "" Then
                                ReworkProductSpec = Worksheets("MainFlow_Rework").Cells(Count - Value, 2)
                            Exit For
                                End If
                            Next
                         End If
                    Else
                        For Value = 1 To 50
                            If Worksheets("MainFlow_Rework").Cells(Count - Value, 1) <> "" Then
                            ReworkFactory = Worksheets("MainFlow_Rework").Cells(Count - Value, 1)
                        Exit For
                            End If
                         Next
                    End If
                    If Worksheets("MainFlow_Rework").Cells(Count, 15) <> "" Then
                            RECIPE = Worksheets("MainFlow_Rework").Cells(Count, 15)
                         Else
                             For Value = 1 To 6
                                 If Worksheets("MainFlow_Rework").Cells(Count - Value, 15) <> "" Then
                                 RECIPE = Worksheets("MainFlow_Rework").Cells(Count - Value, 15)
                             Exit For
                                End If
                             Next
                     End If
                    
                 End If
                  TPFOMRowCount = TPFOMRowCount + 1
                     Call CreateTPFOMPOLICYData(ReworkFactory, ReworkProductSpec, ReworkProcessFlow, ReworkStepID, EQPID, TPFOMRowCount)
                     Call CreatePOSMACHINEData(ReworkFactory, ReworkProductSpec, ReworkProcessFlow, ReworkStepID, EQPID, TPFOMRowCount)
                     Call CreatePOSMACHINERECIPEData(ReworkFactory, ReworkProductSpec, ReworkProcessFlow, ReworkStepID, EQPID, RECIPE, TPFOMRowCount)
         End If
         '*******************Rework***********************
    Next
 Next
 
 
'----------------------生成TPPOLICY表----------------------------'

 SNSFactory = Worksheets("MainFlow").Cells(4, 1)
 SNSProductSpec = Worksheets("MainFlow").Cells(4, 2)
 TPRowCount = TPRowCount + 1
 Call CreateTPPOLICYData(SNSFactory, SNSProductSpec, TPRowCount)
 
 '上面是S段的，下面是Q段的
 
 SNSFactory = Worksheets("MainFlow").Cells(4, 1)
 SNSProductSpec = Replace(Worksheets("MainFlow").Cells(4, 2), "S", "Q")
 TPRowCount = TPRowCount + 1
 Call CreateTPPOLICYData(SNSFactory, SNSProductSpec, TPRowCount)
 
'----------------------生成TPPOLICY表----------------------------'



'------------------------------------------------------------------------------------------------------------------------------------'
                                                   '生成POSPRODUCTSAMPLING表'
                                              '生成POSPRODUCTSAMPLINGEQPBYSLOT表'
'------------------------------------------------------------------------------------------------------------------------------------'

For Count = 1 To 100
      
     '-----------------------------------------------------------------MainFlow-----------------------------------------------------------------------'
     '-------SNSStepID---------
  '---5---'
  'StepID第3位为M的是抽检站点
  If Worksheets("MainFlow").Cells(Count, 7) <> "" And Mid(Worksheets("MainFlow").Cells(Count, 7), 3, 1) <> "M" And UCase(Worksheets("MainFlow").Cells(Count, 8)) = "MAIN" Then
  'If Worksheets("MainFlow").Cells(Count, 7) <> "" And Worksheets("MainFlow").Cells(Count, 8) = "Main" Then
     SNSStepID = Worksheets("MainFlow").Cells(Count, 7)
     
     '--------SNSFactory----------
     If Worksheets("MainFlow").Cells(Count, 1) <> "" Then
        SNSFactory = Worksheets("MainFlow").Cells(Count, 1)
     Else
        For Value = 1 To 100
           If Worksheets("MainFlow").Cells(Count - Value, 1) <> "" Then
              SNSFactory = Worksheets("MainFlow").Cells(Count - Value, 1)
        Exit For
           End If
        Next
     End If
     
     '-------SNSProductSpec--------
     If Worksheets("MainFlow").Cells(Count, 2) <> "" Then
        SNSProductSpec = Worksheets("MainFlow").Cells(Count, 2)
     Else
        For Value = 1 To 100
            If Worksheets("MainFlow").Cells(Count - Value, 2) <> "" Then
               SNSProductSpec = Worksheets("MainFlow").Cells(Count - Value, 2)
        Exit For
            End If
        Next
     End If
     
     '--------SNSProcessFlow---------
     If Worksheets("MainFlow").Cells(Count, 3) <> "" Then
        SNSProcessFlow = Worksheets("MainFlow").Cells(Count, 3)
     Else
        '如果当前单元格没有数据，就从其上方单元格找数据
        For Value = 1 To 100
            If Worksheets("MainFlow").Cells(Count - Value, 3) <> "" Then
            SNSProcessFlow = Worksheets("MainFlow").Cells(Count - Value, 3)
        Exit For
            End If
        Next
     End If

     '----------EQPID-----------
     '---4---'
     For LoopCount = 10 To 14

        '---3---'
        If Worksheets("MainFlow").Cells(Count, LoopCount) <> "" Then
           EQPID = Worksheets("MainFlow").Cells(Count, LoopCount)
           
           '---1---'
           For OffCount = 1 To 10
           
              If Worksheets("MainFlow").Cells(Count + OffCount, 7) <> "" And UCase(Worksheets("MainFlow").Cells(Count + OffCount, 8)) = "MAIN" Then
           Exit For
              End If
              '------------Inspection Step------------
              
              '---2---'
              If (Worksheets("MainFlow").Cells(Count + OffCount, 7) <> "") 
              '第17行是Q，对应的字段是sheet
              And Worksheets("MainFlow").Cells(Count + OffCount, 17) <> "A" 
              And ((Mid(Worksheets("MainFlow").Cells(Count + OffCount, 7), 3, 1) = "M") 
              Or (Mid(Worksheets("MainFlow").Cells(Count + OffCount, 7), 6, 1) = "M")) 
              'StepID前两位需要相同
              And (Mid(Worksheets("MainFlow").Cells(Count + OffCount, 7), 1, 2) = Mid(Worksheets("MainFlow").Cells(Count, 7), 1, 2)) Then
              'If (Worksheets("MainFlow").Cells(Count + OffCount, 7) <> "") And Worksheets("MainFlow_Rework").Cells(Count + OffCount, 17) <> "A" Then
                 '--------TOPROCESSOPERATIONNAME---------
                 SNSTOStepID = Worksheets("MainFlow").Cells(Count + OffCount, 7)
                 '----------LOTSAMPLINGCOUNT-----------
                 '第16行是P，对应的字段是Lot Frequency(By EQP)
                 '`Val`函数用于将一个字符串转换为数字。它会从字符串的左侧开始解析，直到遇到非数字字符为止，并将其之前的数字部分转换为相应的数值类型
                 LOTSPCount = 60 * Val(Right(Worksheets("MainFlow").Cells(Count + OffCount, 16), 1))
                 
                 '----------PRIORITY----------
                 Priority = Mid(Worksheets("MainFlow").Cells(Count + OffCount, 7), 4, 1)
                 '---------ROW COUNT---------
                 POSPSRowCount = POSPSRowCount + 1
                 
                 '-----------PRODUCTSAMPLINGCOUNT------------
                 '----------PRODUCTSAMPLINGPOSITION-----------
                 '第17行是Q，对应的字段是sheet
                 PRODUCTSPCount = Val(Worksheets("MainFlow").Cells(Count + OffCount, 17))
                 '第18行是R，对应的字段是slot
                 PRODUCTSPPosition = Mid(Worksheets("MainFlow").Cells(Count + OffCount, 18), 2)
                 For ProductLoopCount = 1 To 3
                    If Worksheets("MainFlow").Cells(Count + OffCount + ProductLoopCount, 7) <> "" Then
                 Exit For
                    End If
                    If Worksheets("MainFlow").Cells(Count + OffCount + ProductLoopCount, 17) <> "" Then
                       PRODUCTSPCount = Application.WorksheetFunction.Max(Val(Worksheets("MainFlow").Cells(Count + OffCount + ProductLoopCount, 17)), PRODUCTSPCount)
                    Else
                 Exit For
                    End If
                    If Len(PRODUCTSPPosition) <= Len(Worksheets("MainFlow").Cells(Count + OffCount + ProductLoopCount, 18)) - 1 And Worksheets("MainFlow").Cells(Count + OffCount + ProductLoopCount, 18) <> "" Then
                       PRODUCTSPPosition = Mid(Worksheets("MainFlow").Cells(Count + OffCount + ProductLoopCount, 18), 2)
                    End If
                 Next
                 Call CreatePOSPRODUCTSAMPLINGData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, SNSTOStepID, LOTSPCount, PRODUCTSPCount, PRODUCTSPPosition, Priority, POSPSRowCount)
                 
                 '----以下用于POSPRODUCTSAMPLINGEQPBYSLOT表----'
                 '---11---'
                 For LoopCountS = 10 To 14
                    If Worksheets("MainFlow").Cells(Count + OffCount, LoopCountS) = "" Then
                 Exit For
                    End If
                    '------------如果抽检设备只有一行------------'
                    SPEQPID = Worksheets("MainFlow").Cells(Count + OffCount, LoopCountS)
                    
                    '-----------------只有一条Unit记录------------------'
                    If Len(Worksheets("MainFlow").Cells(Count + OffCount, 9)) = 4 Then
                       For LoopCountPosition = 1 To Worksheets("MainFlow").Cells(Count + OffCount, 17)
                          SPUNITID = SPEQPID & "-" & Worksheets("MainFlow").Cells(Count + OffCount, 9)
                          'Modified By Sun Shoubing,20180108
                          If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                            SPUNITID = "5SMTE01-MM01"
                          End If
                          If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                            SPUNITID = "5SMTE01-MM01"
                          End If
                          If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                            SPUNITID = "5SMTE03-MM04"
                          End If
                          If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                            SPUNITID = "5SMTE04-MM02"
                          End If
                          If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                            SPUNITID = "5SMTE05-MM03"
                          End If
                          '5SMTE03-RS01
                          If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                            SPUNITID = "5SMTE03-RS01"
                          End If
                          '5SMTE02-PI01
                          If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                            SPUNITID = "5SMTE02-PI01"
                          End If
                          If SPUNITID = "5SMTE03-PI01" Then
                            SPUNITID = "5SMTE03-PI02"
                          End If
                          '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                          If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                            SPUNITID = "5SMTE01-CD01"
                          End If
                          If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                            SPUNITID = "5SMTE01-CD01"
                          End If
                          If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                            SPUNITID = "5SMTE04-CD02"
                          End If
                          If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                            SPUNITID = "5SMTE05-CD03"
                          End If
                          '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                          If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                            SPUNITID = "5SMTE01-MP01"
                          End If
                          If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                            SPUNITID = "5SMTE02-MP02"
                          End If
                          If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                            SPUNITID = "5SMTE03-MP03"
                          End If
                          POSITION = LoopCountPosition
                          POSPSEBSRowCount = POSPSEBSRowCount + 1
                          Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                       Next
                    End If
                    If Len(Worksheets("MainFlow").Cells(Count + OffCount, 9)) = 7 Then
                       For LoopCountPosition = 1 To Worksheets("MainFlow").Cells(Count + OffCount, 17)
                          SUnitCount = Val(Mid(Worksheets("MainFlow").Cells(Count + OffCount, 9), 7, 1) - Mid(Worksheets("MainFlow").Cells(Count + OffCount, 9), 4, 1))
                          For LoopCountSUnit = 0 To SUnitCount
                             SPUNITID = SPEQPID & "-" & Mid(Worksheets("MainFlow").Cells(Count + OffCount, 9), 1, 3) & CStr(Val(Mid(Worksheets("MainFlow").Cells(Count + OffCount, 9), 4, 1)) + LoopCountSUnit)
                             'Modified By Sun Shoubing,20180108
                                If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                  SPUNITID = "5SMTE03-MM04"
                                End If
                                If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                  SPUNITID = "5SMTE04-MM02"
                                End If
                                If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                  SPUNITID = "5SMTE05-MM03"
                                End If
                                '5SMTE03-RS01
                                If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                  SPUNITID = "5SMTE03-RS01"
                                End If
                                '5SMTE02-PI01
                                If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                  SPUNITID = "5SMTE02-PI01"
                                End If
                                If SPUNITID = "5SMTE03-PI01" Then
                                  SPUNITID = "5SMTE03-PI02"
                                End If
                                '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                  SPUNITID = "5SMTE04-CD02"
                                End If
                                If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                  SPUNITID = "5SMTE05-CD03"
                                End If
                                '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                  SPUNITID = "5SMTE01-MP01"
                                End If
                                If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                  SPUNITID = "5SMTE02-MP02"
                                End If
                                If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                  SPUNITID = "5SMTE03-MP03"
                                End If
                             POSITION = LoopCountPosition
                             POSPSEBSRowCount = POSPSEBSRowCount + 1
                             Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                          Next
                       Next
                    End If
                    
                    '-----------------如果不止一条记录------------------'
                    For OffCountUnit = 1 To 2
                       If Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 7) <> "" Then
                    Exit For
                       End If
                       If Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9) <> "" And Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 7) = "" And Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, LoopCountS) = "" Then
                          If Len(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9)) = 4 Then
                             For LoopCountPosition = 1 To Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 17)
                                SPUNITID = SPEQPID & "-" & Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9)
                                'Modified By Sun Shoubing,20180108
                                If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                  SPUNITID = "5SMTE03-MM04"
                                End If
                                If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                  SPUNITID = "5SMTE04-MM02"
                                End If
                                If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                  SPUNITID = "5SMTE05-MM03"
                                End If
                                '5SMTE03-RS01
                                If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                  SPUNITID = "5SMTE03-RS01"
                                End If
                                '5SMTE02-PI01
                                If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                  SPUNITID = "5SMTE02-PI01"
                                End If
                                If SPUNITID = "5SMTE03-PI01" Then
                                  SPUNITID = "5SMTE03-PI02"
                                End If
                                '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                  SPUNITID = "5SMTE04-CD02"
                                End If
                                If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                  SPUNITID = "5SMTE05-CD03"
                                End If
                                '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                  SPUNITID = "5SMTE01-MP01"
                                End If
                                If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                  SPUNITID = "5SMTE02-MP02"
                                End If
                                If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                  SPUNITID = "5SMTE03-MP03"
                                End If
                                POSITION = LoopCountPosition
                                POSPSEBSRowCount = POSPSEBSRowCount + 1
                                Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                             Next
                          End If
                          If Len(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9)) = 7 Then
                             For LoopCountPosition = 1 To Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 17)
                                SUnitCount = Val(Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9), 7, 1) - Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9), 4, 1))
                                For LoopCountSUnit = 0 To SUnitCount
                                   SPUNITID = SPEQPID & "-" & Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9), 1, 3) & CStr(Val(Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9), 4, 1)) + LoopCountSUnit)
                                   'Modified By Sun Shoubing,20180108
                                    If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                      SPUNITID = "5SMTE01-MM01"
                                    End If
                                    If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                      SPUNITID = "5SMTE01-MM01"
                                    End If
                                    If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                      SPUNITID = "5SMTE03-MM04"
                                    End If
                                    If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                      SPUNITID = "5SMTE04-MM02"
                                    End If
                                    If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                      SPUNITID = "5SMTE05-MM03"
                                    End If
                                    '5SMTE03-RS01
                                    If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                      SPUNITID = "5SMTE03-RS01"
                                    End If
                                    '5SMTE02-PI01
                                    If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                      SPUNITID = "5SMTE02-PI01"
                                    End If
                                    If SPUNITID = "5SMTE03-PI01" Then
                                      SPUNITID = "5SMTE03-PI02"
                                    End If
                                    '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                    If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                      SPUNITID = "5SMTE01-CD01"
                                    End If
                                    If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                      SPUNITID = "5SMTE01-CD01"
                                    End If
                                    If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                      SPUNITID = "5SMTE04-CD02"
                                    End If
                                    If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                      SPUNITID = "5SMTE05-CD03"
                                    End If
                                    '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                    If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                      SPUNITID = "5SMTE01-MP01"
                                    End If
                                    If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                      SPUNITID = "5SMTE02-MP02"
                                    End If
                                    If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                      SPUNITID = "5SMTE03-MP03"
                                    End If
                                   POSITION = LoopCountPosition
                                   POSPSEBSRowCount = POSPSEBSRowCount + 1
                                   Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                                Next
                             Next
                          End If
                       Else
                    Exit For
                       End If
                    Next
                    
                    
                    '------------如果抽检设备不止一行------------'
                    For OffCountEQP = 1 To 2
                       If Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, 7) <> "" Then
                    Exit For
                       End If
                       If Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, 7) = "" And Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, LoopCountS) <> "" Then
                          '------------如果抽检设备只有一行------------'
                          SPEQPID = Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, LoopCountS)
                          
                          
                          '-----------------只有一条Unit记录------------------'
                    If Len(Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, 9)) = 4 Then
                       For LoopCountPosition = 1 To Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, 17)
                          SPUNITID = SPEQPID & "-" & Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, 9)
                          'Modified By Sun Shoubing,20180108
                          If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                            SPUNITID = "5SMTE01-MM01"
                          End If
                          If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                            SPUNITID = "5SMTE01-MM01"
                          End If
                          If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                            SPUNITID = "5SMTE03-MM04"
                          End If
                          If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                            SPUNITID = "5SMTE04-MM02"
                          End If
                          If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                            SPUNITID = "5SMTE05-MM03"
                          End If
                          '5SMTE03-RS01
                          If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                            SPUNITID = "5SMTE03-RS01"
                          End If
                          '5SMTE02-PI01
                          If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                            SPUNITID = "5SMTE02-PI01"
                          End If
                          If SPUNITID = "5SMTE03-PI01" Then
                            SPUNITID = "5SMTE03-PI02"
                          End If
                          '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                          If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                            SPUNITID = "5SMTE01-CD01"
                          End If
                          If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                            SPUNITID = "5SMTE01-CD01"
                          End If
                          If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                            SPUNITID = "5SMTE04-CD02"
                          End If
                          If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                            SPUNITID = "5SMTE05-CD03"
                          End If
                          '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                          If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                            SPUNITID = "5SMTE01-MP01"
                          End If
                          If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                            SPUNITID = "5SMTE02-MP02"
                          End If
                          If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                            SPUNITID = "5SMTE03-MP03"
                          End If
                          POSITION = LoopCountPosition
                          POSPSEBSRowCount = POSPSEBSRowCount + 1
                          Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                       Next
                    End If
                    If Len(Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, 9)) = 7 Then
                       For LoopCountPosition = 1 To Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, 17)
                          SUnitCount = Val(Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, 9), 7, 1) - Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, 9), 4, 1))
                          For LoopCountSUnit = 0 To SUnitCount
                             SPUNITID = SPEQPID & "-" & Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, 9), 1, 3) & CStr(Val(Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP, 9), 4, 1)) + LoopCountSUnit)
                             'Modified By Sun Shoubing,20180108
                                If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                  SPUNITID = "5SMTE03-MM04"
                                End If
                                If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                  SPUNITID = "5SMTE04-MM02"
                                End If
                                If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                  SPUNITID = "5SMTE05-MM03"
                                End If
                                '5SMTE03-RS01
                                If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                  SPUNITID = "5SMTE03-RS01"
                                End If
                                '5SMTE02-PI01
                                If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                  SPUNITID = "5SMTE02-PI01"
                                End If
                                If SPUNITID = "5SMTE03-PI01" Then
                                  SPUNITID = "5SMTE03-PI02"
                                End If
                                '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                  SPUNITID = "5SMTE04-CD02"
                                End If
                                If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                  SPUNITID = "5SMTE05-CD03"
                                End If
                                '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                  SPUNITID = "5SMTE01-MP01"
                                End If
                                If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                  SPUNITID = "5SMTE02-MP02"
                                End If
                                If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                  SPUNITID = "5SMTE03-MP03"
                                End If
                             POSITION = LoopCountPosition
                             POSPSEBSRowCount = POSPSEBSRowCount + 1
                             Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                          Next
                       Next
                    End If
                    
                    '-----------------如果不止一条记录------------------'
                    For OffCountUnit = 1 To 2
                       If Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP + OffCountUnit, 7) <> "" Then
                    Exit For
                       End If
                       If Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP + OffCountUnit, 9) <> "" And Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP + OffCountUnit, 7) = "" And Worksheets("MainFlow").Cells(Count + OffCount + OffCountEQP + OffCountUnit, LoopCountS) = "" Then
                          If Len(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9)) = 4 Then
                             For LoopCountPosition = 1 To Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 17)
                                SPUNITID = SPEQPID & "-" & Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9)
                                'Modified By Sun Shoubing,20180108
                                If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                  SPUNITID = "5SMTE03-MM04"
                                End If
                                If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                  SPUNITID = "5SMTE04-MM02"
                                End If
                                If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                  SPUNITID = "5SMTE05-MM03"
                                End If
                                '5SMTE03-RS01
                                If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                  SPUNITID = "5SMTE03-RS01"
                                End If
                                '5SMTE02-PI01
                                If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                  SPUNITID = "5SMTE02-PI01"
                                End If
                                If SPUNITID = "5SMTE03-PI01" Then
                                  SPUNITID = "5SMTE03-PI02"
                                End If
                                '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                  SPUNITID = "5SMTE04-CD02"
                                End If
                                If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                  SPUNITID = "5SMTE05-CD03"
                                End If
                                '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                  SPUNITID = "5SMTE01-MP01"
                                End If
                                If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                  SPUNITID = "5SMTE02-MP02"
                                End If
                                If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                  SPUNITID = "5SMTE03-MP03"
                                End If
                                POSITION = LoopCountPosition
                                POSPSEBSRowCount = POSPSEBSRowCount + 1
                                Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                             Next
                          End If
                          If Len(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9)) = 7 Then
                             For LoopCountPosition = 1 To Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 17)
                                SUnitCount = Val(Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9), 7, 1) - Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9), 4, 1))
                                For LoopCountSUnit = 0 To SUnitCount
                                   SPUNITID = SPEQPID & "-" & Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9), 1, 3) & CStr(Val(Mid(Worksheets("MainFlow").Cells(Count + OffCount + OffCountUnit, 9), 4, 1)) + LoopCountSUnit)
                                   'Modified By Sun Shoubing,20180108
                                    If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                      SPUNITID = "5SMTE01-MM01"
                                    End If
                                    If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                      SPUNITID = "5SMTE01-MM01"
                                    End If
                                    If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                      SPUNITID = "5SMTE03-MM04"
                                    End If
                                    If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                      SPUNITID = "5SMTE04-MM02"
                                    End If
                                    If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                      SPUNITID = "5SMTE05-MM03"
                                    End If
                                    '5SMTE03-RS01
                                    If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                      SPUNITID = "5SMTE03-RS01"
                                    End If
                                    '5SMTE02-PI01
                                    If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                      SPUNITID = "5SMTE02-PI01"
                                    End If
                                    If SPUNITID = "5SMTE03-PI01" Then
                                      SPUNITID = "5SMTE03-PI02"
                                    End If
                                    '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                    If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                      SPUNITID = "5SMTE01-CD01"
                                    End If
                                    If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                      SPUNITID = "5SMTE01-CD01"
                                    End If
                                    If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                      SPUNITID = "5SMTE04-CD02"
                                    End If
                                    If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                      SPUNITID = "5SMTE05-CD03"
                                    End If
                                    '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                    If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                      SPUNITID = "5SMTE01-MP01"
                                    End If
                                    If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                      SPUNITID = "5SMTE02-MP02"
                                    End If
                                    If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                      SPUNITID = "5SMTE03-MP03"
                                    End If
                                   POSITION = LoopCountPosition
                                   POSPSEBSRowCount = POSPSEBSRowCount + 1
                                   Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                                Next
                             Next
                          End If
                       Else
                    Exit For
                       End If
                    Next
                          
                          
                       End If
                    Next
                    
                    
                    
                 '---11---'
                 Next
                 
              '---2---'
              End If
              
           '---1---'
           Next
           
       '---3---'
       End If
       
    '---4---'
    Next

  '---5---'
  End If
   '-----------------------------------------------------------------MainFlow-----------------------------------------------------------------------'
   
   '-----------------------------------------------------------------MainFlow_Rework-----------------------------------------------------------------------'
     '-------SNSStepID---------
  If Worksheets("MainFlow_Rework").Cells(Count, 7) <> "" And Mid(Worksheets("MainFlow_Rework").Cells(Count, 7), 3, 1) <> "M" And UCase(Worksheets("MainFlow_Rework").Cells(Count, 8)) = "MAIN" Then
     SNSStepID = Worksheets("MainFlow_Rework").Cells(Count, 7)
     
     '--------SNSFactory----------
     If Worksheets("MainFlow_Rework").Cells(Count, 1) <> "" Then
        SNSFactory = Worksheets("MainFlow_Rework").Cells(Count, 1)
     Else
        For Value = 1 To 100
           If Worksheets("MainFlow_Rework").Cells(Count - Value, 1) <> "" Then
              SNSFactory = Worksheets("MainFlow_Rework").Cells(Count - Value, 1)
        Exit For
           End If
        Next
     End If
     
     '-------SNSProductSpec--------
     If Worksheets("MainFlow_Rework").Cells(Count, 2) <> "" Then
        SNSProductSpec = Worksheets("MainFlow_Rework").Cells(Count, 2)
     Else
        For Value = 1 To 100
            If Worksheets("MainFlow_Rework").Cells(Count - Value, 2) <> "" Then
               SNSProductSpec = Worksheets("MainFlow_Rework").Cells(Count - Value, 2)
        Exit For
            End If
        Next
     End If
     
     '--------SNSProcessFlow---------
     If Worksheets("MainFlow_Rework").Cells(Count, 3) <> "" Then
        SNSProcessFlow = Worksheets("MainFlow_Rework").Cells(Count, 3)
     Else
        For Value = 1 To 100
            If Worksheets("MainFlow_Rework").Cells(Count - Value, 3) <> "" Then
            SNSProcessFlow = Worksheets("MainFlow_Rework").Cells(Count - Value, 3)
        Exit For
            End If
        Next
     End If

     '----------EQPID-----------
     For LoopCount = 10 To 14
     
        If Worksheets("MainFlow_Rework").Cells(Count, LoopCount) <> "" Then
           EQPID = Worksheets("MainFlow_Rework").Cells(Count, LoopCount)
           For OffCount = 1 To 10
              If Worksheets("MainFlow_Rework").Cells(Count + OffCount, 7) <> "" And UCase(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 8)) = "MAIN" Then
           Exit For
              End If
              '------------Inspection Step------------
              If (Worksheets("MainFlow_Rework").Cells(Count + OffCount, 7) <> "") And (Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 7), 3, 1) = "M") And Worksheets("MainFlow_Rework").Cells(Count + OffCount, 17) <> "A" And (Mid(Worksheets("MainFlow_Rework").Cells(Count, 7), 1, 2) = Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 7), 1, 2)) Then
                 '--------TOPROCESSOPERATIONNAME---------
                 SNSTOStepID = Worksheets("MainFlow_Rework").Cells(Count + OffCount, 7)
                 '----------LOTSAMPLINGCOUNT-----------
                 LOTSPCount = 60 * Val(Right(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 16), 1))
                 
                 '----------PRIORITY----------
                 Priority = Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 7), 4, 1)
                 '---------ROW COUNT---------
                 POSPSRowCount = POSPSRowCount + 1
                 
                 '-----------PRODUCTSAMPLINGCOUNT------------
                 '----------PRODUCTSAMPLINGPOSITION-----------
                 PRODUCTSPCount = Val(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 17))
                 PRODUCTSPPosition = Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 18), 2)
                 For ProductLoopCount = 1 To 3
                    If Worksheets("MainFlow_Rework").Cells(Count + OffCount + ProductLoopCount, 7) <> "" Then
                 Exit For
                    End If
                    If Worksheets("MainFlow_Rework").Cells(Count + OffCount + ProductLoopCount, 17) <> "" Then
                       PRODUCTSPCount = Application.WorksheetFunction.Max(Val(Worksheets("MainFlow_Rework").Cells(Count + OffCount + ProductLoopCount, 17)), PRODUCTSPCount)
                    Else
                 Exit For
                    End If
                    If Len(PRODUCTSPPosition) <= Len(Worksheets("MainFlow_Rework").Cells(Count + OffCount + ProductLoopCount, 18)) - 1 And Worksheets("MainFlow_Rework").Cells(Count + OffCount + ProductLoopCount, 18) <> "" Then
                       PRODUCTSPPosition = Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + ProductLoopCount, 18), 2)
                    End If
                 Next
                 
                 Call CreatePOSPRODUCTSAMPLINGData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, SNSTOStepID, LOTSPCount, PRODUCTSPCount, PRODUCTSPPosition, Priority, POSPSRowCount)
                 
                  '----以下用于POSPRODUCTSAMPLINGEQPBYSLOT表----'
                 '---11---'
                 For LoopCountS = 10 To 14
                    If Worksheets("MainFlow_Rework").Cells(Count + OffCount, LoopCountS) = "" Then
                 Exit For
                    End If
                    '------------如果抽检设备只有一行------------'
                    SPEQPID = Worksheets("MainFlow_Rework").Cells(Count + OffCount, LoopCountS)
                    
                    '-----------------只有一条Unit记录------------------'
                    If Len(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 9)) = 4 Then
                       For LoopCountPosition = 1 To Worksheets("MainFlow_Rework").Cells(Count + OffCount, 17)
                          SPUNITID = SPEQPID & "-" & Worksheets("MainFlow_Rework").Cells(Count + OffCount, 9)
                          'Modified By Sun Shoubing,20180108
                          If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                            SPUNITID = "5SMTE01-MM01"
                          End If
                          If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                            SPUNITID = "5SMTE01-MM01"
                          End If
                          If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                            SPUNITID = "5SMTE03-MM04"
                          End If
                          If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                            SPUNITID = "5SMTE04-MM02"
                          End If
                          If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                            SPUNITID = "5SMTE05-MM03"
                          End If
                          '5SMTE03-RS01
                          If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                            SPUNITID = "5SMTE03-RS01"
                          End If
                          '5SMTE02-PI01
                          If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                            SPUNITID = "5SMTE02-PI01"
                          End If
                          If SPUNITID = "5SMTE03-PI01" Then
                            SPUNITID = "5SMTE03-PI02"
                          End If
                          '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                          If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                            SPUNITID = "5SMTE01-CD01"
                          End If
                          If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                            SPUNITID = "5SMTE01-CD01"
                          End If
                          If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                            SPUNITID = "5SMTE04-CD02"
                          End If
                          If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                            SPUNITID = "5SMTE05-CD03"
                          End If
                          '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                          If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                            SPUNITID = "5SMTE01-MP01"
                          End If
                          If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                            SPUNITID = "5SMTE02-MP02"
                          End If
                          If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                            SPUNITID = "5SMTE03-MP03"
                          End If
                          POSITION = LoopCountPosition
                          POSPSEBSRowCount = POSPSEBSRowCount + 1
                          Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                       Next
                    End If
                    If Len(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 9)) = 7 Then
                       For LoopCountPosition = 1 To Worksheets("MainFlow_Rework").Cells(Count + OffCount, 17)
                          SUnitCount = Val(Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 9), 7, 1) - Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 9), 4, 1))
                          For LoopCountSUnit = 0 To SUnitCount
                             SPUNITID = SPEQPID & "-" & Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 9), 1, 3) & CStr(Val(Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount, 9), 4, 1)) + LoopCountSUnit)
                             'Modified By Sun Shoubing,20180108
                                If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                  SPUNITID = "5SMTE03-MM04"
                                End If
                                If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                  SPUNITID = "5SMTE04-MM02"
                                End If
                                If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                  SPUNITID = "5SMTE05-MM03"
                                End If
                                '5SMTE03-RS01
                                If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                  SPUNITID = "5SMTE03-RS01"
                                End If
                                '5SMTE02-PI01
                                If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                  SPUNITID = "5SMTE02-PI01"
                                End If
                                If SPUNITID = "5SMTE03-PI01" Then
                                  SPUNITID = "5SMTE03-PI02"
                                End If
                                '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                  SPUNITID = "5SMTE04-CD02"
                                End If
                                If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                  SPUNITID = "5SMTE05-CD03"
                                End If
                                '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                  SPUNITID = "5SMTE01-MP01"
                                End If
                                If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                  SPUNITID = "5SMTE02-MP02"
                                End If
                                If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                  SPUNITID = "5SMTE03-MP03"
                                End If
                             POSITION = LoopCountPosition
                             POSPSEBSRowCount = POSPSEBSRowCount + 1
                             Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                          Next
                       Next
                    End If
                    
                    '-----------------如果不止一条记录------------------'
                    For OffCountUnit = 1 To 2
                       If Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 7) <> "" Then
                    Exit For
                       End If
                       If Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9) <> "" And Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 7) = "" And Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, LoopCountS) = "" Then
                          If Len(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9)) = 4 Then
                             For LoopCountPosition = 1 To Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 17)
                                SPUNITID = SPEQPID & "-" & Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9)
                                'Modified By Sun Shoubing,20180108
                                If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                  SPUNITID = "5SMTE03-MM04"
                                End If
                                If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                  SPUNITID = "5SMTE04-MM02"
                                End If
                                If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                  SPUNITID = "5SMTE05-MM03"
                                End If
                                '5SMTE03-RS01
                                If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                  SPUNITID = "5SMTE03-RS01"
                                End If
                                '5SMTE02-PI01
                                If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                  SPUNITID = "5SMTE02-PI01"
                                End If
                                If SPUNITID = "5SMTE03-PI01" Then
                                  SPUNITID = "5SMTE03-PI02"
                                End If
                                '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                  SPUNITID = "5SMTE04-CD02"
                                End If
                                If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                  SPUNITID = "5SMTE05-CD03"
                                End If
                                '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                  SPUNITID = "5SMTE01-MP01"
                                End If
                                If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                  SPUNITID = "5SMTE02-MP02"
                                End If
                                If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                  SPUNITID = "5SMTE03-MP03"
                                End If
                                POSITION = LoopCountPosition
                                POSPSEBSRowCount = POSPSEBSRowCount + 1
                                Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                             Next
                          End If
                          If Len(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9)) = 7 Then
                             For LoopCountPosition = 1 To Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 17)
                                SUnitCount = Val(Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9), 7, 1) - Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9), 4, 1))
                                For LoopCountSUnit = 0 To SUnitCount
                                   SPUNITID = SPEQPID & "-" & Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9), 1, 3) & CStr(Val(Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9), 4, 1)) + LoopCountSUnit)
                                   'Modified By Sun Shoubing,20180108
                                    If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                      SPUNITID = "5SMTE01-MM01"
                                    End If
                                    If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                      SPUNITID = "5SMTE01-MM01"
                                    End If
                                    If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                      SPUNITID = "5SMTE03-MM04"
                                    End If
                                    If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                      SPUNITID = "5SMTE04-MM02"
                                    End If
                                    If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                      SPUNITID = "5SMTE05-MM03"
                                    End If
                                    '5SMTE03-RS01
                                    If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                      SPUNITID = "5SMTE03-RS01"
                                    End If
                                    '5SMTE02-PI01
                                    If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                      SPUNITID = "5SMTE02-PI01"
                                    End If
                                    If SPUNITID = "5SMTE03-PI01" Then
                                      SPUNITID = "5SMTE03-PI02"
                                    End If
                                    '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                    If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                      SPUNITID = "5SMTE01-CD01"
                                    End If
                                    If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                      SPUNITID = "5SMTE01-CD01"
                                    End If
                                    If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                      SPUNITID = "5SMTE04-CD02"
                                    End If
                                    If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                      SPUNITID = "5SMTE05-CD03"
                                    End If
                                    '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                    If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                      SPUNITID = "5SMTE01-MP01"
                                    End If
                                    If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                      SPUNITID = "5SMTE02-MP02"
                                    End If
                                    If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                      SPUNITID = "5SMTE03-MP03"
                                    End If
                                   POSITION = LoopCountPosition
                                   POSPSEBSRowCount = POSPSEBSRowCount + 1
                                   Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                                Next
                             Next
                          End If
                       Else
                    Exit For
                       End If
                    Next
                    
                    
                    '------------如果抽检设备不止一行------------'
                    For OffCountEQP = 1 To 2
                       If Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, 7) <> "" Then
                    Exit For
                       End If
                       If Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, 7) = "" And Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, LoopCountS) <> "" Then
                          '------------如果抽检设备只有一行------------'
                          SPEQPID = Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, LoopCountS)
                          
                          
                          '-----------------只有一条Unit记录------------------'
                    If Len(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, 9)) = 4 Then
                       For LoopCountPosition = 1 To Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, 17)
                          SPUNITID = SPEQPID & "-" & Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, 9)
                          'Modified By Sun Shoubing,20180108
                          If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                            SPUNITID = "5SMTE01-MM01"
                          End If
                          If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                            SPUNITID = "5SMTE01-MM01"
                          End If
                          If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                            SPUNITID = "5SMTE03-MM04"
                          End If
                          If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                            SPUNITID = "5SMTE04-MM02"
                          End If
                          If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                            SPUNITID = "5SMTE05-MM03"
                          End If
                          '5SMTE03-RS01
                          If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                            SPUNITID = "5SMTE03-RS01"
                          End If
                          '5SMTE02-PI01
                          If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                            SPUNITID = "5SMTE02-PI01"
                          End If
                          If SPUNITID = "5SMTE03-PI01" Then
                            SPUNITID = "5SMTE03-PI02"
                          End If
                          '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                          If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                            SPUNITID = "5SMTE01-CD01"
                          End If
                          If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                            SPUNITID = "5SMTE01-CD01"
                          End If
                          If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                            SPUNITID = "5SMTE04-CD02"
                          End If
                          If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                            SPUNITID = "5SMTE05-CD03"
                          End If
                          '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                          If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                            SPUNITID = "5SMTE01-MP01"
                          End If
                          If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                            SPUNITID = "5SMTE02-MP02"
                          End If
                          If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                            SPUNITID = "5SMTE03-MP03"
                          End If
                          POSITION = LoopCountPosition
                          POSPSEBSRowCount = POSPSEBSRowCount + 1
                          Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                       Next
                    End If
                    If Len(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, 9)) = 7 Then
                       For LoopCountPosition = 1 To Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, 17)
                          SUnitCount = Val(Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, 9), 7, 1) - Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, 9), 4, 1))
                          For LoopCountSUnit = 0 To SUnitCount
                             SPUNITID = SPEQPID & "-" & Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, 9), 1, 3) & CStr(Val(Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP, 9), 4, 1)) + LoopCountSUnit)
                             'Modified By Sun Shoubing,20180108
                                If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                  SPUNITID = "5SMTE03-MM04"
                                End If
                                If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                  SPUNITID = "5SMTE04-MM02"
                                End If
                                If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                  SPUNITID = "5SMTE05-MM03"
                                End If
                                '5SMTE03-RS01
                                If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                  SPUNITID = "5SMTE03-RS01"
                                End If
                                '5SMTE02-PI01
                                If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                  SPUNITID = "5SMTE02-PI01"
                                End If
                                If SPUNITID = "5SMTE03-PI01" Then
                                  SPUNITID = "5SMTE03-PI02"
                                End If
                                '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                  SPUNITID = "5SMTE04-CD02"
                                End If
                                If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                  SPUNITID = "5SMTE05-CD03"
                                End If
                                '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                  SPUNITID = "5SMTE01-MP01"
                                End If
                                If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                  SPUNITID = "5SMTE02-MP02"
                                End If
                                If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                  SPUNITID = "5SMTE03-MP03"
                                End If
                             POSITION = LoopCountPosition
                             POSPSEBSRowCount = POSPSEBSRowCount + 1
                             Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                          Next
                       Next
                    End If
                    
                    '-----------------如果不止一条记录------------------'
                    For OffCountUnit = 1 To 2
                       If Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP + OffCountUnit, 7) <> "" Then
                    Exit For
                       End If
                       If Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP + OffCountUnit, 9) <> "" And Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP + OffCountUnit, 7) = "" And Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountEQP + OffCountUnit, LoopCountS) = "" Then
                          If Len(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9)) = 4 Then
                             For LoopCountPosition = 1 To Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 17)
                                SPUNITID = SPEQPID & "-" & Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9)
                                'Modified By Sun Shoubing,20180108
                                If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                  SPUNITID = "5SMTE01-MM01"
                                End If
                                If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                  SPUNITID = "5SMTE03-MM04"
                                End If
                                If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                  SPUNITID = "5SMTE04-MM02"
                                End If
                                If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                  SPUNITID = "5SMTE05-MM03"
                                End If
                                '5SMTE03-RS01
                                If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                  SPUNITID = "5SMTE03-RS01"
                                End If
                                '5SMTE02-PI01
                                If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                  SPUNITID = "5SMTE02-PI01"
                                End If
                                If SPUNITID = "5SMTE03-PI01" Then
                                  SPUNITID = "5SMTE03-PI02"
                                End If
                                '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                  SPUNITID = "5SMTE01-CD01"
                                End If
                                If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                  SPUNITID = "5SMTE04-CD02"
                                End If
                                If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                  SPUNITID = "5SMTE05-CD03"
                                End If
                                '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                  SPUNITID = "5SMTE01-MP01"
                                End If
                                If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                  SPUNITID = "5SMTE02-MP02"
                                End If
                                If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                  SPUNITID = "5SMTE03-MP03"
                                End If
                                POSITION = LoopCountPosition
                                POSPSEBSRowCount = POSPSEBSRowCount + 1
                                Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                             Next
                          End If
                          If Len(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9)) = 7 Then
                             For LoopCountPosition = 1 To Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 17)
                                SUnitCount = Val(Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9), 7, 1) - Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9), 4, 1))
                                For LoopCountSUnit = 0 To SUnitCount
                                   SPUNITID = SPEQPID & "-" & Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9), 1, 3) & CStr(Val(Mid(Worksheets("MainFlow_Rework").Cells(Count + OffCount + OffCountUnit, 9), 4, 1)) + LoopCountSUnit)
                                   'Modified By Sun Shoubing,20180108
                                    If SPUNITID = "5SMTE01-MM02" Or SPUNITID = "5SMTE01-MM03" Then
                                      SPUNITID = "5SMTE01-MM01"
                                    End If
                                    If SPUNITID = "5SMTE02-MM01" Or SPUNITID = "5SMTE02-MM02" Or SPUNITID = "5SMTE02-MM03" Then
                                      SPUNITID = "5SMTE01-MM01"
                                    End If
                                    If SPUNITID = "5SMTE03-MM01" Or SPUNITID = "5SMTE03-MM02" Or SPUNITID = "5SMTE03-MM03" Then
                                      SPUNITID = "5SMTE03-MM04"
                                    End If
                                    If SPUNITID = "5SMTE04-MM01" Or SPUNITID = "5SMTE04-MM03" Then
                                      SPUNITID = "5SMTE04-MM02"
                                    End If
                                    If SPUNITID = "5SMTE05-MM01" Or SPUNITID = "5SMTE05-MM02" Then
                                      SPUNITID = "5SMTE05-MM03"
                                    End If
                                    '5SMTE03-RS01
                                    If SPUNITID = "5SMTE01-RS01" Or SPUNITID = "5SMTE02-RS01" Or SPUNITID = "5SMTE01-Rs01" Or SPUNITID = "5SMTE02-Rs01" Or SPUNITID = "5SMTE03-Rs01" Then
                                      SPUNITID = "5SMTE03-RS01"
                                    End If
                                    '5SMTE02-PI01
                                    If SPUNITID = "5SMTE01-PI01" Or SPUNITID = "5SMTE01-PI02" Or SPUNITID = "5SMTE02-PI02" Then
                                      SPUNITID = "5SMTE02-PI01"
                                    End If
                                    If SPUNITID = "5SMTE03-PI01" Then
                                      SPUNITID = "5SMTE03-PI02"
                                    End If
                                    '5SMTE05-CD03 5SMTE04-CD02 5SMTE01-CD01
                                    If SPUNITID = "5SMTE01-CD02" Or SPUNITID = "5SMTE01-CD03" Then
                                      SPUNITID = "5SMTE01-CD01"
                                    End If
                                    If SPUNITID = "5SMTE02-CD01" Or SPUNITID = "5SMTE02-CD02" Or SPUNITID = "5SMTE02-CD03" Or SPUNITID = "5SMTE03-CD01" Or SPUNITID = "5SMTE03-CD02" Or SPUNITID = "5SMTE03-CD03" Then
                                      SPUNITID = "5SMTE01-CD01"
                                    End If
                                    If SPUNITID = "5SMTE04-CD01" Or SPUNITID = "5SMTE04-CD03" Then
                                      SPUNITID = "5SMTE04-CD02"
                                    End If
                                    If SPUNITID = "5SMTE05-CD01" Or SPUNITID = "5SMTE05-CD02" Then
                                      SPUNITID = "5SMTE05-CD03"
                                    End If
                                    '5SMTE01-MP01 5SMTE02-MP02 5SMTE03-MP03
                                    If SPUNITID = "5SMTE01-MP02" Or SPUNITID = "5SMTE01-MP03" Then
                                      SPUNITID = "5SMTE01-MP01"
                                    End If
                                    If SPUNITID = "5SMTE02-MP01" Or SPUNITID = "5SMTE02-MP03" Then
                                      SPUNITID = "5SMTE02-MP02"
                                    End If
                                    If SPUNITID = "5SMTE03-MP01" Or SPUNITID = "5SMTE03-MP02" Then
                                      SPUNITID = "5SMTE03-MP03"
                                    End If
                                   POSITION = LoopCountPosition
                                   POSPSEBSRowCount = POSPSEBSRowCount + 1
                                   Call CreatePOSPRODUCTSAMPLINGEQPBYSLOTData(SNSFactory, SNSProductSpec, SNSProcessFlow, SNSStepID, EQPID, POSITION, SPUNITID, POSPSEBSRowCount)
                                Next
                             Next
                          End If
                       Else
                    Exit For
                       End If
                    Next
                          
                          
                       End If
                    Next
                    
                    
                    
                 '---11---'
                 Next
                 
              End If
           Next
       End If
    Next
  End If
   '-----------------------------------------------------------------MainFlow_Rework-----------------------------------------------------------------------'
   
Next

'------------------------------------------------------BSPRODUCTMASKINFO-------------------------------------------------------------------------------------'
'Query Mask Info, Add By Sun 2021.11.1
    ProductMaskStartCount = 0
    ProductMaskRowCount = 2
    '此循环用于获取ProductSpecName和LotType
    For pCount = 4 To 200
        If Replace(UCase(Worksheets("MainFlow").Cells(pCount, 1)), " ", "") = "MASKID" Then
            ProductMaskStartCount = pCount
            G6ProductSpec = Replace(UCase(Worksheets("MainFlow").Cells(pCount - 1, 1)), " ", "")
            snsLOTTYPE = Replace(UCase(Worksheets("MainFlow").Cells(pCount - 1, 2)), " ", "")
            Exit For
        End If
    Next
    
    For pCount = 1 To 20
        If Worksheets("MainFlow").Cells(pCount + ProductMaskStartCount, 1) <> "" Then
            maskOperation = Worksheets("MainFlow").Cells(pCount + ProductMaskStartCount, 1)
            maskID = Worksheets("MainFlow").Cells(pCount + ProductMaskStartCount, 2)
            ProductMaskRowCount = ProductMaskRowCount + 1
            Call CreateBSPRODUCTMASKINFOData(G6ProductSpec, snsLOTTYPE, maskOperation, maskID, ProductMaskRowCount)
        Else
            Exit For
        End If
    Next
'------------------------------------------------------BSPRODUCTMASKINFO-------------------------------------------------------------------------------------'

Worksheets("RECIPE").Activate
Call SelectRg(Range("L1:L2"))
Range("L1:L500").Font.Name = "宋体"
Range("L1:L500").Font.Size = "10"
Call RemoveDuplicatesRows
Call SelectRg(Range("L1:L2"))

Worksheets("TPFOPOLICY").Activate
Call SelectRg(Range("G1:G2"))
Range("G1:G200").Font.Name = "宋体"
Range("G1:G200").Font.Size = "10"
Call RemoveDuplicatesRows
Call SelectRg(Range("G1:G2"))


Worksheets("TPFOMPOLICY").Activate
Call SelectRg(Range("H1:H2"))
Range("H1:H500").Font.Name = "宋体"
Range("H1:H500").Font.Size = "10"
Call RemoveDuplicatesRows
Call SelectRg(Range("H1:H2"))

Worksheets("POSMACHINE").Activate
Call SelectRg(Range("F1:F2"))
Range("F1:F500").Font.Name = "宋体"
Range("F1:F500").Font.Size = "10"
Call RemoveDuplicatesRows
Call SelectRg(Range("F1:F2"))

Worksheets("POSMACHINERECIPE").Activate
Call SelectRg(Range("E1:E2"))
Range("E1:E500").Font.Name = "宋体"
Range("E1:E500").Font.Size = "10"
Call RemoveDuplicatesRows
Call SelectRg(Range("E1:E2"))

Worksheets("TPPOLICY").Activate
Call SelectRg(Range("E1:E2"))
Range("E1:E10").Font.Name = "宋体"
Range("E1:E10").Font.Size = "10"
Call RemoveDuplicatesRows
Call SelectRg(Range("E1:E2"))

Worksheets("POSPRODUCTSAMPLING").Activate
Call SelectRg(Range("H1:H2"))
Range("H1:H200").Font.Name = "宋体"
Range("H1:H200").Font.Size = "10"
Call RemoveDuplicatesRows
Call SelectRg(Range("H1:H2"))

Worksheets("POSPRODUCTSAMPLINGEQP").Activate
Call SelectRg(Range("F1:F2"))
Range("F1:F2000").Font.Name = "宋体"
Range("F1:F2000").Font.Size = "10"
Call RemoveDuplicatesRows
Call SelectRg(Range("F1:F2"))

Worksheets("BSPRODUCTMASKINFO").Activate
Call SelectRg(Range("J1:J2"))
Range("J1:J20").Font.Name = "宋体"
Range("J1:J20").Font.Size = "10"
Call RemoveDuplicatesRows
Call SelectRg(Range("J1:J2"))

Worksheets("RECIPE").Activate

End Sub



