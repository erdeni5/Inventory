object Form_Of_Search: TForm_Of_Search
  Left = 549
  Top = 292
  BorderStyle = bsDialog
  Caption = 'Form_Of_Search'
  ClientHeight = 300
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 12
      Width = 35
      Height = 15
      Caption = #1053#1072#1081#1090#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object SearchEdit: TEdit
      Left = 64
      Top = 10
      Width = 305
      Height = 20
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = SearchEditChange
      OnKeyDown = SearchEditKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 400
    Height = 218
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object SG: TStringGrid
      Left = 2
      Top = 2
      Width = 396
      Height = 214
      HelpType = htKeyword
      Align = alClient
      Color = clBtnFace
      ColCount = 2
      Ctl3D = False
      DefaultRowHeight = 16
      FixedColor = clMoneyGreen
      FixedCols = 0
      RowCount = 2
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      Options = [goFixedHorzLine, goHorzLine, goRowSelect, goThumbTracking]
      ParentCtl3D = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnDblClick = BitOkClick
      ColWidths = (
        44
        332)
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 259
    Width = 400
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object BitOk: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = BitOkClick
      NumGlyphs = 2
    end
    object BitCancel: TBitBtn
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      OnClick = BitCancelClick
      NumGlyphs = 2
    end
  end
end
