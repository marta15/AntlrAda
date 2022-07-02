--
-- Simple array example.
--
with Gnat.Io; use Gnat.Io;
procedure Arr1 is
   A: array(1..5) of Integer;   -- Array subscripts 1 to 5.
   I: Integer;
begin
   -- Read 'em in.
   for I in range 1..5 loop
      Put("> ");
      Get(A(I));
   end loop;

end Arr1;
