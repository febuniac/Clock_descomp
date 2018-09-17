-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition"
-- CREATED		"Sun Sep 16 23:13:55 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY diagrama_de_blocos_relogio IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		reg_us_reset :  IN  STD_LOGIC;
		reg_us_enable :  IN  STD_LOGIC;
		reg_ds_reset :  IN  STD_LOGIC;
		reg_ds_enable :  IN  STD_LOGIC;
		reg_um_reset :  IN  STD_LOGIC;
		reg_um_enable :  IN  STD_LOGIC;
		reg_dm_reset :  IN  STD_LOGIC;
		reg_dm_enable :  IN  STD_LOGIC;
		reg_dh_enable :  IN  STD_LOGIC;
		reg_dh_reset :  IN  STD_LOGIC;
		reg_uh_enable :  IN  STD_LOGIC;
		reg_uh_reset :  IN  STD_LOGIC;
		mux_abs_control :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		mux_reg_control :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		ula_control :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		v_0 :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		v_1 :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		v_2 :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		v_4 :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		v_6 :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		v_9 :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		out_mux_reg :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		out_ula :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		reg_us :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END diagrama_de_blocos_relogio;

ARCHITECTURE bdf_type OF diagrama_de_blocos_relogio IS 

COMPONENT registrador
GENERIC (Vector_Size : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ula
	PORT(clk : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 func : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 flag : OUT STD_LOGIC;
		 Q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux_6x1
	PORT(A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 C : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 D : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 E : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 F : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 SEL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(4 DOWNTO 0);


BEGIN 
out_mux_reg <= SYNTHESIZED_WIRE_4;
out_ula <= SYNTHESIZED_WIRE_14;
reg_us <= SYNTHESIZED_WIRE_5;



b2v_DH : registrador
GENERIC MAP(Vector_Size => 5
			)
PORT MAP(clk => CLK,
		 enable => reg_dh_enable,
		 reset => reg_dh_reset,
		 d => SYNTHESIZED_WIRE_14,
		 q => SYNTHESIZED_WIRE_10);


b2v_DM : registrador
GENERIC MAP(Vector_Size => 5
			)
PORT MAP(clk => CLK,
		 enable => reg_dm_enable,
		 reset => reg_dm_reset,
		 d => SYNTHESIZED_WIRE_14,
		 q => SYNTHESIZED_WIRE_8);


b2v_DS : registrador
GENERIC MAP(Vector_Size => 5
			)
PORT MAP(clk => CLK,
		 enable => reg_ds_enable,
		 reset => reg_ds_reset,
		 d => SYNTHESIZED_WIRE_14,
		 q => SYNTHESIZED_WIRE_6);


b2v_inst : ula
PORT MAP(clk => CLK,
		 A => SYNTHESIZED_WIRE_3,
		 B => SYNTHESIZED_WIRE_4,
		 func => ula_control,
		 Q => SYNTHESIZED_WIRE_14);


b2v_mux_das_constantes : mux_6x1
PORT MAP(A => v_1,
		 B => v_2,
		 C => v_4,
		 D => v_6,
		 E => v_9,
		 F => v_0,
		 SEL => mux_abs_control,
		 Y => SYNTHESIZED_WIRE_3);


b2v_mux_dos_registradores : mux_6x1
PORT MAP(A => SYNTHESIZED_WIRE_5,
		 B => SYNTHESIZED_WIRE_6,
		 C => SYNTHESIZED_WIRE_7,
		 D => SYNTHESIZED_WIRE_8,
		 E => SYNTHESIZED_WIRE_9,
		 F => SYNTHESIZED_WIRE_10,
		 SEL => mux_reg_control,
		 Y => SYNTHESIZED_WIRE_4);


b2v_UH : registrador
GENERIC MAP(Vector_Size => 5
			)
PORT MAP(clk => CLK,
		 enable => reg_uh_enable,
		 reset => reg_uh_reset,
		 d => SYNTHESIZED_WIRE_14,
		 q => SYNTHESIZED_WIRE_9);


b2v_UM : registrador
GENERIC MAP(Vector_Size => 5
			)
PORT MAP(clk => CLK,
		 enable => reg_um_enable,
		 reset => reg_um_reset,
		 d => SYNTHESIZED_WIRE_14,
		 q => SYNTHESIZED_WIRE_7);


b2v_US : registrador
GENERIC MAP(Vector_Size => 5
			)
PORT MAP(clk => CLK,
		 enable => reg_us_enable,
		 reset => reg_us_reset,
		 d => SYNTHESIZED_WIRE_14,
		 q => SYNTHESIZED_WIRE_5);
		 
process (clk)
begin
	-- Reset whenever the reset signal goes low, regardless of the clock
	-- or the clock enable
	if (SYNTHESIZED_WIRE_14 = "1010") then
		SYNTHESIZED_WIRE_14 <= (OTHERS => '0');
	-- If not resetting, and the clock signal is enabled on this register, 
	-- update the register output on the clock's rising edge
	end if;
end process;



END bdf_type;