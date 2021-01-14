unit Unit_Progress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges;

type
  TForm_Progress = class(TForm)
    Gauge1: TGauge;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Progress: TForm_Progress;

implementation

{$R *.dfm}

end.
