object Form_Sotr: TForm_Sotr
  Left = 215
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form_Sotr'
  ClientHeight = 330
  ClientWidth = 316
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
    Width = 316
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
      Width = 300
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
  object GBFam: TGroupBox
    Left = 0
    Top = 48
    Width = 316
    Height = 48
    Align = alTop
    Caption = ' '#1060#1072#1084#1080#1083#1080#1103' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object FamEdit: TEdit
      Left = 8
      Top = 20
      Width = 300
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
    end
  end
  object GBImj: TGroupBox
    Left = 0
    Top = 96
    Width = 316
    Height = 48
    Align = alTop
    Caption = ' '#1048#1084#1103' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object ImjEdit: TEdit
      Left = 8
      Top = 20
      Width = 300
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
    end
  end
  object GBOtch: TGroupBox
    Left = 0
    Top = 144
    Width = 316
    Height = 48
    Align = alTop
    Caption = ' '#1054#1090#1095#1077#1089#1090#1074#1086' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object OtchEdit: TEdit
      Left = 8
      Top = 20
      Width = 300
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
    end
  end
  object GBInv: TGroupBox
    Left = 0
    Top = 192
    Width = 316
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
    object TipCB: TComboBox
      Left = 8
      Top = 18
      Width = 300
      Height = 22
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      ItemHeight = 14
      ItemIndex = 0
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = #1052#1045#1044#1055#1045#1056#1057#1054#1053#1040#1051
      Items.Strings = (
        #1052#1045#1044#1055#1045#1056#1057#1054#1053#1040#1051
        #1055#1056#1054#1063#1048#1045)
    end
  end
  object GBDolzh: TGroupBox
    Left = 0
    Top = 240
    Width = 316
    Height = 48
    Align = alTop
    Caption = ' '#1044#1086#1083#1078#1085#1086#1089#1090#1100' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object DolzhEdit: TEdit
      Left = 8
      Top = 20
      Width = 300
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
    end
  end
  object BitSave: TBitBtn
    Left = 8
    Top = 296
    Width = 150
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 6
    OnClick = BitSaveClick
  end
  object BitCancel: TBitBtn
    Left = 160
    Top = 296
    Width = 150
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 7
    NumGlyphs = 2
  end
end
