unit Gameloop;

interface
uses CounterUnit, Items, Winapi.Windows;

type
  TGameLoop = class
  private
    FCounter: TCounter;
  public
    FItems: TItems;
    constructor Create(ACounter: TCounter);
    function GetClickGeneratorAmount:Integer;
    function GetAutoClicks:Integer;
    procedure OnTimer;
    procedure SetItemEvents(ShowEvent: TShowShopItemEvent; EnableEvent: TEnableShopItemEvent);
end;

implementation

constructor TGameLoop.Create(ACounter: TCounter);
begin
  FCounter := ACounter;
  FItems := TItems.Create(FCounter);
end;

procedure TGameLoop.OnTimer;
begin
  OutputDebugString(PChar('GameLoop - Start'));
  FItems.OnGameLoop;
  FCounter.AddAutoClicks(FItems.GetAutoClicks);
  OutputDebugString(PChar('GameLoop - End'));
end;

procedure TGameLoop.SetItemEvents(ShowEvent: TShowShopItemEvent; EnableEvent: TEnableShopItemEvent);
begin
  FItems.OnShowShopItem := ShowEvent;
  FItems.OnEnableShopItem := EnableEvent;
end;

function TGameLoop.GetClickGeneratorAmount:Integer;
begin
  Result := FItems.GetClickGeneratorAmount;
end;
function TGameLoop.GetAutoClicks:Integer;
begin
  Result := FItems.GetAutoClicks;
end;

end.
