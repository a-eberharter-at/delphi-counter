object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 494
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object ClickCounter: TLabel
    Left = 284
    Top = 24
    Width = 6
    Height = 15
    Alignment = taCenter
    Caption = '0'
  end
  object Clicker: TButton
    Left = 284
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Click Me!'
    TabOrder = 0
    OnClick = ClickerClick
  end
  object Panel1: TPanel
    Left = 56
    Top = 184
    Width = 569
    Height = 145
    TabOrder = 1
    Visible = False
    object Label2: TLabel
      Left = 8
      Top = 11
      Width = 27
      Height = 15
      Caption = 'Shop'
    end
    object Panel2: TPanel
      Left = 8
      Top = 32
      Width = 553
      Height = 41
      TabOrder = 0
      Visible = False
      object Label1: TLabel
        Left = 343
        Top = 13
        Width = 208
        Height = 15
        Caption = 'Cost: 20 Clicks | Efficiency: 1 Click / sec '
      end
      object Label3: TLabel
        Left = 213
        Top = 13
        Width = 12
        Height = 15
        Caption = '0x'
      end
      object BuyClickGenerator: TButton
        Left = 13
        Top = 8
        Width = 193
        Height = 25
        Caption = 'Buy Click Generator (20 Clicks)'
        Enabled = False
        TabOrder = 0
        OnClick = BuyClickGeneratorClick
      end
    end
  end
  object Panel3: TPanel
    Left = 56
    Top = 112
    Width = 569
    Height = 66
    TabOrder = 2
    Visible = False
    object Label4: TLabel
      Left = 8
      Top = 29
      Width = 32
      Height = 15
      Caption = 'Cps: 0'
      Visible = False
    end
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 25
      Height = 15
      Caption = 'Stats'
    end
  end
  object GameloopTimer: TTimer
    OnTimer = OnTimer
    Left = 32
    Top = 8
  end
end
