library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ROM_M6 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(9 downto 0);
	data : out std_logic_vector(3 downto 0)
);
end entity;

architecture prom of ROM_M6 is
	type rom is array(0 to  1023) of std_logic_vector(3 downto 0);
	signal rom_data: rom := (
		X"0",X"0",X"0",X"0",X"E",X"F",X"B",X"1",X"1",X"1",X"5",X"F",X"F",X"1",X"1",X"F",
		X"0",X"0",X"0",X"0",X"E",X"F",X"B",X"9",X"1",X"1",X"5",X"F",X"F",X"8",X"9",X"F",
		X"0",X"0",X"0",X"0",X"8",X"C",X"6",X"2",X"3",X"1",X"7",X"F",X"9",X"8",X"B",X"F",
		X"0",X"0",X"0",X"0",X"3",X"B",X"D",X"6",X"3",X"1",X"B",X"E",X"C",X"6",X"F",X"B",
		X"0",X"0",X"0",X"0",X"3",X"B",X"D",X"6",X"3",X"7",X"E",X"C",X"6",X"B",X"D",X"C",
		X"0",X"0",X"0",X"0",X"6",X"7",X"C",X"6",X"3",X"1",X"B",X"E",X"7",X"5",X"E",X"6",
		X"0",X"0",X"0",X"0",X"C",X"E",X"8",X"F",X"1",X"3",X"B",X"F",X"1",X"3",X"3",X"1",
		X"0",X"0",X"0",X"0",X"C",X"C",X"0",X"F",X"1",X"3",X"1",X"F",X"3",X"8",X"9",X"1",
		X"0",X"0",X"0",X"0",X"C",X"C",X"0",X"F",X"3",X"7",X"3",X"F",X"0",X"C",X"C",X"0",
		X"0",X"0",X"0",X"0",X"1",X"9",X"8",X"3",X"F",X"1",X"3",X"1",X"F",X"0",X"C",X"C",
		X"0",X"0",X"0",X"0",X"1",X"3",X"3",X"1",X"F",X"B",X"3",X"1",X"F",X"8",X"E",X"C",
		X"0",X"0",X"0",X"0",X"6",X"E",X"5",X"7",X"E",X"B",X"1",X"3",X"6",X"C",X"7",X"6",
		X"0",X"0",X"0",X"0",X"C",X"D",X"B",X"6",X"C",X"E",X"7",X"3",X"6",X"D",X"B",X"3",
		X"0",X"0",X"0",X"0",X"B",X"F",X"6",X"C",X"E",X"B",X"1",X"3",X"6",X"D",X"B",X"3",
		X"0",X"0",X"0",X"0",X"E",X"B",X"8",X"9",X"F",X"7",X"1",X"3",X"2",X"6",X"C",X"8",
		X"0",X"0",X"0",X"0",X"F",X"9",X"8",X"F",X"F",X"5",X"1",X"1",X"9",X"B",X"F",X"E",
		X"0",X"0",X"0",X"0",X"F",X"1",X"1",X"F",X"F",X"5",X"1",X"1",X"1",X"B",X"F",X"E",
		X"0",X"0",X"0",X"0",X"F",X"9",X"1",X"F",X"F",X"A",X"8",X"8",X"9",X"D",X"F",X"7",
		X"0",X"0",X"0",X"0",X"7",X"D",X"1",X"9",X"F",X"E",X"8",X"C",X"4",X"6",X"3",X"1",
		X"0",X"0",X"0",X"0",X"D",X"F",X"6",X"3",X"7",X"D",X"8",X"C",X"6",X"B",X"D",X"C",
		X"0",X"0",X"0",X"0",X"3",X"B",X"D",X"6",X"3",X"7",X"E",X"C",X"6",X"B",X"D",X"C",
		X"0",X"0",X"0",X"0",X"6",X"7",X"A",X"E",X"7",X"D",X"8",X"C",X"6",X"3",X"E",X"6",
		X"0",X"0",X"0",X"0",X"8",X"C",X"C",X"8",X"F",X"D",X"C",X"8",X"F",X"1",X"7",X"3",
		X"0",X"0",X"0",X"0",X"8",X"9",X"1",X"C",X"F",X"8",X"C",X"8",X"F",X"0",X"3",X"3",
		X"0",X"0",X"0",X"0",X"3",X"3",X"0",X"F",X"C",X"E",X"C",X"F",X"0",X"3",X"3",X"0",
		X"0",X"0",X"0",X"0",X"3",X"3",X"0",X"F",X"8",X"C",X"8",X"F",X"C",X"1",X"9",X"8",
		X"0",X"0",X"0",X"0",X"3",X"7",X"1",X"F",X"8",X"C",X"D",X"F",X"8",X"C",X"C",X"8",
		X"0",X"0",X"0",X"0",X"6",X"E",X"3",X"6",X"C",X"8",X"D",X"7",X"E",X"A",X"7",X"6",
		X"0",X"0",X"0",X"0",X"C",X"D",X"B",X"6",X"C",X"E",X"7",X"3",X"6",X"D",X"B",X"3",
		X"0",X"0",X"0",X"0",X"C",X"D",X"B",X"6",X"C",X"8",X"D",X"7",X"3",X"6",X"F",X"D",
		X"0",X"0",X"0",X"0",X"1",X"3",X"6",X"4",X"C",X"8",X"E",X"F",X"9",X"1",X"D",X"F",
		X"0",X"0",X"0",X"0",X"7",X"F",X"D",X"9",X"8",X"8",X"A",X"F",X"F",X"1",X"9",X"F",
		X"0",X"0",X"0",X"0",X"E",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",
		X"0",X"0",X"0",X"0",X"E",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",
		X"0",X"0",X"0",X"0",X"8",X"C",X"E",X"E",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",
		X"0",X"0",X"0",X"0",X"3",X"B",X"D",X"E",X"F",X"F",X"F",X"F",X"F",X"7",X"F",X"B",
		X"0",X"0",X"0",X"0",X"3",X"B",X"D",X"E",X"F",X"F",X"F",X"F",X"7",X"B",X"D",X"C",
		X"0",X"0",X"0",X"0",X"6",X"7",X"C",X"E",X"F",X"F",X"F",X"F",X"7",X"5",X"E",X"6",
		X"0",X"0",X"0",X"0",X"C",X"E",X"8",X"F",X"F",X"F",X"F",X"F",X"1",X"3",X"3",X"1",
		X"0",X"0",X"0",X"0",X"C",X"C",X"0",X"F",X"F",X"F",X"F",X"F",X"3",X"8",X"9",X"1",
		X"0",X"0",X"0",X"0",X"C",X"C",X"0",X"F",X"F",X"F",X"F",X"F",X"0",X"C",X"C",X"0",
		X"0",X"0",X"0",X"0",X"1",X"9",X"8",X"3",X"F",X"F",X"F",X"F",X"F",X"0",X"C",X"C",
		X"0",X"0",X"0",X"0",X"1",X"3",X"3",X"1",X"F",X"F",X"F",X"F",X"F",X"8",X"E",X"C",
		X"0",X"0",X"0",X"0",X"6",X"E",X"5",X"7",X"F",X"F",X"F",X"F",X"E",X"C",X"7",X"6",
		X"0",X"0",X"0",X"0",X"C",X"D",X"B",X"7",X"F",X"F",X"F",X"F",X"E",X"D",X"B",X"3",
		X"0",X"0",X"0",X"0",X"B",X"F",X"7",X"F",X"F",X"F",X"F",X"F",X"E",X"D",X"B",X"3",
		X"0",X"0",X"0",X"0",X"E",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"E",X"E",X"C",X"8",
		X"0",X"0",X"0",X"0",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"E",
		X"0",X"0",X"0",X"0",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"E",
		X"0",X"0",X"0",X"0",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"7",
		X"0",X"0",X"0",X"0",X"7",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"7",X"7",X"3",X"1",
		X"0",X"0",X"0",X"0",X"D",X"F",X"E",X"F",X"F",X"F",X"F",X"F",X"7",X"B",X"D",X"C",
		X"0",X"0",X"0",X"0",X"3",X"B",X"D",X"E",X"F",X"F",X"F",X"F",X"7",X"B",X"D",X"C",
		X"0",X"0",X"0",X"0",X"6",X"7",X"A",X"E",X"F",X"F",X"F",X"F",X"7",X"3",X"E",X"6",
		X"0",X"0",X"0",X"0",X"8",X"C",X"C",X"8",X"F",X"F",X"F",X"F",X"F",X"1",X"7",X"3",
		X"0",X"0",X"0",X"0",X"8",X"9",X"1",X"C",X"F",X"F",X"F",X"F",X"F",X"0",X"3",X"3",
		X"0",X"0",X"0",X"0",X"3",X"3",X"0",X"F",X"F",X"F",X"F",X"F",X"0",X"3",X"3",X"0",
		X"0",X"0",X"0",X"0",X"3",X"3",X"0",X"F",X"F",X"F",X"F",X"F",X"C",X"1",X"9",X"8",
		X"0",X"0",X"0",X"0",X"3",X"7",X"1",X"F",X"F",X"F",X"F",X"F",X"8",X"C",X"C",X"8",
		X"0",X"0",X"0",X"0",X"6",X"E",X"3",X"7",X"F",X"F",X"F",X"F",X"E",X"A",X"7",X"6",
		X"0",X"0",X"0",X"0",X"C",X"D",X"B",X"7",X"F",X"F",X"F",X"F",X"E",X"D",X"B",X"3",
		X"0",X"0",X"0",X"0",X"C",X"D",X"B",X"7",X"F",X"F",X"F",X"F",X"F",X"E",X"F",X"D",
		X"0",X"0",X"0",X"0",X"1",X"3",X"7",X"7",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",
		X"0",X"0",X"0",X"0",X"7",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F",X"F");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
