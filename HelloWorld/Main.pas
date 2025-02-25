unit Main;

interface

uses
  CounterUnit, GameLoop, Items,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Clicker: TButton;
    ClickCounter: TLabel;
    GameloopTimer: TTimer;
    BuyClickGenerator: TButton;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    Label5: TLabel;
    procedure ClickerClick(Sender: TObject);
    procedure BuyClickGeneratorClick(Sender: TObject);
    procedure OnTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ShowShopItem(ShopItem: String);
    procedure EnableShopItem(ShopItem: String; Enable: Boolean);
  private
    Counter: TCounter;
    GameLoop: TGameLoop;
  public
    function GetCounter: TCounter;
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Counter := TCounter.Create; // Initialize the counter
  GameLoop := TGameLoop.Create(Counter);
  // Assign event handlers
  GameLoop.SetItemEvents(ShowShopItem, EnableShopItem);
  ClickCounter.Caption := IntToStr(Counter.GetValue); // Display the initial value
end;

procedure TForm1.ClickerClick(Sender: TObject);
begin
  begin
    Counter.Increment;
    ClickCounter.Caption := IntToStr(Counter.GetValue);
  end
end;

procedure TForm1.BuyClickGeneratorClick(Sender: TObject);
begin
  OutputDebugString(PChar('BuyClickGeneratorClick'));
  if Counter.GetValue >= 20 then
    begin
        OutputDebugString(PChar('BuyClickGeneratorClick'));
        Counter.Subtract(20);
        ClickCounter.Caption := IntToStr(Counter.GetValue);
        GameLoop.FItems.AddItem('ClickGenerator');
    end;
end;

procedure TForm1.OnTimer(Sender: TObject);
begin
   GameLoop.OnTimer;
   ClickCounter.Caption := IntToStr(Counter.GetValue);
   Label3.Caption := IntToStr(GameLoop.GetClickGeneratorAmount) + 'x';
   Label4.Caption := 'Cps: ' + IntToStr(GameLoop.GetAutoClicks);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  GameLoop.Free;
  Counter.Free;
end;

procedure TForm1.ShowShopItem(ShopItem: String);
begin;
  Panel1.Visible := True;
  Panel2.Visible := True;
  Panel3.Visible := True;
  Label4.Visible := True;
end;
procedure TForm1.EnableShopItem(ShopItem: String; Enable: Boolean);
begin
  BuyClickGenerator.Enabled := Enable;
end;

function TForm1.GetCounter:TCounter;
begin
  Result := Counter
end;

end.
