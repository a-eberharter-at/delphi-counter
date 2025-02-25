unit TestCounter;

interface

uses
  DUnitX.TestFramework, Main;

type
  [TestFixture]
  TTestCounter = class
  private
    FForm: TForm1;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
    [Test]
    procedure TestCounterInitialValue;

    [Test]
    procedure TestClickerClick;
  end;

implementation

procedure TTestCounter.Setup;
begin
  FForm := TForm1.Create(nil);
  FForm.FormCreate(nil);
end;

procedure TTestCounter.TearDown;
begin
  FForm.FormDestroy(nil);
  FForm.Free;
end;

procedure TTestCounter.TestCounterInitialValue;
begin
  // Assert that the initial counter value is 0
  Assert.AreEqual(0,  FForm.GetCounter.GetValue, 'Counter should start at 0.');
end;

procedure TTestCounter.TestClickerClick;
begin
  // First, assert that the initial value is 0
  Assert.AreEqual(0, FForm.GetCounter.GetValue, 'Counter should be 0 before click.');

  // Simulate a button click
  FForm.ClickerClick(nil);

  // Assert that the value is now 1 after the click
  Assert.AreEqual(1, FForm.GetCounter.GetValue, 'Counter should be 1 after click.');
end;


initialization
  TDUnitX.RegisterTestFixture(TTestCounter);

end.
