unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;
  check: Real;

implementation

uses
  Unit1;

{$R *.lfm}

{ TForm2 }

//Включение стандартных настроек оформления окна
procedure TForm2.Button1Click(Sender: TObject);
begin
  If SynS = 1 then
  begin
    Form1.SynEdit1.Color:=clWhite; //Цвет окна memo - белый
    Form1.SynEdit1.Font.Color:=clBlack; //Цвет шрифта - черный
    Form1.SynEdit1.Font.Size:=12; //Размер шрифта - 12
    Form1.SynEdit1.Font.Style:= [ ];//Никаких дополнительных стилей шрифта
  end else
  begin
    Form1.Memo1.Color:=clWhite; //Цвет окна memo - белый
    Form1.Memo1.Font.Color:=clBlack; //Цвет шрифта - черный
    Form1.Memo1.Font.Size:=12; //Размер шрифта - 12
    Form1.Memo1.Font.Style:= [ ];//Никаких дополнительных стилей шрифта
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  If SynS = 1 then
  begin
    Form1.SynEdit1.Color:=clBlack; //Цвет окна memo - белый
    Form1.SynEdit1.Font.Color:=clWhite; //Цвет шрифта - черный
    Form1.SynEdit1.Font.Size:=15; //Размер шрифта - 12
    Form1.SynEdit1.Font.Style:= [fsBold];//Никаких дополнительных стилей шрифта
  end else
  begin
    Form1.Memo1.Color:=clBlack; //Цвет окна memo - белый
    Form1.Memo1.Font.Color:=clWhite; //Цвет шрифта - черный
    Form1.Memo1.Font.Size:=15; //Размер шрифта - 12
    Form1.Memo1.Font.Style:= [fsBold];//Никаких дополнительных стилей шрифта
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  if SynS = 1 then
  begin
    Form1.SynEdit1.Hide;
    Form1.Memo1.Show;
    Button3.Caption:='Режим подсветки синтаксиса';
    RadioGroup1.Hide;
    SynS:= 0;
  end
  else
  begin
    Form1.Memo1.Hide;
    Form1.SynEdit1.Show;
    Button3.Caption:='Режим блокнота';
    RadioGroup1.Show;
    SynS:= 1;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  RadioGroup1.Hide;
end;

procedure TForm2.RadioButton1Change(Sender: TObject);
begin
  if RadioButton1.Checked=true then
  begin
    Form1.SynEdit1.Highlighter:=Form1.SynHTMLSyn1;
  end;
  if RadioButton2.Checked=true then
  begin
    Form1.SynEdit1.Highlighter:=Form1.SynCssSyn1;
  end;
  if RadioButton3.Checked=true then
  begin
    Form1.SynEdit1.Highlighter:=Form1.SynPythonSyn1;
  end;

end;

end.

