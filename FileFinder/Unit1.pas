unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    FindEdit: TEdit;
    FilenameLabel: TLabel;
    ResultGrid: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    RefreshButton: TButton;
    FindButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FindButtonClick(Sender: TObject);
    procedure ResultGridDblClick(Sender: TObject);
    procedure FindEditKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  drives: TStringList;
  filelist:TStringList;



implementation

{$R *.dfm}

procedure RefreshDirList(Path: String; listofpaths: TStringList);
var
 F: TSearchRec;
begin
  if Path[Length(Path)] <> '\' then Path := Path + '\';
  if FindFirst(Path+'*.*', faAnyFile, F) = 0 then
  begin
   repeat
    Application.ProcessMessages;
     if (F.Attr and faDirectory) <> faDirectory then
      listofpaths.Add(Path + F.Name)
     else if (F.Name <> '..') and (F.Name <> '.') then
      RefreshDirList(Path + F.Name + '', listofpaths);
    until FindNext(F) <> 0;
    FindClose(F);
  end;
end;

procedure TForm1.FindButtonClick(Sender: TObject);
var
  i: Integer;
  FindList: TStringList;
  FindStr:String;
begin
FindList := TStringList.Create;
FindStr := AnsiUpperCase(FindEdit.Text);

for i := 0 to filelist.Count-1 do
  begin
    if pos(FindStr,AnsiUpperCase(filelist[i]))<>0 then
      FindList.Add(filelist[i])
  end;

ResultGrid.RowCount:=FindList.Count;
for i := 0 to FindList.Count-1 do
  ResultGrid.Cells[0,i]:=FindList[i];

end;

procedure TForm1.FindEditKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  FindButton.Click;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
filelist.Free;
drives.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  c: char;
begin
  filelist := TStringList.Create;

  drives := TStringList.Create;
  for c := 'A' to 'Z' do
    begin
    //только жесткие (3) и сетевые(4) диски
    if (GetDriveType(PChar(c+':\')) = 3) or (GetDriveType(PChar(c+':\')) = 4) then
      begin
      drives.Add(c+':');
      memo1.Lines.Add(c);
      end;
    end;

end;

procedure TForm1.RefreshButtonClick(Sender: TObject);
var
I: Integer;
//t:longint;
begin
filelist.Clear;
//t := GetTickCount();
for I := 0 to drives.Count-1 do
  begin
  memo1.Lines.Add('Индексация диска '+ drives[i]);
  RefreshDirList(drives[i],filelist);
  end;
Memo1.Lines.Add('Индексация завершена, найдено '+inttostr(filelist.Count)+' файлов')
  //showmessage(floattostr((filelist.Count)/(GetTickCount() - t)));
//filelist.SaveToFile('E:\test.txt');
end;

procedure TForm1.ResultGridDblClick(Sender: TObject);
var
Path,Filename : String;
begin
Path := ResultGrid.Cells[0,ResultGrid.Row];

if FileExists(Path) then
  ShellExecute(Application.Handle, 'OPEN', 'EXPLORER', PWideChar('/select, ' + Path), '', SW_NORMAL);
end;

end.
