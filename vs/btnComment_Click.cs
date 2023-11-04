/*
    * 只有btnComment_Click函数中引用了CheckData和SaveData函数
    * 
    * 
    * 
    */
private void btnComment_Click(object sender, EventArgs e)
{
  try
  {
    this.Cursor = Cursors.WaitCursor;

    if (this.CheckData())
    {
      this.SaveData();
    }
  }
  catch (IDMMessageException idmex)
  {
    UILogger.This.Trace(idmex);
    ExceptionMsgBox.This.ShowMessageBox(MessageType.Error, idmex.MessageKey, idmex.LabelKey, idmex.MessageBody);
  }
  catch (System.Exception ex)
  {
    UILogger.This.Trace(ex);
    ExceptionMsgBox.This.ShowMessageBox(MessageType.Error, "COMM10011", this.Text, ex);
  }
  finally
  {
    this.Cursor = Cursors.Default;
  }
}

/*
    * CheckData函数保存Comment输入框中的内容
    * 
    * Comment：评论
    * 最下面Comment控件
    * 
    */
private bool CheckData()
{
  try
  {
    /*
        * this.grdLotInfo.Rows：检验grdLotInfo的行是否为空
        * this.grdLotInfo.Rows.Count：检验grdLotInfo的行总数是否小于0
        * 
        */
    if (this.grdLotInfo.Rows == null || (this.grdLotInfo.Rows.Count) <= 0)
    {
      return false;
    }

    /*
        * userCommand1是Comment输入框的Name属性名字
        * 
        * Text.Trim
        * 返回从文本值 text 删除所有前导空格和尾随空格的结果。
        * 示例：删除“ a b c d ”中的前导空格和尾随空格
        * Text.Trim("     a b c d    ")
        * 输出："a b c d"
        * 
        */
    if (string.IsNullOrEmpty(this.userCommand1.txtComment.Text.Trim()))
    {
      /*
          * 如果Comment输入框是空的，会出现Warning弹窗：Comment is empty,please check it
          * 
          */
      ExceptionMsgBox.This.ShowMessageBox(MessageType.Warning, "Comment is empty,please check it", this.Text);
      return false;
    }
    CheckPrivilege = "true";
    if (!ExceptionMsgBox.This.ShowUserConfirmBox(CheckPrivilege))
    {
      return false;
    }
    return true;
  }
  catch (Exception ex)
  {
    throw ex;
  }
}
private void SaveData()
{
  try
  {
    /*
        * LOTHISTORY是sql表，调用什么sql表就显示什么数据
        * 
        */
    LOTHISTORY objLot = new LOTHISTORY();
    objLot.OBJECTNAME = txtLotName.Text;
    objLot.OBJECTTYPE = "LOT";
    objLot.EVENTCOMMENT = userCommand1.txtComment.Text;

    if (lotService.SetEvent(UDFCONST.AddEventComment, objLot, null))
    {
      this.userCommand1.SetUserComment(userCommand1.txtComment.Text);
    }
    this.userCommand1.txtComment.Text = string.Empty;
    this.ViewData();
  }
  catch (Exception ex)
  {
    throw ex;
  }
}

