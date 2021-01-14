unit Unit_DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TForm_DM = class(TDataModule)
    Con: TADOConnection;
    QPC: TADOQuery;
    DSPC: TDataSource;
    QAdd: TADOQuery;
    QEdit: TADOQuery;
    QHelp: TADOQuery;
    QChoice: TADOQuery;
    DSChoice: TDataSource;
    QReport: TADOQuery;
    QIPSotr: TADOQuery;
    QSotr: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_DM: TForm_DM;

implementation

{$R *.dfm}

end.
