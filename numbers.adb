--
-- Some numbers to come and go.
--
with Gnat.Io; use Gnat.Io;
procedure Numbers is
   Mike, Alice: Integer;
   John_Smith: Integer;
   F: Float := 1.0;
begin
   Put("Enter a number Mike: ");
   Get(Mike);
   Put("Enter a number Alice: ");
   Get(Alice);
   John_Smith := 3*Mike + 2*Alice + 11;
   Put("3*Mike + 2*Alice + 11 is ");
   Put(John_Smith);
   New_Line;

   John_Smith := 3*Mike + Alice + 1000000;
   Put("A million more than Mike and Alice ");
   Put(John_Smith);
   New_Line;

   F := Float(Mike) + 3.14159;
   New_Line;
end Numbers;
