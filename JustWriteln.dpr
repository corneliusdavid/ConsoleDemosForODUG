program JustWriteln;

{$APPTYPE CONSOLE}

{$R *.res}

const
   ESC = #27;          // escape
   CSI = ESC + '[';    // control sequence inducer

   Red = '9';
   Blue = '19';
   Green = '40';
   Yellow = '190';


function ForegroundColor(c: string): string;
begin
  Result := CSI + '38;5;' + c + 'm';
end;

function BackgroundColor(c: string): string;
begin
  Result := CSI + '48;5;' + c + 'm';
end;

function ResetSettings: string;
begin
  Result := CSI + '0m';
end;

begin
  Writeln('|' + BackgroundColor(Blue) + ForegroundColor(Yellow) + '######################' + ResetSettings + '|');
  Writeln('|' + BackgroundColor(Blue) + ForegroundColor(Green)  + '     Green Hello!     ' + ResetSettings + '|');
  Writeln('|' + BackgroundColor(Blue) + ForegroundColor(Red)    + '   Good-Bye in Red.   ' + ResetSettings + '|');
  Writeln('|' + BackgroundColor(Blue) + ForegroundColor(Yellow) + '######################' + ResetSettings + '|');

  Readln;
end.
