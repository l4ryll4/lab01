unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ActnList, ExtCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Label1: TLabel;
  private

  public

  end;

var
  Form3: TForm3;

implementation

procedure TForm2.RadioButton1Change(Sender: TObject);
begin
  if RadioButton1.Checked=true then
  begin
    ListBox.Text:='Вы нажали первую кнопку';
  end;
end;

{$R *.lfm}

end.

