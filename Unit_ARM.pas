unit Unit_ARM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_ARM = class(TForm)
    GBId: TGroupBox;
    IdEdit: TEdit;
    GBSB: TGroupBox;
    SBEdit: TEdit;
    GBMonitor: TGroupBox;
    MonitorEdit: TEdit;
    GBUPS: TGroupBox;
    UPSEdit: TEdit;
    GBPrinter: TGroupBox;
    PrinterEdit: TEdit;
    BitSave: TBitBtn;
    BitCancel: TBitBtn;
    SBSB: TSpeedButton;
    SBMonitor: TSpeedButton;
    SBUPS: TSpeedButton;
    SBPrinter: TSpeedButton;
    procedure BitSaveClick(Sender: TObject);
    procedure SBSBClick(Sender: TObject);
    procedure SBMonitorClick(Sender: TObject);
    procedure SBUPSClick(Sender: TObject);
    procedure SBPrinterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ARM: TForm_ARM;

implementation

uses Unit_DM, Unit_Choice, Unit_Main;

{$R *.dfm}

procedure TForm_ARM.BitSaveClick(Sender: TObject);

procedure AddARM;
begin
  with Form_DM.QAdd.SQL do
   begin
    Clear;
    Add('INSERT INTO ARM');
    Add('(SB,MONITOR,UPS,PRINTER)VALUES');
    Add('(' + IntToStr(SBEdit.Tag) + ',');
    Add(IntToStr(MonitorEdit.Tag) + ',');
    Add(IntToStr(UPSEdit.Tag) + ',');
    Add(IntToStr(PrinterEdit.Tag) + ')');
   end;
  try
   Form_DM.QAdd.ExecSQL;
  except
   on Exception do
    begin
     Application.MessageBox('Не удалось сохранить!' + #13 + 'Попробуйте позже.',
                            'Ошибка сохранения', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure EditARM;
begin
  with Form_DM.QEdit.SQL do
   begin
    Clear;
    Add('UPDATE ARM SET ');
    Add('SB=' + IntToStr(SBEdit.Tag) + ',');
    Add('MONITOR=' + IntToStr(MonitorEdit.Tag) + ',');
    Add('UPS=' + IntToStr(UPSEdit.Tag) + ',');
    Add('PRINTER=' + IntToStr(PrinterEdit.Tag));
    Add('WHERE(ID=' + IntToStr(Form_DM.QPC.FieldValues['ID']) + ')');
   end;
  try
   Form_DM.QEdit.SQL.SaveToFile('1.TXT');
   Form_DM.QEdit.ExecSQL;
  except
   on Exception do
    begin
     Application.MessageBox('Не удалось сохранить!' + #13 + 'Попробуйте позже.',
                            'Ошибка сохранения', MB_OK + MB_ICONERROR);
    end;
  end;
end;

begin
  case (Tag) of
   0 : AddARM;
   1 : EditARM;
  end;
  Close;
end;

procedure TForm_ARM.SBSBClick(Sender: TObject);
begin
  Form_DM.QChoice.SQL.Text := 'SELECT ID,(SELECT TEXTSMALL FROM SPR WHERE(NOMER=2)AND(KOD=TIP))AS T,MARKA,MODEL,INV FROM SB';
  Form_DM.QChoice.Open;
  Application.CreateForm(TForm_Choice, Form_Choice);
  try
   with Form_Choice do
    begin
     Caption := 'Выбор системного блока';
     DBChoice.Columns[0].Width := 30;
     DBChoice.Columns[0].Title.Caption := 'Id';
     DBChoice.Columns[0].Title.Alignment := taCenter;

     DBChoice.Columns[1].Width := 100;
     DBChoice.Columns[1].Title.Caption := 'Тип';
     DBChoice.Columns[1].Title.Alignment := taCenter;

     DBChoice.Columns[2].Width := 100;
     DBChoice.Columns[2].Title.Caption := 'Марка';
     DBChoice.Columns[2].Title.Alignment := taCenter;

     DBChoice.Columns[3].Width := 100;
     DBChoice.Columns[3].Title.Caption := 'Модель';
     DBChoice.Columns[3].Title.Alignment := taCenter;

     DBChoice.Columns[4].Width := 150;
     DBChoice.Columns[4].Title.Caption := 'Инвентарный номер';
     DBChoice.Columns[4].Title.Alignment := taCenter;

     ShowModal;
    end;
  finally
   SBEdit.Tag := Form_DM.QChoice.FieldValues['ID'];
   SBEdit.Text := 'Тип-' + Form_DM.QChoice.FieldValues['T'] +
                  ',Марка-' + Form_Main.NoRecord(Form_DM.QChoice.FieldValues['MARKA']);

   SBEdit.SetFocus;
   FreeAndNil(Form_Choice);
  end;
end;

procedure TForm_ARM.SBMonitorClick(Sender: TObject);
begin
  Form_DM.QChoice.SQL.Text := 'SELECT*FROM MONITOR ORDER BY ID';
  Form_DM.QChoice.Open;
  Application.CreateForm(TForm_Choice, Form_Choice);
  try
   with Form_Choice do
    begin
     Caption := 'Выбор монитора';

     ShowModal;
    end;
  finally
   MonitorEdit.Tag := Form_DM.QChoice.FieldValues['ID'];
   MonitorEdit.Text := Form_DM.QChoice.FieldValues['INV'];
   MonitorEdit.SetFocus;
   FreeAndNil(Form_Choice);
  end;
end;

procedure TForm_ARM.SBUPSClick(Sender: TObject);
begin
  Form_DM.QChoice.SQL.Text := 'SELECT*FROM UPS ORDER BY ID';
  Form_DM.QChoice.Open;
  Application.CreateForm(TForm_Choice, Form_Choice);
  try
   with Form_Choice do
    begin
     Caption := 'Выбор ИБП';

     ShowModal;
    end;
  finally
   UPSEdit.Tag := Form_DM.QChoice.FieldValues['ID'];
   UPSEdit.Text := Form_DM.QChoice.FieldValues['INV'];
   UPSEdit.SetFocus;
   FreeAndNil(Form_Choice);
  end;
end;

procedure TForm_ARM.SBPrinterClick(Sender: TObject);
begin
  Form_DM.QChoice.SQL.Text := 'SELECT*FROM PRINTER ORDER BY ID';
  Form_DM.QChoice.Open;
  Application.CreateForm(TForm_Choice, Form_Choice);
  try
   with Form_Choice do
    begin
     Caption := 'Выбор принтера';

     ShowModal;
    end;
  finally
   PrinterEdit.Tag := Form_DM.QChoice.FieldValues['ID'];
   PrinterEdit.Text := Form_DM.QChoice.FieldValues['INV'];
   PrinterEdit.SetFocus;
   FreeAndNil(Form_Choice);
  end;
end;

end.
