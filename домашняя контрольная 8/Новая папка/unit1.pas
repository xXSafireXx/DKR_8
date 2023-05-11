unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  EditBtn, ExtCtrls, MMsystem;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button_delete: TButton;
    Button_create: TButton;
    EditTime_now: TEdit;
    EditTimer: TEdit;
    List_of_timers: TListBox;
    TimeEdit1: TTimeEdit;
    Timer1: TTimer;
    procedure Button_createClick(Sender: TObject);
    procedure Button_deleteClick(Sender: TObject);
    procedure EditTime_nowChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure List_of_timersClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button_deleteClick(Sender: TObject);
begin
 if List_of_timers.ItemIndex > -1 then
    List_of_timers.Items.Delete(List_of_timers.ItemIndex);
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
   timer1.Enabled:=true;
end;

procedure TForm1.List_of_timersClick(Sender: TObject);
begin
  if List_of_timers.ItemIndex > -1 then    //Delete only when a string in the listbox is selected
      EditTimer.text:=intTostr(List_of_timers.ItemIndex);
  end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

end;

  procedure TForm1.EditTime_nowChange(Sender: TObject);
var i:integer;
begin
   Edittime_now.text:=timeTOstr(time);
    if List_of_timers.items.count > 0 then                 //Delete only if at least one string in the list box is selected
    for i:=List_of_timers.Items.Count - 1 downto 0 do //Iterate through all the items
      if List_of_timers.items.strings[i]=EditTime_Now.text then
      begin
       sndPlaySound('123.wav',snd_async);
      end;
end;
procedure TForm1.Button_createClick(Sender: TObject);
begin
  if TimeEdit1.text<>'' then   begin
   List_of_timers.Items.add(TimeEdit1.text+':00');

  end;
end;
end.
