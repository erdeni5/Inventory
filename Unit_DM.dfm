object Form_DM: TForm_DM
  OldCreateOrder = False
  Left = 250
  Top = 54
  Height = 204
  Width = 691
  object Con: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=BD.accdb;Persist S' +
      'ecurity Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 8
    Top = 8
  end
  object QPC: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SB')
    Left = 56
    Top = 8
  end
  object DSPC: TDataSource
    DataSet = QPC
    Left = 56
    Top = 64
  end
  object QAdd: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SB')
    Left = 120
    Top = 8
  end
  object QEdit: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SB')
    Left = 152
    Top = 8
  end
  object QHelp: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SB')
    Left = 256
    Top = 8
  end
  object QChoice: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SB')
    Left = 320
    Top = 8
  end
  object DSChoice: TDataSource
    DataSet = QChoice
    Left = 320
    Top = 64
  end
  object QReport: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SB')
    Left = 408
    Top = 8
  end
  object QIPSotr: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SB')
    Left = 488
    Top = 8
  end
  object QSotr: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SB')
    Left = 520
    Top = 8
  end
end
