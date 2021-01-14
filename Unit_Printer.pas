unit Unit_Printer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_Printer = class(TForm)
    GBId: TGroupBox;
    IdEdit: TEdit;
    GBMarka: TGroupBox;
    MarkaEdit: TEdit;
    GBModel: TGroupBox;
    ModelEdit: TEdit;
    GBSN: TGroupBox;
    SNEdit: TEdit;
    GBInv: TGroupBox;
    InvEdit: TEdit;
    BitSave: TBitBtn;
    BitCancel: TBitBtn;
    procedure BitSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Printer: TForm_Printer;

implementation

uses Unit_DM;

{$R *.dfm}

procedure TForm_Printer.BitSaveClick(Sender: TObject);

procedure AddPrinter;
begin
  with Form_DM.QAdd.SQL do
   begin
    Clear;
    Add('INSERT INTO PRINTER');
    Add('(MARKA,MODEL,SN,INV)VALUES');
    Add('(''' + MarkaEdit.Text + ''',');
    Add('''' + ModelEdit.Text + ''',');
    Add('''' + SNEdit.Text + ''',');
    Add('''' + InvEdit.Text + ''')');
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
    Add('UPDATE PRINTER SET ');
    Add('MARKA=''' + MarkaEdit.Text + ''',');
    Add('MODEL=''' + ModelEdit.Text + ''',');
    Add('SN=''' + SNEdit.Text + ''',');
    Add('INV=''' + InvEdit.Text + '''');
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
   0 : AddPrinter;
   1 : EditPrinter;
  end;
  Close;
end;

end.
