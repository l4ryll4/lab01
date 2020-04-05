unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

uses
  Unit1;

{$R *.lfm}

{ TForm2 }

//Включение стандартных настроек оформления окна
procedure TForm2.Button1Click(Sender: TObject);
begin
  Form1.Memo1.Color:=clWhite; //Цвет окна memo - белый
  Form1.Memo1.Font.Color:=clBlack; //Цвет шрифта - черный
  Form1.Memo1.Font.Size:=12; //Размер шрифта - 12
  Form1.Memo1.Font.Style:= [ ];//Никаких дополнительных стилей шрифта
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form1.Memo1.Color:=clBlack; //Цвет окна memo - черный
  Form1.Memo1.Font.Color:=clWhite; //Цвет шрифта - белый
  Form1.Memo1.Font.Size:=15; //Размер шрифта 15. Чего мелочиться?
  Form1.Memo1.Font.Style:=[fsBold]; //Полужирный стиль шрифта
end;

end.

