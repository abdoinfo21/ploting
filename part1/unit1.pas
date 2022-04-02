unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
Const
x1 = -25; //the point of beginning on x axis
x2 = 25;  //the point of ending on x axis
m = 10;   //coefficient of amplification
var
x0,y0:integer;
x,y:real;
begin
  with Image1 do
   begin
     x0 := Width div 2;     //half point of the image width
     y0 := Height div 2;    //half point of the image hieght
     with Canvas do
      begin
        Pen.Color := ClGreen; //the color to daw the x axis and y axis
        Pen.Width := 1;       //the width of the lines (x axis and y axis )
        MoveTo(0,y0);         //go to point(0,y0)
        LineTo(width,y0);     //draw line from the previous point to point(width,y0)
        MoveTo(x0,0);         //go to point(x0,0)
        LineTo(x0,Height);    //draw line from the previous point to point(x0,Height)

        Pen.Color := ClRed;   //the color to daw the function
        Pen.Width := 2;       //the width of the lines to draw the function

        x:=x1;                //the first coordinate x (x,y)
        y:=(x*x*x);            //the first coordinate y (x,y)
        MoveTo(x0+Trunc(x*m),y0-Trunc(y*m));//the offset to (x0,y0)
        while x<x2 do
         begin
           x:= x + 0.01;   //the next point on x axis
           y:=(x*x*x);     //the next point on y axis
           LineTo(x0+Trunc(x*m),y0-Trunc(y*m)); //draw line from the previous point to the next
         end;
      end;

   end;

end;
end.

