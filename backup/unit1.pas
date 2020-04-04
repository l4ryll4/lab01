unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  FileWork: String; //Переменная, в которой хранится имя рабочего файла

implementation

{$R *.lfm}

{ TForm1 }

procedure SaveAs;
begin
  If Form1.SaveDialog1.Execute then
     begin
       Form1.Memo1.Lines.SaveToFile(Form1.SaveDialog1.FileName);
       FileWork:=Form1.SaveDialog1.FileName;
     end;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
     begin
       Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
       FileWork:=OpenDialog1.FileName;
     end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  FileWork:='';
  Memo1.Clear; //Очищаем поле и имя переменной
end;

end.

