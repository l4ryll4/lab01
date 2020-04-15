unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLProc, strutils, LazUTF8, SynEdit;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

  function FindInMemo(AMemo: TMemo; AString: String; StartPos: Integer): Integer;
  //function FindInSyn(AMemo: TSynEdit; AString: String; StartPos: Integer): Integer;

var
  Form5: TForm5;

implementation

uses Unit1;

{$R *.lfm}

{ TForm5 }

function FindInMemo(AMemo: TMemo; AString: String; StartPos: Integer): Integer;
begin
  Result:= PosEx(AString, AMemo.Text, StartPos);
  if Result > 0 then
  begin
    AMemo.SelStart:= UTF8Length(PChar(AMemo.Text), Result - 1);
    AMemo.SelLength:= Length(Astring);
    AMemo.SetFocus;
  end;
end;

//function FindInSyn(AMemo: TMemo; AString: String; StartPos: Integer): Integer;
//begin
//  Result:= PosEx(AString, AMemo.Text, StartPos);
//  if Result > 0 then
//  begin
//    AMemo.SelStart:= UTF8Length(PChar(AMemo.Text), Result - 1);
//    AMemo.SelLength:= Length(Astring);
    //AMemo.SelEnd:= AMemo.SelStart + Length(AString);
//    AMemo.SetFocus;
//  end;
//end;

//нажатие "Найти"
procedure TForm5.Button1Click(Sender: TObject);
const
  SearchStr: String = '';
  SearchStart: Integer = 0;
begin
  if SearchStr <> Edit1.Text then
  begin
    SearchStart:= 0;
    SearchStr:=Edit1.Text;
  end;
  //if SynS = 0 then SearchStart:=FindInMemo(Form1.Memo1, SearchStr, SearchStart+1) else SearchStart:=FindInSyn(Form1.SynEdit1, SearchStr, SearchStart+1);
  SearchStart:=FindInMemo(Form1.Memo1, SearchStr, SearchStart+1)
  if not (SearchStart > 0) then
  else
    Caption:= 'Ничего не найдено';
end;

//нажатие 'Заменить'
procedure TForm5.Button2Click(Sender: TObject);
var temp: String;
  newTemp: String;
begin

  if SynS = 0 then
  begin
    temp:= Form1.Memo1.Text;
    newTemp:= StringReplace(temp, Edit1.Text, Edit2.Text, []);
    Form1.Memo1.Text:= newTemp;
  end else
  begin
    temp:= Form1.SynEdit1.Text;
    newTemp:= StringReplace(temp, Edit1.Text, Edit2.Text, []);
    Form1.SynEdit1.Text:= newTemp;
  end;
end;

end.

