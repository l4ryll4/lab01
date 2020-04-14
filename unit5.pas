unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

  function FindInMemo(AMemo: TMemo; AString: String; StartPos: Integer): Integer;

  resourcestring
  rFindAndReplacCaption = 'Найти и заменить';
  rNomatchesCaption = 'Нет совпадений!';

var
  Form5: TForm5;

implementation

uses Unit1, LCLProc, strutils, LazUTF8;

{$R *.lfm}

{ TForm5 }

//нажатие "Найти"
procedure TForm5.Button1Click(Sender: TObject);
const
  SearchStr: String = '';
  SearchStart: Integer = 0;
begin
  if SearchStr <> Edit1.Text then begin
    SearchStart:= 0;
    SearchStr:=Edit1.Text;
  end;
  SearchStart:=FindInMemo(Form1.Memo1, SearchStr, SearchStart+1);

  if not (SearchStart > 0) then
  else
    Caption:= 'Ничего не найдено';
end;

function FindInMemo(AMemo: TMemo; AString: String; StartPos: Integer): Integer;
begin
  Result:= PosEx(AString, AMemo.Text, StartPos);
  if Result > 0 then
  begin
    AMemo.SelStart:= UTF8Length(PChar(AMemo.Text), Result - 1);
    AMemo.SelLength:= Length(Astring);
    //AMemo.SelEnd:= AMemo.SelStart + Length(AString);
    AMemo.SetFocus;
  end;
end;

end.

