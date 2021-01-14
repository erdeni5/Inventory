unit Unit_Choice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm_Choice = class(TForm)
    DBChoice: TDBGrid;
    BitCancel: TBitBtn;
    procedure DBChoiceDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Choice: TForm_Choice;

implementation

uses Unit_DM;

{$R *.dfm}

procedure TForm_Choice.DBChoiceDblClick(Sender: TObject);
begin
  Close;
end;

end.
