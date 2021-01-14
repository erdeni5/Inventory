unit Unit_SB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TForm_SB = class(TForm)
    GBCPU: TGroupBox;
    CPUEdit: TEdit;
    BitSave: TBitBtn;
    BitCancel: TBitBtn;
    Panel1: TPanel;
    GBId: TGroupBox;
    IdEdit: TEdit;
    GBTIP: TGroupBox;
    TipCB: TComboBox;
    GBMarka: TGroupBox;
    MarkaEdit: TEdit;
    GBModel: TGroupBox;
    ModelEdit: TEdit;
    GBSN: TGroupBox;
    SNEdit: TEdit;
    GBInv: TGroupBox;
    InvEdit: TEdit;
    GBOS: TGroupBox;
    OSCB: TComboBox;
    Label1: TLabel;
    OSKeyEdit: TEdit;
    Label2: TLabel;
    LicenseCB: TComboBox;
    Label3: TLabel;
    Panel2: TPanel;
    GBVipNet: TGroupBox;
    VipNetEdit: TEdit;
    GBMIS: TGroupBox;
    MISCB: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure BitSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_SB: TForm_SB;

implementation

uses Unit_DM;

{$R *.dfm}

procedure TForm_SB.BitSaveClick(Sender: TObject);

procedure AddSB;
begin
  with Form_DM.QAdd.SQL do
   begin
    Clear;
    Add('INSERT INTO SB');
    Add('(TIP,MARKA,MODEL,SN,INV,CPU,OS,OSKEY,LICENSE,VIPNET,MIS)VALUES');
    Add('(''' + VarToStr(TipCB.ItemIndex) + ''',');
    Add('''' + MarkaEdit.Text + ''',');
    Add('''' + ModelEdit.Text + ''',');
    Add('''' + SNEdit.Text + ''',');
    Add('''' + InvEdit.Text + ''',');
    Add('''' + CPUEdit.Text + ''',');
    Add('''' + OSCB.Text + ''',');
    Add('''' + OSKeyEdit.Text + ''',');
    Add('''' + LicenseCB.Text + ''',');
    Add('''' + VipNetEdit.Text + ''',');
    Add('''' + MISCB.Text + ''')');
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

procedure EditSB;
begin
  with Form_DM.QEdit.SQL do
   begin
    Clear;
    Add('UPDATE SB SET ');
    Add('TIP=' + VarToStr(TipCB.ItemIndex) + ',');
    Add('MARKA=''' + MarkaEdit.Text + ''',');
    Add('MODEL=''' + ModelEdit.Text + ''',');
    Add('SN=''' + SNEdit.Text + ''',');
    Add('INV=''' + InvEdit.Text + ''',');
    Add('CPU=''' + CPUEdit.Text + ''',');
    Add('OS=''' + OSCB.Text + ''',');
    Add('OSKEY=''' + OSKeyEdit.Text + ''',');
    Add('LICENSE=''' + LicenseCB.Text + ''',');
    Add('VIPNET=''' + VipNetEdit.Text + ''',');
    Add('MIS=''' + MISCB.Text + '''');
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
   0 : AddSB;
   1 : EditSB;
  end;
  Close; 
end;

end.
