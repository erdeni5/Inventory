unit Unit_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, Menus, ComCtrls, ToolWin, Grids, DBGrids, StdCtrls, DB, ADODB,
  Buttons, ExtCtrls, ImgList, Mask;

type
  TForm_Main = class(TForm)
    XPManifest1: TXPManifest;
    MM: TMainMenu;
    SB: TStatusBar;
    MMFile: TMenuItem;
    TB: TToolBar;
    BitIP: TBitBtn;
    BitSB: TBitBtn;
    SG: TStringGrid;
    BitAdd: TBitBtn;
    BitMonitor: TBitBtn;
    BitPrinter: TBitBtn;
    BitUPS: TBitBtn;
    MMExit: TMenuItem;
    MMReport: TMenuItem;
    MMReports: TMenuItem;
    Bevel1: TBevel;
    Image1: TImage;
    Image2: TImage;
    ILMM: TImageList;
    BitOther: TBitBtn;
    Bevel2: TBevel;
    Bevel3: TBevel;
    BitSort: TBitBtn;
    function NoRecord(NR : String): String;
    function DateToEdit(D: String): String;
    function DateEditToDate(D: String): String;
    procedure ADOSQL(TempQ : TADOQuery; Base : String; StrField : String);
    procedure ValidDate(TempMask: TMaskEdit; S: String);
    procedure BitIPClick(Sender: TObject);
    procedure BitSBClick(Sender: TObject);
    procedure SGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGDblClick(Sender: TObject);
    procedure BitAddClick(Sender: TObject);
    procedure BitMonitorClick(Sender: TObject);
    procedure BitPrinterClick(Sender: TObject);
    procedure BitUPSClick(Sender: TObject);
    procedure MMExitClick(Sender: TObject);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure MMReportsClick(Sender: TObject);
    procedure SGMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitSortClick(Sender: TObject);
  private
    { Private declarations }
    procedure BitEnable(EnableFalse: Smallint);
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;
  SGRow : integer;
  IPOrderBy : String = 'ZDANIE,MESTO,IP';

implementation

uses Unit_DM, Unit_SB, Unit_Monitor, Unit_Printer, Unit_UPS, Unit_ARM,
  Unit_IP, Unit_Reports, Unit_Sotr;

{$R *.dfm}

procedure TForm_Main.BitEnable(EnableFalse: Smallint);
begin
  SG.Tag := EnableFalse;
  BitIP.Enabled := true;
  BitSB.Enabled := true;
  BitMonitor.Enabled := true;
  BitPrinter.Enabled := true;
  BitUPS.Enabled := true;

  BitSort.Enabled := true;
  case EnableFalse of
   0 : BitIP.Enabled := false;
   1 : BitSB.Enabled := false;
   2 : BitMonitor.Enabled := false;
   3 : BitPrinter.Enabled := false;
   4 : BitUPS.Enabled := false;

   6 : BitSort.Enabled := false;
  end;
end;

function TForm_Main.NoRecord(NR : String): String;
begin
 Result := NR;
  if (NR = '')or(NR = '0') then
   Result := 'ОТСУТСТВУЕТ';
end;

function TForm_Main.DateToEdit(D: String): String;
begin
  if (D <> '') then
   Result := Copy(D, 1, 2) + Copy(D, 4, 2) + Copy(D, 7, 4)
  else
   Result := '';
end;

function TForm_Main.DateEditToDate(D: String): String;
begin
  if (D <> '') then
   Result := Copy(D, 1, 2) + '.' + Copy(D, 3, 2) + '.' + Copy(D, 5, 4)
  else
   Result := '';
end;

procedure TForm_Main.ADOSQL(TempQ : TADOQuery; Base : String; StrField : String);
begin
  TempQ.SQL.Clear;
  TempQ.SQL.Add('SELECT * FROM ' + Base + '');
  TempQ.SQL.Add('ORDER BY ' + StrField);
  TempQ.Open;
end;

// Проверка даты на правильность
procedure TForm_Main.ValidDate(TempMask: TMaskEdit; S: String);
begin
  if (Length(S) = 8)and(Pos(' ', S) = 0) then
   begin
    S := copy(S, 1, 2) + '.' + copy(S, 3, 2) + '.' + copy(S, 5, 4);
    try
      StrToDate(S);
    except
      on EConvertError do
       begin
        Application.MessageBox('Проверьте дату!',
                               'Неправильный формат даты',
                                MB_OK + MB_ICONERROR);
        TempMask.Clear;
        TempMask.Color := clWindow;
        TempMask.SetFocus;
       end;
    end;
   end
  else
   begin
    Application.MessageBox('Проверьте дату!',
                           'Неправильный формат даты',
                            MB_OK + MB_ICONERROR);
    TempMask.Clear;
    TempMask.Color := clWindow;
    TempMask.SetFocus;
   end;
end;

procedure TForm_Main.BitIPClick(Sender: TObject);
var
  i, j : integer;
begin
  BitEnable(0);

  SG.Enabled := false;

  for i := 1 to SG.ColCount do
   for j := 1 to SG.RowCount do
    SG.Cells[i, j] := '';

  Form_DM.QPC.SQL.Text := 'SELECT*FROM(SELECT ID,IP,ZDANIE,(SELECT TEXTSMALL FROM SPR WHERE(NOMER=0)AND(KOD=ZDANIE))AS ZDANIETEXT,' +
                                    'MESTO,TIP,(SELECT TEXTSMALL FROM SPR WHERE(NOMER=1)AND(KOD=TIP))AS TIPTEXT,' +
                                    '(SELECT INV FROM SB WHERE(ID=IDSB))AS IDSBTEXT,IDSB,' +
                                    '(SELECT INV FROM MONITOR WHERE(ID=IDMONITOR))AS IDMONITORTEXT,IDMONITOR,' +
                                    '(SELECT INV FROM UPS WHERE(ID=IDUPS))AS IDUPSTEXT,IDUPS,' +
                                    '(SELECT INV FROM PRINTER WHERE(ID=IDPRINTER))AS IDPRINTERTEXT,IDPRINTER,' +
                                    'IDOTHER FROM IP) ORDER BY ' + IPOrderBy;

  Form_DM.QPC.Open;
  if (Form_DM.QPC.IsEmpty) then
   Application.MessageBox('Нет данных для отображения', 'Потверждение загрузки', MB_OK + MB_ICONQUESTION)
  else
   begin
    Form_DM.QPC.First;
    if (Form_DM.QPC.FieldValues['TIP'] < 2) then
     SG.ColCount := 9
    else
     SG.ColCount := 6;
    SG.RowCount := Form_DM.QPC.RecordCount + 1;

    SG.ColWidths[0] := 40;
    SG.ColWidths[1] := 100;
    SG.ColWidths[2] := 80;
    SG.ColWidths[3] := 150;
    SG.ColWidths[4] := 50;
    SG.ColWidths[5] := 85;
    if (Form_DM.QPC.FieldValues['TIP'] < 2) then
     begin
      SG.ColWidths[6] := 85;
      SG.ColWidths[7] := 85;
      SG.ColWidths[8] := 85;
     end;

    SG.Cells[0, 0] := '№ п/п';
    SG.Cells[1, 0] := 'IP-адрес';
    SG.Cells[2, 0] := 'Здание';
    SG.Cells[3, 0] := 'Место';
    SG.Cells[4, 0] := 'Тип';
    if (Form_DM.QPC.FieldValues['TIP'] < 2) then
     begin
      SG.Cells[5, 0] := 'Системный блок';
      SG.Cells[6, 0] := 'Монитор';
      SG.Cells[7, 0] := 'ИБП';
      SG.Cells[8, 0] := 'Принтер';
     end
    else
     SG.Cells[5, 0] := 'Инвентарный';

    for i := 1 to Form_DM.QPC.RecordCount do
     begin
      SG.Cells[0, i] := IntToStr(i);
      SG.Cells[1, i] := Form_DM.QPC.FieldValues['IP'];
      SG.Cells[2, i] := VarToStr(Form_DM.QPC.FieldValues['ZDANIETEXT']);
      SG.Cells[3, i] := VarToStr(Form_DM.QPC.FieldValues['MESTO']);
      SG.Cells[4, i] := VarToStr(Form_DM.QPC.FieldValues['TIPTEXT']);
      if (Form_DM.QPC.FieldValues['TIP'] < 2) then
       begin
        // Системный блок
        if (Form_DM.QPC.FieldValues['IDSB'] > 0) then
         begin
          ADOSQL(Form_DM.QHelp, 'SB WHERE ID=' + VarToStr(Form_DM.QPC.FieldValues['IDSB']), 'ID');
          SG.Cells[5, i] := Form_DM.QHelp.FieldValues['INV'];
         end
        else
         SG.Cells[5, i] := 'НЕ ВЫБРАН';
        // Монитор
        if (Form_DM.QPC.FieldValues['IDMONITOR'] > 0) then
         begin
          ADOSQL(Form_DM.QHelp, 'MONITOR WHERE ID=' + VarToStr(Form_DM.QPC.FieldValues['IDMONITOR']), 'ID');
          SG.Cells[6, i] := Form_DM.QHelp.FieldValues['INV'];
         end
        else
         SG.Cells[6, i] := 'НЕ ВЫБРАН';
        // ИБП
        if (Form_DM.QPC.FieldValues['IDUPS'] > 0) then
         begin
          ADOSQL(Form_DM.QHelp, 'UPS WHERE ID=' + VarToStr(Form_DM.QPC.FieldValues['IDUPS']), 'ID');
          SG.Cells[7, i] := Form_DM.QHelp.FieldValues['INV'];
         end
        else
         SG.Cells[7, i] := 'НЕ ВЫБРАН';
         // Принтер
        if (Form_DM.QPC.FieldValues['IDPRINTER'] > 0) then
         begin
          ADOSQL(Form_DM.QHelp, 'PRINTER WHERE ID=' + VarToStr(Form_DM.QPC.FieldValues['IDPRINTER']), 'ID');
          SG.Cells[8, i] := Form_DM.QHelp.FieldValues['INV'];
         end
        else
         SG.Cells[8, i] := 'НЕ ВЫБРАН';
       end
      else
       SG.Cells[5, i] := VarToStr(Form_DM.QPC.FieldValues['IDOTHER']);
      Form_DM.QPC.Next;
     end;
   end;

  SG.Enabled := true;
  SG.SetFocus;
end;

procedure TForm_Main.BitSBClick(Sender: TObject);
var
  i, j : integer;
begin
  BitEnable(1);

  SG.Enabled := false;

  for i := 1 to SG.ColCount do
   for j := 1 to SG.RowCount do
    SG.Cells[i, j] := '';

  Form_DM.QPC.SQL.Text := 'SELECT *,(SELECT TEXTSMALL FROM SPR WHERE(NOMER=2)AND(KOD=TIP))AS T,' +
                                   '(SELECT ID FROM IP WHERE(IDSB=SB.ID))AS C FROM SB ORDER BY ID';

  Form_DM.QPC.Open;
  if (Form_DM.QPC.IsEmpty) then
   Application.MessageBox('Нет данных для отображения', 'Потверждение загрузки', MB_OK + MB_ICONQUESTION)
  else
   begin
    Form_DM.QPC.First;

    SG.ColCount := 8;
    SG.RowCount := Form_DM.QPC.RecordCount + 1;

    SG.ColWidths[0] := 50;
    SG.ColWidths[1] := 25;
    SG.ColWidths[2] := 75;
    SG.ColWidths[3] := 100;
    SG.ColWidths[4] := 100;
    SG.ColWidths[5] := 100;
    SG.ColWidths[6] := 100;
    SG.ColWidths[7] := 200;


    SG.Cells[0, 0] := '№ п/п';
    SG.Cells[1, 0] := 'IP';
    SG.Cells[2, 0] := 'Тип';
    SG.Cells[3, 0] := 'Марка';
    SG.Cells[4, 0] := 'Модель';
    SG.Cells[5, 0] := 'С/Н';
    SG.Cells[6, 0] := 'И/Н';
    SG.Cells[7, 0] := 'Процессор';

    for i := 1 to Form_DM.QPC.RecordCount do
     begin
      SG.Cells[0, i] := IntToStr(i);
      SG.Cells[1, i] := VarToStr(Form_DM.QPC.FieldValues['C']);
      SG.Cells[2, i] := Form_DM.QPC.FieldValues['T'];
      SG.Cells[3, i] := Form_DM.QPC.FieldValues['MARKA'];
      SG.Cells[4, i] := Form_DM.QPC.FieldValues['MODEL'];
      SG.Cells[5, i] := Form_DM.QPC.FieldValues['SN'];
      SG.Cells[6, i] := Form_DM.QPC.FieldValues['INV'];
      SG.Cells[7, i] := Form_DM.QPC.FieldValues['CPU'];
      Form_DM.QPC.Next;
     end;
   end;

  SG.Enabled := true;
  SG.SetFocus;
end;

procedure TForm_Main.SGSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  SGRow := ARow;
end;

procedure TForm_Main.SGDblClick(Sender: TObject);

procedure EditIP;
var
  i : integer;
begin
  Application.CreateForm(TForm_IP, Form_IP);
  try
   with Form_IP do
    begin
     Tag := 1;
     Caption := 'Редактирование IP-адреса';
     Form_DM.QPC.First;
     Form_DM.QPC.MoveBy(SGRow - 1);

     IdEdit.Text := Form_DM.QPC.FieldValues['ID'];
     IP1Edit.Text := copy(Form_DM.QPC.FieldValues['IP'], 1, 3);
     IP2Edit.Text := copy(Form_DM.QPC.FieldValues['IP'], 5, 3);
     IP3Edit.Text := copy(Form_DM.QPC.FieldValues['IP'], 9, 3);
     IP4Edit.Text := copy(Form_DM.QPC.FieldValues['IP'], 13, 3);
     ZdanieCB.ItemIndex := Form_DM.QPC.FieldValues['ZDANIE'];
     MestoEdit.Text := Form_DM.QPC.FieldValues['MESTO'];
     TipEdit.Tag := Form_DM.QPC.FieldValues['TIP'];
     TipEdit.Text := Form_DM.QPC.FieldValues['TIPTEXT'];
     if (Form_DM.QPC.FieldValues['TIP'] < 2) then
      begin
       GBARM.Show;
       GBIdOther.Hide;
       GBSotr.Show;
       // Системный блок
       IdSBEdit.Tag := Form_DM.QPC.FieldValues['IDSB'];
       if (Form_DM.QPC.FieldValues['IDSB'] > 0) then
        begin
         Form_DM.QHelp.SQL.Text := 'SELECT ID,(SELECT TEXTSMALL FROM SPR WHERE(NOMER=2)AND(KOD=TIP))AS T,MARKA,MODEL,INV ' +
                                   'FROM SB WHERE ID=' + VarToStr(Form_DM.QPC.FieldValues['IDSB']);
         Form_DM.QHelp.Open;
         IdSBEdit.Text := 'Тип-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['T'])) +
                        ', Марка-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['MARKA'])) +
                        ', Модель-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['MODEL'])) +
                        ', И/Н-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['INV']));
        end
       else
        IdSBEdit.Text := 'Системный блок не выбран';
       // Монитор
       IdMonitorEdit.Tag := Form_DM.QPC.FieldValues['IDMONITOR'];
       if (Form_DM.QPC.FieldValues['IDMONITOR'] > 0) then
        begin
         ADOSQL(Form_DM.QHelp, 'MONITOR WHERE ID=' + VarToStr(Form_DM.QPC.FieldValues['IDMONITOR']),'ID');
         IdMonitorEdit.Text := 'Марка-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['MARKA'])) +
                              ',Модель-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['MODEL'])) +
                              ',И/Н-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['INV']));
        end
       else
        IdMonitorEdit.Text := 'Монитор не выбран';
       // ИБП
       IdUPSEdit.Tag := Form_DM.QPC.FieldValues['IDUPS'];
       if (Form_DM.QPC.FieldValues['IDUPS'] > 0) then
        begin
         ADOSQL(Form_DM.QHelp, 'UPS WHERE ID=' + VarToStr(Form_DM.QPC.FieldValues['IDUPS']),'ID');
         IdUPSEdit.Text := 'Марка-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['MARKA'])) +
                          ',Модель-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['MODEL'])) +
                          ',И/Н-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['INV']));
        end
       else
        IdUPSEdit.Text := 'ИБП не выбран';
       // Принтер
       IdPrinterEdit.Tag := Form_DM.QPC.FieldValues['IDPRINTER'];
       if (Form_DM.QPC.FieldValues['IDPRINTER'] > 0) then
        begin
         ADOSQL(Form_DM.QHelp, 'UPS WHERE ID=' + VarToStr(Form_DM.QPC.FieldValues['IDPRINTER']),'ID');
         IdPrinterEdit.Text := 'Марка-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['MARKA'])) +
                              ',Модель-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['MODEL'])) +
                              ',И/Н-' + NoRecord(VarToStr(Form_DM.QHelp.FieldValues['INV']));
        end
       else
        IdPrinterEdit.Text := 'Принтер не выбран';
       // Данные сотрудников
       SGSotr.ColWidths[0] := 50;
       SGSotr.ColWidths[1] := 350;
       SGSotr.ColWidths[2] := 100;
       SGSotr.ColWidths[3] := 100;

       SGSotr.Cells[0, 0] := '№ п/п';
       SGSotr.Cells[1, 0] := 'Сотрудник';
       SGSotr.Cells[2, 0] := 'Дата начала';
       SGSotr.Cells[3, 0] := 'Дата окончания';

       Form_DM.QSotr.SQL.Text := 'SELECT*,(FAM+'' ''+IMJ+'' ''+OTCH+'', ''+DOLZH)AS FIO FROM SOTR';
       Form_DM.QSotr.Open;

       for i := 1 to Form_DM.QSotr.RecordCount do
        begin
         FIOCB.Items.Add(VarToStr(Form_DM.QSotr.FieldValues['FIO']));
         Form_DM.QSotr.Next;
        end;

       Form_DM.QIPSotr.SQL.Clear;
       Form_DM.QIPSotr.SQL.Add('SELECT*,(SELECT FAM+'' ''+IMJ+'' ''+OTCH+'', ''+DOLZH AS FIO');
       Form_DM.QIPSotr.SQL.Add('FROM SOTR WHERE(ID=IDSOTR))AS FIO FROM IPSOTR');
       Form_DM.QIPSotr.SQL.Add('WHERE IDIP=' + VarToStr(Form_DM.QPC.FieldValues['ID']));
       Form_DM.QIPSotr.Open;
       if (Form_DM.QIPSotr.IsEmpty) then
       else
        begin
         for i := 1 to Form_DM.QIPSotr.RecordCount do
          begin
           SGSotr.Cells[0, i] := IntToStr(i);
           SGSotr.Cells[1, i] := VarToStr(Form_DM.QIPSotr.FieldValues['FIO']);
           SGSotr.Cells[2, i] := VarToStr(Form_DM.QIPSotr.FieldValues['DATEOT']);
           SGSotr.Cells[3, i] := VarToStr(Form_DM.QIPSotr.FieldValues['DATEDO']);
           Form_DM.QIPSotr.Next;
          end;
        end;
      end
     else
      begin
       GBARM.Hide;
       GBIdOther.Show;
       GBSotr.Hide;
      end;

     ShowModal;
    end;
  finally
   BitIPClick(Sender);
   FreeAndNil(Form_IP);
  end;
end;

procedure EditSB;
var
  i : integer;
begin
  Application.CreateForm(TForm_SB, Form_SB);
  try
   with Form_SB do
    begin
     Tag := 1;
     Caption := 'Редактирование системного блока';
     Form_DM.QPC.First;
     Form_DM.QPC.MoveBy(SGRow - 1);

     IdEdit.Text := Form_DM.QPC.FieldValues['ID'];
     ADOSQL(Form_DM.QHelp, 'SPR WHERE(NOMER=2)', 'KOD');
     for i := 1 to Form_DM.QHelp.RecordCount do
      begin
       TipCB.Items.Add(Form_DM.QHelp.FieldValues['TEXTSMALL']);
       Form_DM.QHelp.Next;
      end;
     TipCB.ItemIndex := Form_DM.QPC.FieldValues['TIP'];
     MarkaEdit.Text := Form_DM.QPC.FieldValues['MARKA'];
     ModelEdit.Text := Form_DM.QPC.FieldValues['MODEL'];
     SNEdit.Text := Form_DM.QPC.FieldValues['SN'];
     InvEdit.Text := Form_DM.QPC.FieldValues['INV'];
     CPUEdit.Text := Form_DM.QPC.FieldValues['CPU'];
     OSCB.Text := Form_DM.QPC.FieldValues['OS'];
     OSKeyEdit.Text := Form_DM.QPC.FieldValues['OSKEY'];
     LicenseCB.Text := Form_DM.QPC.FieldValues['LICENSE'];
     VipNetEdit.Text := Form_DM.QPC.FieldValues['VIPNET'];
     MISCB.Text := Form_DM.QPC.FieldValues['MIS'];

     ShowModal;
    end;
  finally
   BitSBClick(Sender);
   FreeAndNil(Form_SB);
  end;
end;

procedure EditMonitor;
begin
  Application.CreateForm(TForm_Monitor, Form_Monitor);
  try
   with Form_Monitor do
    begin
     Tag := 1;
     Caption := 'Редактирование монитора';
     Form_DM.QPC.First;
     Form_DM.QPC.MoveBy(SGRow - 1);

     IdEdit.Text := Form_DM.QPC.FieldValues['ID'];
     MarkaEdit.Text := Form_DM.QPC.FieldValues['MARKA'];
     ModelEdit.Text := Form_DM.QPC.FieldValues['MODEL'];
     SNEdit.Text := Form_DM.QPC.FieldValues['SN'];
     InvEdit.Text := Form_DM.QPC.FieldValues['INV'];

     ShowModal;
    end;
  finally
   BitMonitorClick(Sender);
   FreeAndNil(Form_Monitor);
  end;
end;

 procedure EditPrinter;
begin
  Application.CreateForm(TForm_Printer, Form_Printer);
  try
   with Form_Printer do
    begin
     Tag := 1;
     Caption := 'Редактирование монитора';
     Form_DM.QPC.First;
     Form_DM.QPC.MoveBy(SGRow - 1);

     IdEdit.Text := Form_DM.QPC.FieldValues['ID'];
     MarkaEdit.Text := Form_DM.QPC.FieldValues['MARKA'];
     ModelEdit.Text := Form_DM.QPC.FieldValues['MODEL'];
     SNEdit.Text := Form_DM.QPC.FieldValues['SN'];
     InvEdit.Text := Form_DM.QPC.FieldValues['INV'];

     ShowModal;
    end;
  finally
   BitPrinterClick(Sender);
   FreeAndNil(Form_Printer);
  end;
end;

procedure EditUPS;
begin
  Application.CreateForm(TForm_UPS, Form_UPS);
  try
   with Form_UPS do
    begin
     Tag := 1;
     Caption := 'Редактирование монитора';
     Form_DM.QPC.First;
     Form_DM.QPC.MoveBy(SGRow - 1);

     IdEdit.Text := Form_DM.QPC.FieldValues['ID'];
     MarkaEdit.Text := Form_DM.QPC.FieldValues['MARKA'];
     ModelEdit.Text := Form_DM.QPC.FieldValues['MODEL'];
     SNEdit.Text := Form_DM.QPC.FieldValues['SN'];
     InvEdit.Text := Form_DM.QPC.FieldValues['INV'];

     ShowModal;
    end;
  finally
   BitUPSClick(Sender);
   FreeAndNil(Form_UPS);
  end;
end;

procedure EditSotr;
begin
  Application.CreateForm(TForm_Sotr, Form_Sotr);
  try
   with Form_Sotr do
    begin
     Tag := Form_DM.QPC.FieldValues['ID'];
     Caption := 'Редактирование сотрудника';
     Form_DM.QPC.First;
     Form_DM.QPC.MoveBy(SGRow - 1);

     IdEdit.Text := Form_DM.QPC.FieldValues['ID'];
     FamEdit.Text := Form_DM.QPC.FieldValues['FAM'];
     ImjEdit.Text := Form_DM.QPC.FieldValues['IMJ'];
     OtchEdit.Text := Form_DM.QPC.FieldValues['OTCH'];
     TipCB.ItemIndex := TipCB.Items.IndexOf(Form_DM.QPC.FieldValues['TIP']);
     DolzhEdit.Text := Form_DM.QPC.FieldValues['DOLZH'];

     ShowModal;
    end;
  finally
   BitSortClick(Sender);
   FreeAndNil(Form_Sotr);
  end;
end;

begin
  case (SG.Tag) of
   0 : EditIP;
   1 : EditSB;
   2 : EditMonitor;
   3 : EditPrinter;
   4 : EditUPS;

   6 : EditSotr;
  end;
end;

procedure TForm_Main.BitAddClick(Sender: TObject);

procedure AddIP;
begin
  Application.CreateForm(TForm_IP, Form_IP);
  try
   with Form_IP do
    begin
     Tag := 0;
     Caption := 'Добавление IP-адреса';

     //GBARM.Hide;
     GBIdOther.Hide;
     GBSotr.Hide;
     ShowModal;
    end;
  finally
   BitIPClick(Sender);
   FreeAndNil(Form_IP);
  end;
end;

procedure AddSB;
var
  i : integer;
begin
  Application.CreateForm(TForm_SB, Form_SB);
  try
   with Form_SB do
    begin
     Tag := 0;
     Caption := 'Добавление системного блока';
     ADOSQL(Form_DM.QHelp, 'SPR WHERE(NOMER=2)', 'KOD');
     for i := 1 to Form_DM.QHelp.RecordCount do
      begin
       TipCB.Items.Add(Form_DM.QHelp.FieldValues['TEXTSMALL']);
       Form_DM.QHelp.Next;
      end;
     ShowModal;
    end;
  finally
   BitSBClick(Sender);
   FreeAndNil(Form_SB);
  end;
end;

procedure AddMonitor;
begin
  Application.CreateForm(TForm_Monitor, Form_Monitor);
  try
   with Form_Monitor do
    begin
     Tag := 0;
     Caption := 'Добавление монитора';

     ShowModal;
    end;
  finally
   BitMonitorClick(Sender);
   FreeAndNil(Form_Monitor);
  end;
end;

procedure AddPrinter;
begin
  Application.CreateForm(TForm_Printer, Form_Printer);
  try
   with Form_Printer do
    begin
     Tag := 0;
     Caption := 'Добавление принтера';

     ShowModal;
    end;
  finally
   BitPrinterClick(Sender);
   FreeAndNil(Form_Printer);
  end;
end;

procedure AddUPS;
begin
  Application.CreateForm(TForm_UPS, Form_UPS);
  try
   with Form_UPS do
    begin
     Tag := 0;
     Caption := 'Добавление ИБП';

     ShowModal;
    end;
  finally
   BitUPSClick(Sender);
   FreeAndNil(Form_UPS);
  end;
end;

procedure AddSotr;
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
   BitSortClick(Sender);
   FreeAndNil(Form_Sotr);
  end;
end;

begin
  case (SG.Tag) of
   0 : AddIP;
   1 : AddSB;
   2 : AddMonitor;
   3 : AddPrinter;
   4 : AddUPS;

   6 : AddSotr;
  end;
end;

procedure TForm_Main.BitMonitorClick(Sender: TObject);
var
  i, j : integer;
begin
  BitEnable(2);

  SG.Enabled := false;

  for i := 1 to SG.ColCount do
   for j := 1 to SG.RowCount do
    SG.Cells[i, j] := '';

  Form_DM.QPC.SQL.Text := 'SELECT *,(SELECT ID FROM IP WHERE(IDMONITOR=MONITOR.ID))AS C FROM MONITOR ORDER BY ID';

  Form_DM.QPC.Open;
  if (Form_DM.QPC.IsEmpty) then
   Application.MessageBox('Нет данных для отображения', 'Потверждение загрузки', MB_OK + MB_ICONQUESTION)
  else
   begin
    Form_DM.QPC.First;
    SG.ColCount := 6;
    SG.RowCount := Form_DM.QPC.RecordCount + 1;

    SG.ColWidths[0] := 50;
    SG.ColWidths[1] := 25;
    SG.ColWidths[2] := 150;
    SG.ColWidths[3] := 150;
    SG.ColWidths[4] := 150;
    SG.ColWidths[5] := 100;

    SG.Cells[0, 0] := '№ п/п';
    SG.Cells[1, 0] := 'IP';
    SG.Cells[2, 0] := 'Марка';
    SG.Cells[3, 0] := 'Модель';
    SG.Cells[4, 0] := 'Серийный номер';
    SG.Cells[5, 0] := 'Инвентарный';

    for i := 1 to Form_DM.QPC.RecordCount do
     begin
      SG.Cells[0, i] := IntToStr(i);
      SG.Cells[1, i] := VarToStr(Form_DM.QPC.FieldValues['C']);
      SG.Cells[2, i] := Form_DM.QPC.FieldValues['MARKA'];
      SG.Cells[3, i] := Form_DM.QPC.FieldValues['MODEL'];
      SG.Cells[4, i] := Form_DM.QPC.FieldValues['SN'];
      SG.Cells[5, i] := Form_DM.QPC.FieldValues['INV'];
      Form_DM.QPC.Next;
     end;
   end;

  SG.Enabled := true;
  SG.SetFocus;   
end;

procedure TForm_Main.BitPrinterClick(Sender: TObject);
var
  i, j : integer;
begin
  BitEnable(3);

  SG.Enabled := false;

  for i := 1 to SG.ColCount do
   for j := 1 to SG.RowCount do
    SG.Cells[i, j] := '';

  Form_DM.QPC.SQL.Text := 'SELECT*,(SELECT ID FROM IP WHERE(IDPRINTER=PRINTER.ID))AS C FROM PRINTER ORDER BY ID';

  Form_DM.QPC.Open;
  if (Form_DM.QPC.IsEmpty) then
   Application.MessageBox('Нет данных для отображения', 'Потверждение загрузки', MB_OK + MB_ICONQUESTION)
  else
   begin
    Form_DM.QPC.First;
    SG.ColCount := 6;
    SG.RowCount := Form_DM.QPC.RecordCount + 1;

    SG.ColWidths[0] := 50;
    SG.ColWidths[1] := 25;
    SG.ColWidths[2] := 150;
    SG.ColWidths[3] := 150;
    SG.ColWidths[4] := 150;
    SG.ColWidths[5] := 100;

    SG.Cells[0, 0] := '№ п/п';
    SG.Cells[1, 0] := 'IP';
    SG.Cells[2, 0] := 'Марка';
    SG.Cells[3, 0] := 'Модель';
    SG.Cells[4, 0] := 'Серийный номер';
    SG.Cells[5, 0] := 'Инвентарный';

    for i := 1 to Form_DM.QPC.RecordCount do
     begin
      SG.Cells[0, i] := IntToStr(i);
      SG.Cells[1, i] := VarToStr(Form_DM.QPC.FieldValues['C']);
      SG.Cells[2, i] := Form_DM.QPC.FieldValues['MARKA'];
      SG.Cells[3, i] := Form_DM.QPC.FieldValues['MODEL'];
      SG.Cells[4, i] := Form_DM.QPC.FieldValues['SN'];
      SG.Cells[5, i] := Form_DM.QPC.FieldValues['INV'];
      Form_DM.QPC.Next;
     end;
   end;

  SG.Enabled := true;
  SG.SetFocus;   
end;

procedure TForm_Main.BitUPSClick(Sender: TObject);
var
  i, j : integer;
begin
  BitEnable(4);

  SG.Enabled := false;

  for i := 1 to SG.ColCount do
   for j := 1 to SG.RowCount do
    SG.Cells[i, j] := '';

  Form_DM.QPC.SQL.Text := 'SELECT*,(SELECT ID FROM IP WHERE(IDUPS=UPS.ID))AS C FROM UPS ORDER BY ID';

  Form_DM.QPC.Open;
  if (Form_DM.QPC.IsEmpty) then
   Application.MessageBox('Нет данных для отображения', 'Потверждение загрузки', MB_OK + MB_ICONQUESTION)
  else
   begin
    Form_DM.QPC.First;
    SG.ColCount := 6;
    SG.RowCount := Form_DM.QPC.RecordCount + 1;

    SG.ColWidths[0] := 50;
    SG.ColWidths[1] := 25;
    SG.ColWidths[2] := 150;
    SG.ColWidths[3] := 150;
    SG.ColWidths[4] := 150;
    SG.ColWidths[5] := 100;

    SG.Cells[0, 0] := '№ п/п';
    SG.Cells[1, 0] := 'IP';
    SG.Cells[2, 0] := 'Марка';
    SG.Cells[3, 0] := 'Модель';
    SG.Cells[4, 0] := 'Серийный номер';
    SG.Cells[5, 0] := 'Инвентарный';

    for i := 1 to Form_DM.QPC.RecordCount do
     begin
      SG.Cells[0, i] := IntToStr(i);
      SG.Cells[1, i] := VarToStr(Form_DM.QPC.FieldValues['C']);
      SG.Cells[2, i] := Form_DM.QPC.FieldValues['MARKA'];
      SG.Cells[3, i] := Form_DM.QPC.FieldValues['MODEL'];
      SG.Cells[4, i] := Form_DM.QPC.FieldValues['SN'];
      SG.Cells[5, i] := Form_DM.QPC.FieldValues['INV'];
      Form_DM.QPC.Next;
     end;
   end;

  SG.Enabled := true;
  SG.SetFocus;
end;

procedure TForm_Main.MMExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Main.SGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow = 0) then
   begin
    SG.Canvas.Font.Style := [fsBold];
    SG.Canvas.TextRect(Rect, Rect.Left + (Rect.Right - Rect.Left -
                       SG.Canvas.TextWidth(SG.Cells[ACol, ARow]))div 2,
                       Rect.Top + (Rect.Bottom - Rect.Top -
                       SG.Canvas.TextHeight(SG.Cells[ACol, ARow]))div 2,
                       SG.Cells[ACol, ARow]);
   end;

  case SG.Tag of
   0 : begin
        if (SG.Cells[ACol, ARow] = 'НЕ ВЫБРАН') then
         begin
          SG.Canvas.Font.Color := clRed
         end
        else
         begin
          SG.Canvas.Font.Color := clBlack;
         end;
        SG.Canvas.FillRect(Rect);
        SG.Canvas.TextRect(Rect, Rect.Left + (Rect.Right - Rect.Left -
                           SG.Canvas.TextWidth(SG.Cells[ACol, ARow]))div 2,
                           Rect.Top + (Rect.Bottom - Rect.Top -
                           SG.Canvas.TextHeight(SG.Cells[ACol, ARow]))div 2,
                           SG.Cells[ACol, ARow]);
       end;
   1..4 : begin
        if (SG.Cells[ACol, ARow] = '') then
         begin
          SG.Canvas.Font.Color := clRed
         end
        else
         begin
          SG.Canvas.Font.Color := clBlack;
         end;
        SG.Canvas.FillRect(Rect);

        if (ACol=1)and(ARow > 0) then
         if (SG.Cells[ACol, ARow] <> '') then
          SG.Canvas.Draw(Rect.Left, Rect.Top, Image1.Picture.Graphic)
         else
          SG.Canvas.Draw(Rect.Left, Rect.Top, Image2.Picture.Graphic);
        if (ACol <> 1) then
         SG.Canvas.TextRect(Rect, Rect.Left + (Rect.Right - Rect.Left -
                            SG.Canvas.TextWidth(SG.Cells[ACol, ARow]))div 2,
                            Rect.Top + (Rect.Bottom - Rect.Top -
                            SG.Canvas.TextHeight(SG.Cells[ACol, ARow]))div 2,
                            SG.Cells[ACol, ARow]);
       end;
  end;
end;

procedure TForm_Main.MMReportsClick(Sender: TObject);
begin
  Application.CreateForm(TForm_Reports, Form_Reports);
  try
   with Form_Reports do
    begin
     Tag := 0;
     Caption := 'Отчёты';

     ShowModal;
    end;
  finally
   FreeAndNil(Form_Reports);
  end;
end;

procedure TForm_Main.SGMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow: Integer;
begin
  if (Button = mbLeft)and(SG.Tag = 0) then
   begin
    SG.MouseToCell(X, Y, ACol, ARow);
    if (ARow = 0)and(ACol > 0) then
     begin
      case ACol of
       1 : IPOrderBy := 'IP';
       2 : IPOrderBy := 'ZDANIE,MESTO,IP';
       3 : IPOrderBy := 'MESTO,ZDANIE,IP';
       4 : IPOrderBy := 'TIP,ZDANIE,MESTO,IP';
       5 : IPOrderBy := 'IDSBTEXT,IP';
       6 : IPOrderBy := 'IDMONITORTEXT,IP';
       7 : IPOrderBy := 'IDUPSTEXT,IP';
       8 : IPOrderBy := 'IDPRINTERTEXT,IP';
      end;
      BitIPClick(Sender);
     end;
   end;
end;

procedure TForm_Main.BitSortClick(Sender: TObject);
var
  i, j : integer;
begin
  BitEnable(6);

  SG.Enabled := false;

  for i := 1 to SG.ColCount do
   for j := 1 to SG.RowCount do
    SG.Cells[i, j] := '';

  Form_DM.QPC.SQL.Text := 'SELECT*FROM SOTR ORDER BY FAM,IMJ,OTCH';

  Form_DM.QPC.Open;
  if (Form_DM.QPC.IsEmpty) then
   Application.MessageBox('Нет данных для отображения', 'Потверждение загрузки', MB_OK + MB_ICONQUESTION)
  else
   begin
    Form_DM.QPC.First;
    SG.ColCount := 6;
    SG.RowCount := Form_DM.QPC.RecordCount + 1;

    SG.ColWidths[0] := 50;
    SG.ColWidths[1] := 150;
    SG.ColWidths[2] := 150;
    SG.ColWidths[3] := 150;
    SG.ColWidths[4] := 100;
    SG.ColWidths[5] := 1500;

    SG.Cells[0, 0] := '№ п/п';
    SG.Cells[1, 0] := 'Фамилия';
    SG.Cells[2, 0] := 'Имя';
    SG.Cells[3, 0] := 'Отчество';
    SG.Cells[4, 0] := 'Тип';
    SG.Cells[5, 0] := 'Должность';

    for i := 1 to Form_DM.QPC.RecordCount do
     begin
      SG.Cells[0, i] := IntToStr(i);
      SG.Cells[1, i] := Form_DM.QPC.FieldValues['FAM'];
      SG.Cells[2, i] := Form_DM.QPC.FieldValues['IMJ'];
      SG.Cells[3, i] := Form_DM.QPC.FieldValues['OTCH'];
      SG.Cells[4, i] := Form_DM.QPC.FieldValues['TIP'];
      SG.Cells[5, i] := Form_DM.QPC.FieldValues['DOLZH'];
      Form_DM.QPC.Next;
     end;
   end;

  SG.Enabled := true;
  SG.SetFocus;
end;

end.
