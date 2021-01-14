unit Unit_Of_Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, StdCtrls, Buttons, Grids;

type
  TForm_Of_Search = class(TForm)
    SG: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    SearchEdit: TEdit;
    BitOk: TBitBtn;
    BitCancel: TBitBtn;
    procedure BitOkClick(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure SearchEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Of_Search: TForm_Of_Search;

implementation

uses Unit_Main, Unit_DM, Unit_Frame_T700, Unit_T701, Unit_T702,
  Unit_OtborPoSluzhbam, Unit_T701Edit, Unit_T702Edit,
  Unit_Frame_T700Search, Unit_SelectOVD, Unit_T701Search, Unit_T702Search;

{$R *.dfm}

procedure TForm_Of_Search.BitOkClick(Sender: TObject);
begin
  if BitOk.Enabled then
   begin
    if (Form_Of_Search.Caption = 'Наименование ОВД (справочник 0)') then
     begin
      Form_SelectOVD.OVDEdit.Text := SG.Cells[1, SG.Row];
      Form_SelectOVD.Kod_OVDEdit.Text := SG.Cells[0, SG.Row];
      Form_SelectOVD.BitSelectOVD.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Наименование ОВД (справочник 0) ') then
     begin
      TFrame_T700(FrT700).OVDEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700(FrT700).Kod_OVDEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700(FrT700).Num_KUSPEdit.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Наименование ОВД (справочник 0)  ') then
     begin
      TFrame_T700Search(FrT700Search).OVDEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700Search(FrT700Search).Kod_OVDEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700Search(FrT700Search).Num_KUSPEdit.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Наименование ОВД (справочник 0)   ') then
     begin
      Form_T701Search.OVDEdit.Text := SG.Cells[1, SG.Row];
      Form_T701Search.Kod_OVDEdit.Text := SG.Cells[0, SG.Row];
      Form_T701Search.FIO_IEdit.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Наименование ОВД (справочник 0)    ') then
     begin
      Form_T702Search.OVDEdit.Text := SG.Cells[1, SG.Row];
      Form_T702Search.Kod_OVDEdit.Text := SG.Cells[0, SG.Row];
      Form_T702Search.FIO_IEdit.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)') then
     begin
      TFrame_T700(FrT700).SluzhbaEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700(FrT700).Kod_SluzhbaEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700(FrT700).Date_PostME.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1) ') then
     begin
      Form_T701.SluzhbaEdit.Text := SG.Cells[1, SG.Row];
      Form_T701.Kod_SluzhbaEdit.Text := SG.Cells[0, SG.Row];
      Form_T701.Date_DopME.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)  ') then
     begin
      Form_T702.SluzhbaEdit.Text := SG.Cells[1, SG.Row];
      Form_T702.Kod_SluzhbaEdit.Text := SG.Cells[0, SG.Row];
      Form_T702.Date_ArjME.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)   ') then
     begin
      Form_OtborPoSluzhbam.SluzhbaEdit.Text := SG.Cells[1, SG.Row];
      Form_OtborPoSluzhbam.Kod_SluzhbaEdit.Text := SG.Cells[0, SG.Row];
      Form_OtborPoSluzhbam.RG1.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)    ') then
     begin
      Form_T701Edit.SluzhbaEdit.Text := SG.Cells[1, SG.Row];
      Form_T701Edit.Kod_SluzhbaEdit.Text := SG.Cells[0, SG.Row];
      Form_T701Edit.ComboTip.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)     ') then
     begin
      Form_T702Edit.SluzhbaEdit.Text := SG.Cells[1, SG.Row];
      Form_T702Edit.Kod_SluzhbaEdit.Text := SG.Cells[0, SG.Row];
      Form_T702Edit.Date_ArjME.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)      ') then
     begin
      TFrame_T700Search(FrT700Search).SluzhbaEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700Search(FrT700Search).Kod_SluzhbaEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700Search(FrT700Search).Date_PostOtME.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)       ') then
     begin
      Form_T701Search.SluzhbaEdit.Text := SG.Cells[1, SG.Row];
      Form_T701Search.Kod_SluzhbaEdit.Text := SG.Cells[0, SG.Row];
      Form_T701Search.CBTip1.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)        ') then
     begin
      Form_T702Search.SluzhbaEdit.Text := SG.Cells[1, SG.Row];
      Form_T702Search.Kod_SluzhbaEdit.Text := SG.Cells[0, SG.Row];
      Form_T702Search.Date_ArjOtME.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Вид преступления (справочник 2)') then
     begin
      TFrame_T700(FrT700).Vid_PrEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700(FrT700).Kod_Vid_PrEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700(FrT700).PrimMemo.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Вид преступления (справочник 2) ') then
     begin
      TFrame_T700Search(FrT700Search).Vid_PrEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700Search(FrT700Search).Kod_Vid_PrEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700Search(FrT700Search).PrimMemo.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Статья УПК РФ (справочник 3)') then
     begin
      TFrame_T700(FrT700).St_UPKEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700(FrT700).Kod_St_UPKEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700(FrT700).Date_NaprME.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Статья УПК РФ (справочник 3) ') then
     begin
      TFrame_T700Search(FrT700Search).St_UPKEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700Search(FrT700Search).Kod_St_UPKEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700Search(FrT700Search).Date_NaprOtME.SetFocus;
     end;     
    if (Form_Of_Search.Caption = 'Состояние отказного материала (справочник 4)') then
     begin
      Form_T702.SostEdit.Text := SG.Cells[1, SG.Row];
      Form_T702.Kod_SostEdit.Text := SG.Cells[0, SG.Row];
      Form_T702.PrimMemo.SetFocus;
      if (Form_T702.Kod_SostEdit.Text = '1') then
       begin
        Form_T702.PrimMemo.Text := 'СОГЛАСОВАНО';
        Form_T702.BitSaveT702.SetFocus;
       end;
     end;
    if (Form_Of_Search.Caption = 'Состояние отказного материала (справочник 4) ') then
     begin
      Form_T702Edit.SostEdit.Text := SG.Cells[1, SG.Row];
      Form_T702Edit.Kod_SostEdit.Text := SG.Cells[0, SG.Row];
      Form_T702Edit.PrimMemo.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Состояние отказного материала (справочник 4)  ') then
     begin
      Form_T702Search.SostEdit.Text := SG.Cells[1, SG.Row];
      Form_T702Search.Kod_SostEdit.Text := SG.Cells[0, SG.Row];
      Form_T702Search.PrimMemo.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Вид обращения (справочник 6)') then
     begin
      TFrame_T700(FrT700).Vid_ObrEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700(FrT700).Kod_Vid_ObrEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700(FrT700).TerpilaEdit.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'Вид обращения (справочник 6) ') then
     begin
      TFrame_T700Search(FrT700Search).Vid_ObrEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700Search(FrT700Search).Kod_Vid_ObrEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700Search(FrT700Search).TerpilaEdit.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'В отношении кого ОМ (справочник 7)') then
     begin
      TFrame_T700(FrT700).Pro_KogoEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700(FrT700).Kod_Pro_KogoEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700(FrT700).FIO_IEdit.SetFocus;
     end;
    if (Form_Of_Search.Caption = 'В отношении кого ОМ (справочник 7) ') then
     begin
      TFrame_T700Search(FrT700Search).Pro_KogoEdit.Text := SG.Cells[1, SG.Row];
      TFrame_T700Search(FrT700Search).Kod_Pro_KogoEdit.Text := SG.Cells[0, SG.Row];
      TFrame_T700Search(FrT700Search).FIO_IEdit.SetFocus;
     end;
    Close;
   end;
end;

procedure TForm_Of_Search.SearchEditChange(Sender: TObject);

procedure TipSourch(QSelect, QTag : String);
var
  i : integer;
begin
  ADOSQL(DM.QSearch, QSelect + 'AND(TEXT LIKE''' + SearchEdit.Text + '%' + ''')', 'TEXT');
  SG.RowCount := 2;
  SG.Cells[0, 0] := 'Код';
  SG.Cells[1, 0] := QTag;
  SG.Cells[0, 1] := '';
  SG.Cells[1, 1] := '';
  BitOk.Enabled := false;
  if not(DM.QSearch.IsEmpty) then
   begin
    BitOk.Enabled := true;
    SG.RowCount := DM.QSearch.RecordCount + 1;
    DM.QSearch.First;
    for i := 1 to DM.QSearch.RecordCount do
     begin
      SG.Cells[0, i] := DM.QSearch.FieldValues['KOD'];
      SG.Cells[1, i] := DM.QSearch.FieldValues['TEXT'];
      DM.QSearch.Next;
     end;
   end;
end;

begin
  if (copy(Form_Of_Search.Caption, 1, 31) = 'Наименование ОВД (справочник 0)') then
   begin
    TipSourch('SPR_TSYREN WHERE(NAME_PROG=''' + 'ОТКАЗНОЙ МАТЕРИАЛ' + ''')AND(NOMER=0)', 'Наименование ОВД (справочник 0)');
   end;
  if (copy(Form_Of_Search.Caption, 1, 33) = 'Служба исполнителя (справочник 1)') then
   begin
    TipSourch('SPR_TSYREN WHERE(NAME_PROG=''' + 'ОТКАЗНОЙ МАТЕРИАЛ' + ''')AND(NOMER=1)', 'Служба исполнителя (справочник 1)');
   end;
  if (copy(Form_Of_Search.Caption, 1, 31) = 'Вид преступления (справочник 2)') then
   begin
    TipSourch('SPR_TSYREN WHERE(NAME_PROG=''' + 'ОТКАЗНОЙ МАТЕРИАЛ' + ''')AND(NOMER=2)', 'Вид преступления (справочник 2)');
   end;
  if (copy(Form_Of_Search.Caption, 1, 28) = 'Статья УПК РФ (справочник 3)') then
   begin
    TipSourch('SPR_TSYREN WHERE(NAME_PROG=''' + 'ОТКАЗНОЙ МАТЕРИАЛ' + ''')AND(NOMER=3)', 'Статья УПК РФ (справочник 3)');
   end;
  if (copy(Form_Of_Search.Caption, 1, 44) = 'Состояние отказного материала (справочник 4)') then
   begin
    TipSourch('SPR_TSYREN WHERE(NAME_PROG=''' + 'ОТКАЗНОЙ МАТЕРИАЛ' + ''')AND(NOMER=4)', 'Состояние отказного материала (справочник 4)');
   end;   
  if (copy(Form_Of_Search.Caption, 1, 28) = 'Вид обращения (справочник 6)') then
   begin
    TipSourch('SPR_TSYREN WHERE(NAME_PROG=''' + 'ОТКАЗНОЙ МАТЕРИАЛ' + ''')AND(NOMER=6)', 'Вид обращения (справочник 6)');
   end;
  if (copy(Form_Of_Search.Caption, 1, 34) = 'В отношении кого ОМ (справочник 7)') then
   begin
    TipSourch('SPR_TSYREN WHERE(NAME_PROG=''' + 'ОТКАЗНОЙ МАТЕРИАЛ' + ''')AND(NOMER=7)', 'В отношении кого ОМ (справочник 7)');
   end;
end;

procedure TForm_Of_Search.SearchEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DOWN) then
   if (SG.Row = SG.RowCount - 1) then
    SG.Row := 1
   else
    SG.Row := SG.Row + 1;
  if (Key = VK_UP) then
   if (SG.Row = 1) then
    SG.Row := SG.RowCount - 1
   else
    SG.Row := SG.Row - 1;
end;

procedure TForm_Of_Search.BitCancelClick(Sender: TObject);
begin
  if (Form_Of_Search.Caption = 'Наименование ОВД (справочник 0)') then
   begin
    Form_SelectOVD.OVDEdit.Clear;
    Form_SelectOVD.Kod_OVDEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Наименование ОВД (справочник 0) ') then
   begin
    TFrame_T700(FrT700).OVDEdit.Clear;
    TFrame_T700(FrT700).Kod_OVDEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Наименование ОВД (справочник 0)  ') then
   begin
    TFrame_T700Search(FrT700Search).OVDEdit.Clear;
    TFrame_T700Search(FrT700Search).Kod_OVDEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Наименование ОВД (справочник 0)   ') then
   begin
    Form_T701Search.OVDEdit.Clear;
    Form_T701Search.Kod_OVDEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Наименование ОВД (справочник 0)    ') then
   begin
    Form_T702Search.OVDEdit.Clear;
    Form_T702Search.Kod_OVDEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)') then
   begin
    TFrame_T700(FrT700).SluzhbaEdit.Clear;
    TFrame_T700(FrT700).Kod_SluzhbaEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1) ') then
   begin
    Form_T701.SluzhbaEdit.Clear;
    Form_T701.Kod_SluzhbaEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)  ') then
   begin
    Form_T702.SluzhbaEdit.Clear;
    Form_T702.Kod_SluzhbaEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)   ') then
   begin
    Form_OtborPoSluzhbam.SluzhbaEdit.Clear;
    Form_OtborPoSluzhbam.Kod_SluzhbaEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)    ') then
   begin
    Form_T701Edit.SluzhbaEdit.Clear;
    Form_T701Edit.Kod_SluzhbaEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)     ') then
   begin
    Form_T702Edit.SluzhbaEdit.Clear;
    Form_T702Edit.Kod_SluzhbaEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)      ') then
   begin
    TFrame_T700Search(FrT700Search).SluzhbaEdit.Clear;
    TFrame_T700Search(FrT700Search).Kod_SluzhbaEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)       ') then
   begin
    Form_T701Search.SluzhbaEdit.Clear;
    Form_T701Search.Kod_SluzhbaEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Служба исполнителя (справочник 1)        ') then
   begin
    Form_T702Search.SluzhbaEdit.Clear;
    Form_T702Search.Kod_SluzhbaEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Вид преступления (справочник 2)') then
   begin
    TFrame_T700(FrT700).Vid_PrEdit.Clear;
    TFrame_T700(FrT700).Kod_Vid_PrEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Вид преступления (справочник 2) ') then
   begin
    TFrame_T700Search(FrT700Search).Vid_PrEdit.Clear;
    TFrame_T700Search(FrT700Search).Kod_Vid_PrEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Статья УПК РФ (справочник 3)') then
   begin
    TFrame_T700(FrT700).St_UPKEdit.Clear;
    TFrame_T700(FrT700).Kod_St_UPKEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Статья УПК РФ (справочник 3) ') then
   begin
    TFrame_T700Search(FrT700Search).St_UPKEdit.Clear;
    TFrame_T700Search(FrT700Search).Kod_St_UPKEdit.Clear;
   end;   
  if (Form_Of_Search.Caption = 'Состояние отказного материала (справочник 4)') then
   begin
    Form_T702.SostEdit.Clear;
    Form_T702.Kod_SostEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Состояние отказного материала (справочник 4) ') then
   begin
    Form_T702Edit.SostEdit.Clear;
    Form_T702Edit.Kod_SostEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Состояние отказного материала (справочник 4)  ') then
   begin
    Form_T702Search.SostEdit.Clear;
    Form_T702Search.Kod_SostEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Вид обращения (справочник 6)') then
   begin
    TFrame_T700(FrT700).Vid_ObrEdit.Clear;
    TFrame_T700(FrT700).Kod_Vid_ObrEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'Вид обращения (справочник 6) ') then
   begin
    TFrame_T700Search(FrT700Search).Vid_ObrEdit.Clear;
    TFrame_T700Search(FrT700Search).Kod_Vid_ObrEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'В отношении кого ОМ (справочник 7)') then
   begin
    TFrame_T700(FrT700).Pro_KogoEdit.Clear;
    TFrame_T700(FrT700).Kod_Pro_KogoEdit.Clear;
   end;
  if (Form_Of_Search.Caption = 'В отношении кого ОМ (справочник 7) ') then
   begin
    TFrame_T700Search(FrT700Search).Pro_KogoEdit.Clear;
    TFrame_T700Search(FrT700Search).Kod_Pro_KogoEdit.Clear;
   end;
end;

end.
