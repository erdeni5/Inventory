object Form_IP: TForm_IP
  Left = 284
  Top = 441
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 640
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
  object GBARM: TGroupBox
    Left = 0
    Top = 97
    Width = 640
    Height = 167
    Align = alTop
    Caption = ' '#1040#1074#1090#1086#1084#1072#1090#1080#1079#1080#1088#1086#1074#1072#1085#1085#1086#1077' '#1088#1072#1073#1086#1095#1077#1077' '#1084#1077#1089#1090#1086' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object SBIdSB: TSpeedButton
      Left = 586
      Top = 31
      Width = 23
      Height = 20
      Caption = '+'
      Flat = True
      OnClick = SBIdSBClick
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 100
      Height = 15
      Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1081' '#1073#1083#1086#1082
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
    end
    object SBIdMonitor: TSpeedButton
      Left = 585
      Top = 67
      Width = 23
      Height = 20
      Caption = '+'
      Flat = True
      OnClick = SBIdMonitorClick
    end
    object Label2: TLabel
      Left = 8
      Top = 52
      Width = 55
      Height = 15
      Caption = #1052#1086#1085#1080#1090#1086#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
    end
    object SBIdUPS: TSpeedButton
      Left = 585
      Top = 103
      Width = 23
      Height = 20
      Caption = '+'
      Flat = True
      OnClick = SBIdUPSClick
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 211
      Height = 15
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1073#1077#1089#1087#1077#1088#1077#1073#1086#1081#1085#1086#1075#1086' '#1087#1080#1090#1072#1085#1080#1103
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 124
      Width = 52
      Height = 15
      Caption = #1055#1088#1080#1085#1090#1077#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
    end
    object SBIdPrinter: TSpeedButton
      Left = 585
      Top = 139
      Width = 23
      Height = 20
      Caption = '+'
      Flat = True
      OnClick = SBIdPrinterClick
    end
    object SBIdSBDelete: TSpeedButton
      Left = 610
      Top = 31
      Width = 23
      Height = 20
      Caption = 'X'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SBIdSBDeleteClick
    end
    object SBIdMonitorDelete: TSpeedButton
      Left = 609
      Top = 67
      Width = 23
      Height = 20
      Caption = 'X'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SBIdMonitorDeleteClick
    end
    object SBIdUPSDelete: TSpeedButton
      Left = 609
      Top = 103
      Width = 23
      Height = 20
      Caption = 'X'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SBIdUPSDeleteClick
    end
    object SBIdPrinterDelete: TSpeedButton
      Left = 609
      Top = 139
      Width = 23
      Height = 20
      Caption = 'X'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SBIdPrinterDeleteClick
    end
    object IdSBEdit: TEdit
      Left = 8
      Top = 31
      Width = 577
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
    object IdMonitorEdit: TEdit
      Left = 8
      Top = 67
      Width = 577
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
    end
    object IdUPSEdit: TEdit
      Left = 8
      Top = 103
      Width = 577
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
      TabOrder = 2
    end
    object IdPrinterEdit: TEdit
      Left = 8
      Top = 139
      Width = 577
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
      TabOrder = 3
    end
  end
  object BitSave: TBitBtn
    Left = 336
    Top = 608
    Width = 150
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = BitSaveClick
  end
  object BitCancel: TBitBtn
    Left = 488
    Top = 608
    Width = 150
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
    NumGlyphs = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 97
    Align = alTop
    TabOrder = 0
    object GBId: TGroupBox
      Left = 1
      Top = 1
      Width = 166
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
        Width = 150
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
    object GBIP: TGroupBox
      Left = 169
      Top = 1
      Width = 166
      Height = 48
      Caption = ' IP-'#1072#1076#1088#1077#1089' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object IP1Edit: TEdit
        Left = 8
        Top = 20
        Width = 33
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Cambria'
        Font.Style = []
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = '192'
        OnExit = IP1EditExit
      end
      object IP2Edit: TEdit
        Left = 47
        Top = 20
        Width = 34
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Cambria'
        Font.Style = []
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        Text = '168'
        OnExit = IP2EditExit
      end
      object IP3Edit: TEdit
        Left = 86
        Top = 20
        Width = 33
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Cambria'
        Font.Style = []
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Text = '156'
        OnExit = IP3EditExit
      end
      object IP4Edit: TEdit
        Left = 125
        Top = 20
        Width = 33
        Height = 20
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Cambria'
        Font.Style = []
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnExit = IP4EditExit
      end
    end
    object GBZdanie: TGroupBox
      Left = 337
      Top = 1
      Width = 303
      Height = 48
      Caption = ' '#1047#1076#1072#1085#1080#1077' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object ZdanieCB: TComboBox
        Left = 8
        Top = 18
        Width = 286
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
        ItemIndex = 1
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = #1058#1045#1056#1045#1064#1050#1054#1042#1054#1049
        Items.Strings = (
          #1055#1056#1054#1057#1055#1045#1050#1058
          #1058#1045#1056#1045#1064#1050#1054#1042#1054#1049
          #1055#1040#1042#1051#1054#1042#1040
          #1041#1040#1041#1059#1064#1050#1048#1053#1040)
      end
    end
    object GBMesto: TGroupBox
      Left = 1
      Top = 49
      Width = 320
      Height = 48
      Caption = ' '#1052#1077#1089#1090#1086' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object MestoEdit: TEdit
        Left = 8
        Top = 20
        Width = 304
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
        Text = #1050#1040#1041#1048#1053#1045#1058
      end
    end
    object GBTip: TGroupBox
      Left = 321
      Top = 49
      Width = 319
      Height = 48
      Caption = ' '#1058#1080#1087' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object TipEdit: TEdit
        Left = 8
        Top = 20
        Width = 304
        Height = 20
        CharCase = ecUpperCase
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
        Text = #1040#1056#1052
      end
    end
  end
  object GBIdOther: TGroupBox
    Left = 0
    Top = 264
    Width = 640
    Height = 49
    Align = alTop
    Caption = ' '#1048#1085#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077'  '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object SBIdOther: TSpeedButton
      Left = 586
      Top = 20
      Width = 23
      Height = 20
      Caption = '+'
      Flat = True
    end
    object SpeedButton4: TSpeedButton
      Left = 610
      Top = 20
      Width = 23
      Height = 20
      Caption = 'X'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object IdOtherEdit: TEdit
      Left = 8
      Top = 20
      Width = 577
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
  object GBSotr: TGroupBox
    Left = 0
    Top = 313
    Width = 640
    Height = 320
    Align = alTop
    Caption = ' '#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label5: TLabel
      Left = 8
      Top = 24
      Width = 162
      Height = 14
      Caption = #1060#1048#1054' '#1080' '#1076#1086#1083#1078#1085#1086#1089#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 404
      Top = 24
      Width = 112
      Height = 14
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1080' '#1082#1086#1085#1094#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
    end
    object SBSotr: TSpeedButton
      Left = 362
      Top = 44
      Width = 23
      Height = 20
      Caption = '+'
      Flat = True
      OnClick = SBSotrClick
    end
    object SGSotr: TStringGrid
      Left = 2
      Top = 72
      Width = 636
      Height = 246
      ColCount = 4
      Ctl3D = False
      FixedColor = clMoneyGreen
      FixedCols = 0
      RowCount = 2
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnDblClick = SGSotrDblClick
      OnSelectCell = SGSotrSelectCell
    end
    object FIOCB: TComboBox
      Left = 8
      Top = 42
      Width = 350
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
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object DateOtME: TMaskEdit
      Left = 404
      Top = 44
      Width = 65
      Height = 20
      CharCase = ecUpperCase
      Ctl3D = False
      EditMask = '99/99/9999;0;_'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnExit = DateOtMEExit
    end
    object DateDoME: TMaskEdit
      Left = 476
      Top = 44
      Width = 65
      Height = 20
      CharCase = ecUpperCase
      Ctl3D = False
      EditMask = '99/99/9999;0;_'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnExit = DateDoMEExit
    end
    object BitSaveSotr: TBitBtn
      Left = 552
      Top = 40
      Width = 41
      Height = 25
      TabOrder = 4
      OnClick = BitSaveSotrClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitCancelSotr: TBitBtn
      Left = 592
      Top = 40
      Width = 41
      Height = 25
      TabOrder = 5
      OnClick = BitCancelSotrClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
end
