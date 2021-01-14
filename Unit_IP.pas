unit Unit_IP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, Mask;

type
  TForm_IP = class(TForm)
    GBARM: TGroupBox;
    IdSBEdit: TEdit;
    BitSave: TBitBtn;
    BitCancel: TBitBtn;
    SBIdSB: TSpeedButton;
    Panel1: TPanel;
    GBId: TGroupBox;
    IdEdit: TEdit;
    GBIP: TGroupBox;
    IP1Edit: TEdit;
    GBZdanie: TGroupBox;
    ZdanieCB: TComboBox;
    GBMesto: TGroupBox;
    MestoEdit: TEdit;
    GBTip: TGroupBox;
    TipEdit: TEdit;
    Label1: TLabel;
    IdMonitorEdit: TEdit;
    SBIdMonitor: TSpeedButton;
    Label2: TLabel;
    IdUPSEdit: TEdit;
    SBIdUPS: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    IdPrinterEdit: TEdit;
    SBIdPrinter: TSpeedButton;
    GBIdOther: TGroupBox;
    SBIdOther: TSpeedButton;
    IdOtherEdit: TEdit;
    SBIdSBDelete: TSpeedButton;
    SBIdMonitorDelete: TSpeedButton;
    SBIdUPSDelete: TSpeedButton;
    SBIdPrinterDelete: TSpeedButton;
    SpeedButton4: TSpeedButton;
    GBSotr: TGroupBox;
    IP2Edit: TEdit;
    IP3Edit: TEdit;
    IP4Edit: TEdit;
    SGSotr: TStringGrid;
    FIOCB: TComboBox;
    DateOtME: TMaskEdit;
    DateDoME: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    SBSotr: TSpeedButton;
    BitSaveSotr: TBitBtn;
    BitCancelSotr: TBitBtn;
    procedure SBIdSBClick(Sender: TObject);
    procedure BitSaveClick(Sender: TObject);
    procedure SBIdMonitorClick(Sender: TObject);
    procedure SBIdUPSClick(Sender: TObject);
    procedure SBIdPrinterClick(Sender: TObject);
    procedure SBIdSBDeleteClick(Sender: TObject);
    procedure SBIdMonitorDeleteClick(Sender: TObject);
    procedure SBIdUPSDeleteClick(Sender: TObject);
    procedure SBIdPrinterDeleteClick(Sender: TObject);
    procedure IP1EditExit(Sender: TObject);
    procedure IP2EditExit(Sender: TObject);
    procedure IP3EditExit(Sender: TObject);
    procedure IP4EditExit(Sender: TObject);
    procedure DateOtMEExit(Sender: TObject);
    procedure DateDoMEExit(Sender: TObject);
    procedure SGSotrSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGSotrDblClick(Sender: TObject);
    procedure SBSotrClick(Sender: TObject);
    procedure BitSaveSotrClick(Sender: TObject);
    procedure BitCancelSotrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_IP: TForm_IP;
  SGSotrRow : integer;

implementation

uses Unit_Main, Unit_DM, Unit_Choice, Unit_Sotr;

{$R *.dfm}

procedure TForm_IP.SBIdSBClick(Sender: TObject);
begin
  Form_DM.QChoice.SQL.Text := 'SELECT ID,(SELECT TEXTSMALL FROM SPR WHERE(NOMER=2)AND(KOD=TIP))AS T,MARKA,MODEL,INV ' +
                              'FROM SB ORDER BY ID';
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

     DBChoice.Columns[2].Width := 150;
     DBChoice.Columns[2].Title.Caption := 'Марка';
     DBChoice.Columns[2].Title.Alignment := taCenter;

     DBChoice.Columns[3].Width := 150;
     DBChoice.Columns[3].Title.Caption := 'Модель';
     DBChoice.Columns[3].Title.Alignment := taCenter;

     DBChoice.Columns[4].Width := 150;
     DBChoice.Columns[4].Title.Caption := 'Инвентарный номер';
     DBChoice.Columns[4].Title.Alignment := taCenter;

     ShowModal;
    end;
  finally
   IdSBEdit.Tag := Form_DM.QChoice.FieldValues['ID'];
   IdSBEdit.Text := 'Тип-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['T'])) +
                  ', Марка-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['MARKA'])) +
                  ', Модель-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['MODEL'])) +
                  ', И/Н-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['INV']));
   IdSBEdit.SetFocus;
   FreeAndNil(Form_Choice);
  end;
end;

procedure TForm_IP.BitSaveClick(Sender: TObject);

procedure AddIP;
begin
  with Form_DM.QAdd.SQL do
   begin
    Clear;
    Add('INSERT INTO IP');
    Add('(IP,ZDANIE,MESTO,TIP,IDSB,IDMONITOR,IDUPS,IDPRINTER,IDOTHER)VALUES');
    Add('(''' + IP1Edit.Text + '.' + IP2Edit.Text + '.' + IP3Edit.Text + '.' + IP4Edit.Text + ''',');
    Add('''' + IntToStr(ZdanieCB.ItemIndex) + ''',');
    Add('''' + MestoEdit.Text + ''',');
    Add('''' + IntToStr(TipEdit.Tag) + ''',');
    Add('''' + IntToStr(IdSBEdit.Tag) + ''',');
    Add('''' + IntToStr(IdMonitorEdit.Tag) + ''',');
    Add('''' + IntToStr(IdUPSEdit.Tag) + ''',');
    Add('''' + IntToStr(IdPrinterEdit.Tag) + ''',');
    Add('''' + IntToStr(IdOtherEdit.Tag) + ''')');
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

procedure EditIP;
begin
  with Form_DM.QEdit.SQL do
   begin
    Clear;
    Add('UPDATE IP SET ');
    Add('IP=''' + IP1Edit.Text + '.' + IP2Edit.Text + '.' + IP3Edit.Text + '.' + IP4Edit.Text + ''',');
    Add('ZDANIE=''' + IntToStr(ZdanieCB.ItemIndex) + ''',');
    Add('MESTO=''' + MestoEdit.Text + ''',');
    Add('TIP=''' + IntToStr(TipEdit.Tag) + ''',');
    Add('IDSB=''' + IntToStr(IdSBEdit.Tag) + ''',');
    Add('IDMONITOR=''' + IntToStr(IdMonitorEdit.Tag) + ''',');
    Add('IDUPS=''' + IntToStr(IdUPSEdit.Tag) + ''',');
    Add('IDPRINTER=''' + IntToStr(IdPrinterEdit.Tag) + ''',');
    Add('IDOTHER=''' + IntToStr(IdOtherEdit.Tag) + '''');
    Add('WHERE(ID=' + IntToStr(Form_DM.QPC.FieldValues['ID']) + ')');
   end;
  try
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
   0 : AddIP;
   1 : EditIP;
  end;
  Close;
end;

procedure TForm_IP.SBIdMonitorClick(Sender: TObject);
begin
  Form_DM.QChoice.SQL.Text := 'SELECT ID,MARKA,MODEL,INV FROM MONITOR';
  Form_DM.QChoice.Open;
  Application.CreateForm(TForm_Choice, Form_Choice);
  try
   with Form_Choice do
    begin
     Caption := 'Выбор монитора';
     DBChoice.Columns[0].Width := 30;
     DBChoice.Columns[0].Title.Caption := 'Id';
     DBChoice.Columns[0].Title.Alignment := taCenter;

     DBChoice.Columns[1].Width := 150;
     DBChoice.Columns[1].Title.Caption := 'Марка';
     DBChoice.Columns[1].Title.Alignment := taCenter;

     DBChoice.Columns[2].Width := 150;
     DBChoice.Columns[2].Title.Caption := 'Модель';
     DBChoice.Columns[2].Title.Alignment := taCenter;

     DBChoice.Columns[3].Width := 150;
     DBChoice.Columns[3].Title.Caption := 'Инвентарный номер';
     DBChoice.Columns[3].Title.Alignment := taCenter;

     ShowModal;
    end;
  finally
   IdMonitorEdit.Tag := Form_DM.QChoice.FieldValues['ID'];
   IdMonitorEdit.Text := 'Марка-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['MARKA'])) +
                       ', Модель-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['MODEL'])) +
                       ', И/Н-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['INV']));
   IdMonitorEdit.SetFocus;
   FreeAndNil(Form_Choice);
  end;
end;

procedure TForm_IP.SBIdUPSClick(Sender: TObject);
begin
  Form_DM.QChoice.SQL.Text := 'SELECT ID,MARKA,MODEL,INV FROM UPS';
  Form_DM.QChoice.Open;
  Application.CreateForm(TForm_Choice, Form_Choice);
  try
   with Form_Choice do
    begin
     Caption := 'Выбор ИБП';
     DBChoice.Columns[0].Width := 30;
     DBChoice.Columns[0].Title.Caption := 'Id';
     DBChoice.Columns[0].Title.Alignment := taCenter;

     DBChoice.Columns[1].Width := 150;
     DBChoice.Columns[1].Title.Caption := 'Марка';
     DBChoice.Columns[1].Title.Alignment := taCenter;

     DBChoice.Columns[2].Width := 150;
     DBChoice.Columns[2].Title.Caption := 'Модель';
     DBChoice.Columns[2].Title.Alignment := taCenter;

     DBChoice.Columns[3].Width := 150;
     DBChoice.Columns[3].Title.Caption := 'Инвентарный номер';
     DBChoice.Columns[3].Title.Alignment := taCenter;

     ShowModal;
    end;
  finally
   IdUPSEdit.Tag := Form_DM.QChoice.FieldValues['ID'];
   IdUPSEdit.Text := 'Марка-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['MARKA'])) +
                   ', Модель-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['MODEL'])) +
                   ', И/Н-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['INV']));
   IdUPSEdit.SetFocus;
   FreeAndNil(Form_Choice);
  end;
end;

procedure TForm_IP.SBIdPrinterClick(Sender: TObject);
begin
  Form_DM.QChoice.SQL.Text := 'SELECT ID,MARKA,MODEL,INV FROM PRINTER';
  Form_DM.QChoice.Open;
  Application.CreateForm(TForm_Choice, Form_Choice);
  try
   with Form_Choice do
    begin
     Caption := 'Выбор принтера';
     DBChoice.Columns[0].Width := 30;
     DBChoice.Columns[0].Title.Caption := 'Id';
     DBChoice.Columns[0].Title.Alignment := taCenter;

     DBChoice.Columns[1].Width := 150;
     DBChoice.Columns[1].Title.Caption := 'Марка';
     DBChoice.Columns[1].Title.Alignment := taCenter;

     DBChoice.Columns[2].Width := 150;
     DBChoice.Columns[2].Title.Caption := 'Модель';
     DBChoice.Columns[2].Title.Alignment := taCenter;

     DBChoice.Columns[3].Width := 150;
     DBChoice.Columns[3].Title.Caption := 'Инвентарный номер';
     DBChoice.Columns[3].Title.Alignment := taCenter;

     ShowModal;
    end;
  finally
   IdPrinterEdit.Tag := Form_DM.QChoice.FieldValues['ID'];
   IdPrinterEdit.Text := 'Марка-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['MARKA'])) +
                       ', Модель-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['MODEL'])) +
                       ', И/Н-' + Form_Main.NoRecord(VarToStr(Form_DM.QChoice.FieldValues['INV']));
   IdPrinterEdit.SetFocus;
   FreeAndNil(Form_Choice);
  end;
end;

procedure TForm_IP.SBIdSBDeleteClick(Sender: TObject);
begin
  IdSBEdit.Tag := 0;
  IdSBEdit.Text := 'Системный блок не выбран';
end;

procedure TForm_IP.SBIdMonitorDeleteClick(Sender: TObject);
begin
  IdMonitorEdit.Tag := 0;
  IdMonitorEdit.Text := 'Монитор не выбран';
end;

procedure TForm_IP.SBIdUPSDeleteClick(Sender: TObject);
begin
  IdUPSEdit.Tag := 0;
  IdUPSEdit.Text := 'ИБП не выбран';
end;

procedure TForm_IP.SBIdPrinterDeleteClick(Sender: TObject);
begin
  IdPrinterEdit.Tag := 0;
  IdPrinterEdit.Text := 'Принтер не выбран';
end;

procedure TForm_IP.IP1EditExit(Sender: TObject);
begin
  case Length(IP1Edit.Text) of
   0 : IP1Edit.Text := '000';
   1 : IP1Edit.Text := '00' + IP1Edit.Text;
   2 : IP1Edit.Text := '0' + IP1Edit.Text;
  end; 
end;

procedure TForm_IP.IP2EditExit(Sender: TObject);
begin
  case Length(IP2Edit.Text) of
   0 : IP2Edit.Text := '000';
   1 : IP2Edit.Text := '00' + IP2Edit.Text;
   2 : IP2Edit.Text := '0' + IP2Edit.Text;
  end;
end;

procedure TForm_IP.IP3EditExit(Sender: TObject);
begin
  case Length(IP3Edit.Text) of
   0 : IP3Edit.Text := '000';
   1 : IP3Edit.Text := '00' + IP3Edit.Text;
   2 : IP3Edit.Text := '0' + IP3Edit.Text;
  end;
end;

procedure TForm_IP.IP4EditExit(Sender: TObject);
begin
  case Length(IP4Edit.Text) of
   0 : IP4Edit.Text := '000';
   1 : IP4Edit.Text := '00' + IP4Edit.Text;
   2 : IP4Edit.Text := '0' + IP4Edit.Text;
  end;
end;

procedure TForm_IP.DateOtMEExit(Sender: TObject);
begin
  if (DateOtME.Text <> '') then
   Form_Main.ValidDate(DateOtME, DateOtME.Text);
end;

procedure TForm_IP.DateDoMEExit(Sender: TObject);
begin
  if (DateDoME.Text <> '') then
   Form_Main.ValidDate(DateDoME, DateDoME.Text);
end;

procedure TForm_IP.SGSotrSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  SGSotrRow := ARow;
end;

procedure TForm_IP.SGSotrDblClick(Sender: TObject);
begin
  if (Form_DM.QIPSotr.IsEmpty) then
  else
   begin
    Form_DM.QIPSotr.First;
    Form_DM.QIPSotr.MoveBy(SGSotrRow - 1);

    SGSotr.Tag := Form_DM.QIPSotr.FieldValues['IDSOTR'];

    FIOCB.ItemIndex := FIOCB.Items.IndexOf(Form_DM.QIPSotr.FieldValues['FIO']);
    DateOtME.Text := Form_Main.DateToEdit(Form_DM.QIPSotr.FieldValues['DATEOT']);
    DateDoME.Text := Form_Main.DateToEdit(VarToStr(Form_DM.QIPSotr.FieldValues['DATEDO']));
  end;
end;

procedure TForm_IP.SBSotrClick(Sender: TObject);
var
  i : integer;
begin
  Application.CreateForm(TForm_Sotr, Form_Sotr);
  try
   with Form_Sotr do
    begin
     Tag := 0;
     Caption := 'Добавление сотрудника';

     ShowModal;
    end;
  finally
   Form_DM.QSotr.Refresh;
   FIOCB.Items.Clear;
   for i := 1 to Form_DM.QSotr.RecordCount do
    begin
     FIOCB.Items.Add(VarToStr(Form_DM.QSotr.FieldValues['FIO']));
     Form_DM.QSotr.Next;
    end;
   FreeAndNil(Form_Sotr);
  end;
end;

procedure TForm_IP.BitSaveSotrClick(Sender: TObject);

procedure AddIPSotr;
begin
  with Form_DM.QAdd.SQL do
   begin
    Clear;
    Add('INSERT INTO IPSOTR');
    Add('(IDIP,IDSOTR,DATEOT,DATEDO)VALUES');
    Add('(''' + Form_DM.QPC.FieldValues['ID'] + ''',');

    Form_DM.QSotr.First;
    Form_DM.QSotr.MoveBy(FIOCB.ItemIndex);

    Add('''' + VarToStr(Form_DM.QSotr.FieldValues['ID']) + ''',');
    Add('''' + Form_Main.DateEditToDate(DateOtME.Text) + ''',');
    Add('''' + Form_Main.DateEditToDate(DateDoME.Text) + ''')');
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

procedure EditIPSotr;
begin
  with Form_DM.QEdit.SQL do
   begin
    Clear;
    Add('UPDATE IPSOTR SET ');

    Add('IDIP=''' + VarToStr(Form_DM.QPC.FieldValues['ID']) + ''',');

    Form_DM.QSotr.First;
    Form_DM.QSotr.MoveBy(FIOCB.ItemIndex);

    Add('IDSOTR=''' + VarToStr(Form_DM.QSotr.FieldValues['ID']) + ''',');
    Add('DATEOT=''' + Form_Main.DateEditToDate(DateOtME.Text) + ''',');
    Add('DATEDO=''' + Form_Main.DateEditToDate(DateDoME.Text) + '''');
    Add('WHERE(ID=' + VarToStr(Form_DM.QIPSotr.FieldValues['ID']) + ')');
   end;
  try
   Form_DM.QEdit.ExecSQL;
   Form_DM.QIPSotr.Refresh;
   SGSotr.Cells[1, SGSotrRow] := VarToStr(Form_DM.QIPSotr.FieldValues['FIO']);
   SGSotr.Cells[2, SGSotrRow] := VarToStr(Form_DM.QIPSotr.FieldValues['DATEOT']);
   SGSotr.Cells[3, SGSotrRow] := VarToStr(Form_DM.QIPSotr.FieldValues['DATEDO']);
  except
   on Exception do
    begin
     Application.MessageBox('Не удалось сохранить!' + #13 + 'Попробуйте позже.',
                            'Ошибка сохранения', MB_OK + MB_ICONERROR);
    end;
  end;
end;

begin
  if (FIOCB.ItemIndex = -1)or(DateOtME.Text = '') then
  else
   begin
    if (SGSotr.Tag = 0) then
     AddIPSotr
    else
     EditIPSotr;
   end;
end;

procedure TForm_IP.BitCancelSotrClick(Sender: TObject);
begin
  SGSotr.Tag := 0;
  FIOCB.ItemIndex := -1;
  DateOtME.Clear;
  DateDoME.Clear;
end;

end.
