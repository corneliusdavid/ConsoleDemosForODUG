program ConsoleOut;

{$APPTYPE CONSOLE}

{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF}

{$R *.res}

uses
  SysUtils,
  Quick.Commons,
  Quick.Console;

const
  max = 20;
begin
  try
    coutXY(20,10,'this line will be replaced by the next',etInfo);
    coutXY(20,10,'this line replaces previous',etSuccess);
    cout('Normal line 1',etInfo);
    coutBL('bottom line: 1',etInfo);
    cout('Normal line 2',etInfo);
    coutXY(10,5,'I''m here',etSuccess);
    coutBL('bottom line: 2',etInfo);
    cout('Normal line 3',etInfo);
    coutBL('bottomline: 3',etInfo);

    for var i := 0 to max do begin
      coutXY(i*2, 25, 'Wasn''t that nifty?  Press ENTER to quit.', TConsoleColor.ccYellow, True);
      sleep(200);
    end;
    for var i := max downto 1 do begin
      coutXY(i*2, 25, 'Wasn''t that nifty?  Press ENTER to quit.', TConsoleColor.ccYellow, True);
      sleep(200);
    end;
    coutXY(0, 25, 'Wasn''t that nifty?  Press ENTER to quit.', TConsoleColor.ccYellow, True);

    ConsoleWaitForEnterKey;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
