unit CounterUnit;

interface

type
  TCounter = class
  private
    FValue: Integer;
  public
    constructor Create;
    procedure AddAutoClicks(AutoClicks:Integer);
    procedure Increment;
    procedure Subtract(Subtract:Integer);
    function GetValue: Integer;
  end;

implementation

constructor TCounter.Create;
begin
  FValue := 0;
end;

procedure TCounter.Increment;
begin
  Inc(FValue);
end;

procedure TCounter.Subtract(Subtract:Integer);
begin
  FValue := FValue - Subtract;
end;

procedure TCounter.AddAutoClicks(AutoClicks:Integer);
begin
  FValue := FValue + AutoClicks;
end;

function TCounter.GetValue: Integer;
begin
  Result := FValue;
end;

end.
