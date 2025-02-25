unit Items;

interface uses CounterUnit, Winapi.Windows;
  type
  TShowShopItemEvent = procedure(ShopItem: String) of object;
  TEnableShopItemEvent = procedure(ShopItem: String; Enable: Boolean) of object;
  TItems = class
  private
    FCounter: TCounter;
    FClickGeneratorAmount: Integer;
    FClickGeneratorAutoClicks: Integer;
    FClickGeneratorVisible: Boolean;
    FClickGeneratorEnabled: Boolean;
    FOnShowShopItem: TShowShopItemEvent;
    FOnEnableShopItem: TEnableShopItemEvent;
  public
    constructor Create(ACounter: TCounter);
    function GetAutoClicks: Integer;
    function GetClickGeneratorAmount:Integer;
    procedure OnGameLoop;
    procedure AddItem(Item:String);
    property OnShowShopItem: TShowShopItemEvent read FOnShowShopItem write FOnShowShopItem;
    property OnEnableShopItem: TEnableShopItemEvent read FOnEnableShopItem write FOnEnableShopItem;
  end;
implementation

constructor TItems.Create(ACounter: TCounter);
begin
  FClickGeneratorAmount := 0;
  FClickGeneratorAutoClicks := 1;
  FClickGeneratorVisible := false;
  FClickGeneratorEnabled := false;
  FCounter := ACounter;
end;

procedure TItems.OnGameLoop;
begin
  OutputDebugString(PChar('TItems.OnGameLoop'));
  if Not FClickGeneratorVisible then
  begin
    OutputDebugString(PChar('FClickGeneratorVisible'));
    if FCounter.GetValue >= 10 then
    begin
      OutputDebugString(PChar('FCounter.GetValue >= 10'));
      if Assigned(FOnShowShopItem) then
      begin
        OutputDebugString(PChar('Assigned(FOnShowShopItem)'));
        FOnShowShopItem('ClickGenerator');
        FClickGeneratorVisible := True;
      end;
    end;
  end;
  if Assigned(FOnEnableShopItem) then
  begin
    FClickGeneratorVisible := FCounter.GetValue >= 20;
    FOnEnableShopItem('ClickGenerator', FClickGeneratorVisible);
  end;
end;

procedure TItems.AddItem(Item:String);
begin
  FClickGeneratorAmount := FClickGeneratorAmount + 1;
end;

function TItems.GetAutoClicks: Integer;
begin
  Result := FClickGeneratorAmount * FClickGeneratorAutoClicks;
end;

function TItems.GetClickGeneratorAmount:Integer;
begin
  Result := FClickGeneratorAmount;
end;

end.
