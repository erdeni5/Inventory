unit Unit_UPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_UPS = class(TForm)
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
  Form_UPS: TForm_UPS;

implementation

uses Unit_DM;

{$R *.dfm}

procedure TForm_UPS.BitSaveClick(Sender: TObject);

procedure AddUPS;
begin
  with Form_DM.QAdd.SQL do
   begin
    Clear;
    Add('INSERT INTO UPS');
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
     Application.MessageBox('�� ������� ���������!' + #13 + '���������� �����.',
                            '������ ����������', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure EditUPS;
begin
  with Form_DM.QEdit.SQL do
   begin
    Clear;
    Add('UPDATE UPS SET ');
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
     Application.MessageBox('�� ������� ���������!' + #13 + '���������� �����.',
                            '������ ����������', MB_OK + MB_ICONERROR);
    end;
  end;
end;

begin
  case (Tag) of
   0 : AddUPS;
   1 : EditUPS;
  end;
  Close;
end;


end.
