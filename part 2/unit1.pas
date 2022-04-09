unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
  private

  public
    procedure sinwave;
    procedure getnextsample(a,f:single);
    procedure clearform;
  end;

var
  Form1: TForm1;
  samplenum:integer;
  samplevalue:single;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  sinwave;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
   sinwave
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
   sinwave
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
   sinwave
end;

procedure TForm1.sinwave;
var
i:integer;
x,y:integer;
begin
clearform;
canvas.Pen.Color:=clblue;
canvas.Pen.Width:=3;
canvas.MoveTo(0,clientheight div 2);
samplenum:=0;
for i:=0 to ClientWidth-1 do
begin
  getnextsample(TrackBar1.position,TrackBar2.position/100) ;
  x:=samplenum;
  y:= round(samplevalue + clientheight / 2);
  canvas.LineTo(x,y);
end;

end;

procedure TForm1.getnextsample(a, f: single);
begin
  label1.caption:= format('amplitude : %f',[a]);
  label2.caption:= format('frequincy : %.3f',[f]);
  inc(samplenum);
  samplevalue:=a*sin(samplenum*f);
end;

procedure TForm1.clearform;
begin
  canvas.Brush.Color:=clbtnface;
  canvas.FillRect(clientrect);
  label1.Repaint;
  label2.Repaint;
end;

end.

