// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
// JCL_DEBUG_EXPERT_INSERTJDBG OFF
program VSoftSystemConsoleDemo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Console.Windows,
  System.Console.ConsoleStream,
  System.Console.InternalTypes,
  System.Console,
  System.Console.Platform,
  System.Console.Posix,
  System.Console.StreamWriter,
  System.Console.SyncTextReader,
  System.Console.Types;

const
   ESC = #27;    // \x1b
   CSI = #27#91; // \x1b[
   CSI_CLEARSCREEN = CSI + '2J';
   CSI_USE_ALT_BUFFER = CSI + '?1049h';
   CSI_USE_MAIN_BUFFER = CSI + '?1049l';

procedure CancelProc(const Sender : TObject; const args : TConsoleCancelEventArgs);
begin
  Console.WriteLine('CancelProc Called : ' + IntToStr(Ord(args.SpecialKey)));
  //args.Cancel := true; //set to true will stop app from closing
  Console.Write(CSI_USE_MAIN_BUFFER);
end;


begin
  try
    Console.Write(CSI_USE_ALT_BUFFER);
    Console.Title := 'VSoft.System.Console.Demo';
    try
      Console.CancelKeyPress := CancelProc;
      Console.SetWindowSize(160,40);
      Console.SetColors(TConsoleColor.Yellow, TConsoleColor.DarkBlue);
      Console.Clear;
      Console.SetCursorPosition(20,0);
      Console.WriteLine('abcdef');
      Sleep(500);
      Console.MoveBufferArea(20,0,6,1,20,1);
      Sleep(500);
      Console.CursorSize := 5;
      Console.Clear;
      Console.WriteLine('Ctrl+C to close');
  //    Console.SetCursorPosition(10,20);
      Console.WriteLine(Format('Left %d Top %d Width %d Height %d',[Console.WindowLeft,Console.WindowTop, Console.WindowWidth, Console.WindowHeight]));
      Sleep(1000);
      Console.SetWindowPosition(100,50);
      Console.SetCursorPosition(0,1);
      Console.WriteLine(Format('Left %d Top %d Width %d Height %d',[Console.WindowLeft,Console.WindowTop, Console.WindowWidth, Console.WindowHeight]));

      Sleep(2000);

      Console.Write(CSI_CLEARSCREEN);
      Console.WriteLine('Ctrl+C to close');
      while true do
        Sleep(200);

    finally
      Console.Write(CSI_USE_MAIN_BUFFER);
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
