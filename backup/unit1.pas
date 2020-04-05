unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  StdCtrls, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    FontDialog1: TFontDialog;
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
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  FileWork: String; //Переменная, в которой хранится имя рабочего файла

implementation

uses
  Unit2;

{$R *.lfm}

{ TForm1 }

//это нужно для сохранения файла под определенным именем
procedure SaveAs;
begin
  If Form1.SaveDialog1.Execute then
     begin
       Form1.Memo1.Lines.SaveToFile(Form1.SaveDialog1.FileName);
       FileWork:=Form1.SaveDialog1.FileName;
     end;
end;

//Ниже - обработчики нажатия штук из меню.
//Нажатие "Закрыть" в меню "Файл"
procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  Close;
end;
//Нажатие "Выбрать Все" в меню "Правка"
procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  Memo1.SelectAll;
end;
//Нажатие "Открыть" в меню "Файл"
procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
     begin
       Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
       FileWork:=OpenDialog1.FileName;
     end;
end;

//Нажатие "Закрыть" в меню "Файл"
procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  If MessageDlg('Подтверждение','Вы хотите сохранить файл перед закрытием?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then If FileWork='' then SaveAs else Memo1.Lines.SaveToFile(FileWork);;
  FileWork:='';
  Memo1.Clear;
end;

//Нажатие "Сохранить" в меню "Файл"
procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  If FileWork='' then SaveAs else Memo1.Lines.SaveToFile(FileWork);
end;

//Нажатие "Сохранить как" в меню "Файл"
procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  SaveAs;
end;

//Нажатие "Новый" в меню "Файл"
procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  FileWork:='';
  Memo1.Clear;
end;

//Нажатие "Вырезать" в меню "Правка"
procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  Memo1.CutToClipboard;
end;
//Создание содержимого statusbar'а
procedure TForm1.FormCreate(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:=('Время: ');
  StatusBar1.Panels[1].Text:=FormatDateTime('hh.mm', Time);
  StatusBar1.Panels[2].Text:=('Дата: ');
  StatusBar1.Panels[3].Text:=FormatDateTime('dd.mm.yyyy', Date);
end;

//Нажатие "Копировать" в меню "Правка"
procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  Memo1.CopyToClipboard;
end;

//Нажатие "Вставить" в меню "Правка"
procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  Memo1.PasteFromClipboard;
end;
//Нажатие "Шрифт" в меню "Вид"
procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  if FontDialog1.Execute then Memo1.Font:=FontDialog1.Font;
end;
//Нажатие "Тема Оформления" в меню "Вид"
procedure TForm1.MenuItem15Click(Sender: TObject);
begin
  Form2.Show;
end;

end.

