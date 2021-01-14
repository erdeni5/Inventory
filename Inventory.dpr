program Inventory;

uses
  Forms,
  Unit_Main in 'Unit_Main.pas' {Form_Main},
  Unit_DM in 'Unit_DM.pas' {Form_DM: TDataModule},
  Unit_SB in 'Unit_SB.pas' {Form_SB},
  Unit_Monitor in 'Unit_Monitor.pas' {Form_Monitor},
  Unit_Printer in 'Unit_Printer.pas' {Form_Printer},
  Unit_UPS in 'Unit_UPS.pas' {Form_UPS},
  Unit_ARM in 'Unit_ARM.pas' {Form_ARM},
  Unit_Choice in 'Unit_Choice.pas' {Form_Choice},
  Unit_IP in 'Unit_IP.pas' {Form_IP},
  Unit_Reports in 'Unit_Reports.pas' {Form_Reports},
  Unit_Progress in 'Unit_Progress.pas' {Form_Progress},
  Unit_Sotr in 'Unit_Sotr.pas' {Form_Sotr};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Инвентаризация';
  Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TForm_DM, Form_DM);
  Application.Run;
end.
