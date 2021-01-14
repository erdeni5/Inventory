object Form_SB: TForm_SB
  Left = 937
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 787
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
  object GBCPU: TGroupBox
    Left = 0
    Top = 97
    Width = 640
    Height = 48
    Align = alTop
    Caption = ' '#1055#1088#1086#1094#1077#1089#1089#1086#1088' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object CPUEdit: TEdit
      Left = 8
      Top = 20
      Width = 624
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
      Text = 'INTEL(R) CELERON(R) CPU J3355 @ 2.00GHZ'
    end
  end
  object BitSave: TBitBtn
    Left = 264
    Top = 744
    Width = 150
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = BitSaveClick
  end
  object BitCancel: TBitBtn
    Left = 456
    Top = 752
    Width = 150
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
    NumGlyphs = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GBId: TGroupBox
      Left = 0
      Top = 0
      Width = 213
      Height = 48
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
        Width = 197
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
    object GBTIP: TGroupBox
      Left = 213
      Top = 0
      Width = 213
      Height = 48
      Caption = ' '#1058#1080#1087' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object TipCB: TComboBox
        Left = 8
        Top = 18
        Width = 197
        Height = 22
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Cambria'
        Font.Style = []
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
    end
    object GBMarka: TGroupBox
      Left = 426
      Top = 0
      Width = 213
      Height = 48
      Caption = ' '#1052#1072#1088#1082#1072' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object MarkaEdit: TEdit
        Left = 8
        Top = 20
        Width = 197
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
        Text = 'DEPO'
      end
    end
    object GBModel: TGroupBox
      Left = 0
      Top = 49
      Width = 213
      Height = 48
      Caption = ' '#1052#1086#1076#1077#1083#1100' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object ModelEdit: TEdit
        Left = 8
        Top = 20
        Width = 197
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
        Text = 'NEOS CD202'
      end
    end
    object GBSN: TGroupBox
      Left = 213
      Top = 49
      Width = 213
      Height = 48
      Caption = ' '#1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object SNEdit: TEdit
        Left = 8
        Top = 20
        Width = 197
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
        Text = '398821-004'
      end
    end
    object GBInv: TGroupBox
      Left = 426
      Top = 49
      Width = 213
      Height = 48
      Caption = ' '#1048#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#1085#1086#1084#1077#1088' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object InvEdit: TEdit
        Left = 8
        Top = 20
        Width = 197
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
        Text = '3101061269'
      end
    end
  end
  object GBOS: TGroupBox
    Left = 0
    Top = 145
    Width = 640
    Height = 72
    Align = alTop
    Caption = ' '#1054#1087#1077#1088#1072#1094#1080#1086#1085#1085#1072#1103' '#1089#1080#1089#1090#1077#1084#1072' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 200
      Height = 15
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1086#1085#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 272
      Top = 24
      Width = 127
      Height = 15
      Caption = #1051#1080#1094#1077#1085#1079#1080#1086#1085#1085#1099#1081' '#1082#1083#1102#1095
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 504
      Top = 24
      Width = 59
      Height = 15
      Caption = #1051#1080#1094#1077#1085#1079#1080#1103
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
    end
    object OSCB: TComboBox
      Left = 8
      Top = 40
      Width = 241
      Height = 22
      BevelInner = bvNone
      BevelKind = bkSoft
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      ItemHeight = 14
      ItemIndex = 1
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = #1053#1045#1058' '#1044#1040#1053#1053#1067#1061
      Items.Strings = (
        #1053#1045#1058
        #1053#1045#1058' '#1044#1040#1053#1053#1067#1061
        'WINDOWS 7'
        'WINDOWS 10')
    end
    object OSKeyEdit: TEdit
      Left = 272
      Top = 42
      Width = 217
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
      TabOrder = 1
      Text = #1053#1045#1058' '#1044#1040#1053#1053#1067#1061
    end
    object LicenseCB: TComboBox
      Left = 504
      Top = 40
      Width = 121
      Height = 22
      BevelInner = bvNone
      BevelKind = bkSoft
      CharCase = ecUpperCase
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
      TabOrder = 2
      Text = #1053#1045#1058' '#1044#1040#1053#1053#1067#1061
      Items.Strings = (
        #1053#1045#1058' '#1044#1040#1053#1053#1067#1061
        #1044#1040
        #1053#1045#1058)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 217
    Width = 640
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object GBVipNet: TGroupBox
      Left = 0
      Top = 0
      Width = 213
      Height = 48
      Caption = ' VipNet '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object VipNetEdit: TEdit
        Left = 8
        Top = 20
        Width = 197
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
        Text = #1053#1045#1058' '#1044#1040#1053#1053#1067#1061
      end
    end
    object GBMIS: TGroupBox
      Left = 213
      Top = 0
      Width = 213
      Height = 48
      Caption = ' '#1052#1048#1057' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object MISCB: TComboBox
        Left = 8
        Top = 18
        Width = 197
        Height = 22
        BevelInner = bvNone
        BevelKind = bkSoft
        CharCase = ecUpperCase
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
        Text = #1053#1045#1058' '#1044#1040#1053#1053#1067#1061
        Items.Strings = (
          #1053#1045#1058' '#1044#1040#1053#1053#1067#1061
          #1044#1040
          #1053#1045#1058)
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 266
    Width = 640
    Height = 223
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 6
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
    end
  end
end
