unit Unit_Sotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_Sotr = class(TForm)
    GBId: TGroupBox;
    IdEdit: TEdit;
    GBFam: TGroupBox;
    FamEdit: TEdit;
    GBImj: TGroupBox;
    ImjEdit: TEdit;
    GBOtch: TGroupBox;
    OtchEdit: TEdit;
    GBInv: TGroupBox;
    GBDolzh: TGroupBox;
    DolzhEdit: TEdit;
    BitSave: TBitBtn;
    BitCancel: TBitBtn;
    TipCB: TComboBox;
    procedure BitSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Sotr: TForm_Sotr;

implementation

uses Unit_DM;

{$R *.dfm}

procedure TForm_Sotr.BitSaveClick(Sender: TObject);

procedure AddPrinter;
begin
  with Form_DM.QAdd.SQL do
   begin
    Clear;
    Add('INSERT INTO SOTR');
    Add('(FAM,IMJ,OTCH,TIP,DOLZH)VALUES');
    Add('(''' + FamEdit.Text + ''',');
    Add('''' + ImjEdit.Text + ''',');
    Add('''' + OtchEdit.Text + ''',');
    Add('''' + TipCB.Text + ''',');
    Add('''' + DolzhEdit.Text + ''')');
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

procedure EditPrinter;
begin
  with Form_DM.QEdit.SQL do
   begin
    Clear;
    Add('UPDATE SOTR SET ');
    Add('FAM=''' + FamEdit.Text + ''',');
    Add('IMJ=''' + ImjEdit.Text + ''',');
    Add('OTCH=''' + OtchEdit.Text + ''',');
    Add('TIP=''' + TipCB.Text + ''',');
    Add('DOLZH=''' + DolzhEdit.Text + '''');
    Add('WHERE(ID=' + IntToStr(Tag) + ')');
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
  if (Tag = 0) then
   AddPrinter
  else
   EditPrinter;
  Close;
end;

end.
