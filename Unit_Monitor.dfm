object Form_Monitor: TForm_Monitor
  Left = 213
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Cambria'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 14
  object GBId: TGroupBox
    Left = 0
    Top = 0
    Width = 640
    Height = 48
    Align = alTop
    Caption = ' '#1048#1085#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object IdEdit: TEdit
      Left = 8
      Top = 20
      Width = 281
      Height = 20
      CharCase = ecUpperCase
      Color = clBtnFace
      Ctl3D = False
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object GBMarka: TGroupBox
    Left = 0
    Top = 48
    Width = 640
    Height = 48
    Align = alTop
    Caption = ' '#1052#1072#1088#1082#1072' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object MarkaEdit: TEdit
      Left = 8
      Top = 20
      Width = 281
      Height = 20
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = 'DELL'
    end
  end
  object GBModel: TGroupBox
    Left = 0
    Top = 96
    Width = 640
    Height = 48
    Align = alTop
    Caption = ' '#1052#1086#1076#1077#1083#1100' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object ModelEdit: TEdit
      Left = 8
      Top = 20
      Width = 281
      Height = 20
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = 'E2420H'
    end
  end
  object GBSN: TGroupBox
    Left = 0
    Top = 144
    Width = 640
    Height = 48
    Align = alTop
    Caption = ' '#1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object SNEdit: TEdit
      Left = 8
      Top = 20
      Width = 281
      Height = 20
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = 'CN-0NXYVG-FCC00-042-CKYI-A01'
    end
  end
  object GBInv: TGroupBox
    Left = 0
    Top = 192
    Width = 640
    Height = 48
    Align = alTop
    Caption = ' '#1048#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#1085#1086#1084#1077#1088' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object InvEdit: TEdit
      Left = 8
      Top = 20
      Width = 281
      Height = 20
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = #1053#1045#1058
    end
  end
  object BitSave: TBitBtn
    Left = 376
    Top = 416
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = BitSaveClick
  end
  object BitCancel: TBitBtn
    Left = 456
    Top = 416
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 6
    NumGlyphs = 2
  end
end
