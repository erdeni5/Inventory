object Form_Progress: TForm_Progress
  Left = 1544
  Top = 513
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = #1048#1076#1077#1090' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1087#1080#1089#1082#1072
  ClientHeight = 25
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 0
    Width = 360
    Height = 25
    Align = alClient
    ForeColor = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Cambria'
    Font.Style = []
    MaxValue = 1000000000
    ParentFont = False
    Progress = 10
  end
end
