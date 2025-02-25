program Project1;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
  Gameloop in 'Gameloop.pas',
  Items in 'Items.pas',
  CounterUnit in 'CounterUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
