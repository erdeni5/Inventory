unit Unit_Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExcelXP, Buttons, ActiveX, ComObj;

type
  TForm_Reports = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    function IsOLEObjectInstalled(Name: String): boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Reports: TForm_Reports;

implementation

uses Unit_DM, Unit_Progress;

{$R *.dfm}

function TForm_Reports.IsOLEObjectInstalled(Name: String): boolean;
var
  ClassID: TCLSID;
  Rez : HRESULT;
begin
  // ���� CLSID OLE-�������
  Rez := CLSIDFromProgID(PWideChar(WideString(Name)), ClassID);
  // ������ ������
  if Rez = S_OK then
    Result := true
  else
    Result := false;
end;

procedure TForm_Reports.BitBtn1Click(Sender: TObject);
var
  ExcelApp, Workbook, Range, Cell1, Cell2, ArrayData : Variant;
  BeginCol, BeginRow, i, j : integer;
  RowCount, ColCount : integer;
begin
  {======================= ������������ ������� ===============================}
  with Form_DM.QReport.SQL do
   begin
    Clear;
    {--------------------------------------------------------------------------}
    Add('SELECT IP AS P1,(SELECT TEXTSMALL FROM SPR WHERE(NOMER=0)AND(KOD=ZDANIE))AS P2');
    Add(',MESTO AS P3,(SELECT TEXTSMALL FROM SPR WHERE(NOMER=1)AND(KOD=IP.TIP))AS P4');
    Add(',T1.MARKA AS P5,T1.MODEL AS P6,T1.SN AS P7,T1.INV AS P8,T1.CPU AS P9');
    Add(',T2.MARKA AS P10,T2.MODEL AS P11,T2.SN AS P12,T2.INV AS P13');
    Add(',T3.MARKA AS P14,T3.MODEL AS P15,T3.SN AS P16,T3.INV AS P17');
    Add(',T4.MARKA AS P18,T4.MODEL AS P19,T4.SN AS P20,T4.INV AS P21');
    Add(',IDSB,IDMONITOR,IDUPS,IDPRINTER,IDOTHER ');
    Add('FROM');
    Add('(((IP LEFT JOIN (SELECT*FROM SB AS T1) T1 ON IP.IDSB=T1.ID)');
    Add('LEFT JOIN (SELECT*FROM MONITOR AS T2) T2 ON IP.IDMONITOR=T2.ID)');
    Add('LEFT JOIN (SELECT*FROM UPS AS T3) T3 ON IP.IDUPS=T3.ID)');
    Add('LEFT JOIN (SELECT*FROM PRINTER AS T4) T4 ON IP.IDPRINTER=T4.ID');
    {--------------------------------------------------------------------------}
   end;
  Form_DM.QReport.Open;
  {============================================================================}
  if (Form_DM.QReport.IsEmpty) then
   Application.MessageBox('��� ������', '��� ������', MB_OK + MB_ICONINFORMATION)
  else
   begin
    // ��������� ���������� �� MS Excel
    if not(IsOLEObjectInstalled('Excel.Application')) then
     Application.MessageBox('MS Excel �� ����������!', '', MB_OK + MB_ICONWARNING)
    else
     begin
      {===================== ��������� ������ � MS Excel ======================}
      // ���������� ������ �������� ���� �������, � ������� ����� �������� ������
      BeginCol := 1;
      BeginRow := 2;

      // ������� ���������� ������� ������
      RowCount := Form_DM.QReport.RecordCount;
      ColCount := 22;

      // �������� Excel
      ExcelApp := CreateOleObject('Excel.Application');

      // ��������� ������� Excel �� �������, ����� �������� ����� ����������
      ExcelApp.Application.EnableEvents := false;

      // ������� ����� (Workbook)
      // ���� ��������� ������, ��
      Workbook := ExcelApp.WorkBooks.Add(ExtractFilePath(Application.ExeName) + '\Shablon01.xlt');
      // ������ ���
      WorkBook.WorkSheets[1].Name := DateToStr(Now);

      // ������� ���������� ������, ������� �������� ��������� �������
      ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);

      Application.CreateForm(TForm_Progress, Form_Progress);
      try
       Form_Progress.Caption := '���� ������������ ������';
       Form_Progress.Gauge1.MaxValue := Form_DM.QReport.RecordCount;
       Form_Progress.Gauge1.Progress := 0;
       Form_Progress.Show;

       // ��������� ������
       Form_DM.QReport.First;
       for i := 1 to RowCount do
        begin
         Application.ProcessMessages;

         ArrayData[i, 1] := IntToStr(i);
         WorkBook.WorkSheets[1].Cells[i + BeginRow - 1, 1].Borders.LineStyle := xlContinuous; // ���������� ������ ������

         for j := 1 to 21 do
          begin
           ArrayData[i, j + 1] := VarToStr(Form_DM.QReport.FieldValues['P' + IntToStr(j)]);
           WorkBook.WorkSheets[1].Cells[i + BeginRow - 1, j + 1].Borders.LineStyle := xlContinuous; // ���������� ������ ������
          end;

         Form_DM.QReport.Next;
         Application.ProcessMessages;
         Form_Progress.Gauge1.Progress := Form_Progress.Gauge1.Progress + 1;
        end;
      finally
       FreeAndNil(Form_Progress);
      end;

      // ����� ������� ������ �������, � ������� ����� �������� ������
      Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];
      // ������ ������ ������ �������, � ������� ����� �������� ������
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow  + RowCount - 1, BeginCol + ColCount - 1];

      // �������, � ������� ����� �������� ������
      Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];

      // � ��� � ��� ����� ������
      // ������� ������� ����������� ����������
      Range.Value := ArrayData;

      // ������ Excel �������
      ExcelApp.Visible := true;
     end;
   end;
end;

procedure TForm_Reports.BitBtn2Click(Sender: TObject);
var
  ExcelApp, Workbook, Range, Cell1, Cell2, ArrayData : Variant;
  BeginCol, BeginRow, i, j : integer;
  RowCount, ColCount : integer;
begin
  {======================= ������������ ������� ===============================}
  with Form_DM.QReport.SQL do
   begin
    Clear;
    {--------------------------------------------------------------------------}
    Add('SELECT ''��-''+(SELECT TEXTSMALL FROM SPR WHERE(NOMER=2)AND(KOD=TIP))AS P1,');
    Add('(SELECT(SELECT TEXTSMALL FROM SPR WHERE(NOMER=0)AND(KOD=ZDANIE)) FROM IP WHERE(IDSB=SB.ID))AS P2,');
    Add('(SELECT MESTO FROM IP WHERE(IDSB=SB.ID))AS P3,MARKA AS P4,MODEL AS P5,SN AS P6,INV AS P7 FROM SB');
    Add('UNION ALL');
    Add('SELECT ''�������''AS P1,');
    Add('(SELECT(SELECT TEXTSMALL FROM SPR WHERE(NOMER=0)AND(KOD=ZDANIE)) FROM IP WHERE(IDMONITOR=MONITOR.ID))AS P2,');
    Add('(SELECT MESTO FROM IP WHERE(IDMONITOR=MONITOR.ID))AS P3,MARKA AS P4,MODEL AS P5,SN AS P6,INV AS P7 FROM MONITOR');
    Add('UNION ALL');
    Add('SELECT ''�������''AS P1,');
    Add('(SELECT(SELECT TEXTSMALL FROM SPR WHERE(NOMER=0)AND(KOD=ZDANIE)) FROM IP WHERE(IDPRINTER=PRINTER.ID))AS P2,');
    Add('(SELECT MESTO FROM IP WHERE(IDPRINTER=PRINTER.ID))AS P3,MARKA AS P4,MODEL AS P5,SN AS P6,INV AS P7 FROM PRINTER');
    Add('UNION ALL');
    Add('SELECT ''���''AS P1,');
    Add('(SELECT(SELECT TEXTSMALL FROM SPR WHERE(NOMER=0)AND(KOD=ZDANIE)) FROM IP WHERE(IDUPS=UPS.ID))AS P2,');
    Add('(SELECT MESTO FROM IP WHERE(IDUPS=UPS.ID))AS P3,MARKA AS P4,MODEL AS P5,SN AS P6,INV AS P7 FROM UPS');
    {--------------------------------------------------------------------------}
   end;
  Form_DM.QReport.Open;
  {============================================================================}
  if (Form_DM.QReport.IsEmpty) then
   Application.MessageBox('��� ������', '��� ������', MB_OK + MB_ICONINFORMATION)
  else
   begin
    // ��������� ���������� �� MS Excel
    if not(IsOLEObjectInstalled('Excel.Application')) then
     Application.MessageBox('MS Excel �� ����������!', '', MB_OK + MB_ICONWARNING)
    else
     begin
      {===================== ��������� ������ � MS Excel ======================}
      // ���������� ������ �������� ���� �������, � ������� ����� �������� ������
      BeginCol := 1;
      BeginRow := 2;

      // ������� ���������� ������� ������
      RowCount := Form_DM.QReport.RecordCount;
      ColCount := 8;

      // �������� Excel
      ExcelApp := CreateOleObject('Excel.Application');

      // ��������� ������� Excel �� �������, ����� �������� ����� ����������
      ExcelApp.Application.EnableEvents := false;

      // ������� ����� (Workbook)
      // ���� ��������� ������, ��
      Workbook := ExcelApp.WorkBooks.Add(ExtractFilePath(Application.ExeName) + '\Shablon02.xlt');
      // ������ ���
      WorkBook.WorkSheets[1].Name := DateToStr(Now);

      // ������� ���������� ������, ������� �������� ��������� �������
      ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);

      Application.CreateForm(TForm_Progress, Form_Progress);
      try
       Form_Progress.Caption := '���� ������������ ������';
       Form_Progress.Gauge1.MaxValue := Form_DM.QReport.RecordCount;
       Form_Progress.Gauge1.Progress := 0;
       Form_Progress.Show;

       // ��������� ������
       Form_DM.QReport.First;
       for i := 1 to RowCount do
        begin
         Application.ProcessMessages;

         ArrayData[i, 1] := IntToStr(i);
         WorkBook.WorkSheets[1].Cells[i + BeginRow - 1, 1].Borders.LineStyle := xlContinuous; // ���������� ������ ������

         for j := 1 to 7 do
          begin
           ArrayData[i, j + 1] := VarToStr(Form_DM.QReport.FieldValues['P' + IntToStr(j)]);
           WorkBook.WorkSheets[1].Cells[i + BeginRow - 1, j + 1].Borders.LineStyle := xlContinuous; // ���������� ������ ������
          end;

         Form_DM.QReport.Next;
         Application.ProcessMessages;
         Form_Progress.Gauge1.Progress := Form_Progress.Gauge1.Progress + 1;
        end;
      finally
       FreeAndNil(Form_Progress);
      end;

      // ����� ������� ������ �������, � ������� ����� �������� ������
      Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];
      // ������ ������ ������ �������, � ������� ����� �������� ������
      Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow  + RowCount - 1, BeginCol + ColCount - 1];

      // �������, � ������� ����� �������� ������
      Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];

      // � ��� � ��� ����� ������
      // ������� ������� ����������� ����������
      Range.Value := ArrayData;

      // ������ Excel �������
      ExcelApp.Visible := true;
     end;
   end;
end;

end.
