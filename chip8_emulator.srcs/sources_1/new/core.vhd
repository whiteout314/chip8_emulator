----------------------------------------------------------------------------------
-- School:  Florida International University
-- Engineer: Carlos Almagro, Jose Correa, Daniel Picado
-- 
-- Create Date: 07/16/2025 08:19:12 PM
-- Design Name:  
-- Module Name: core - Behavioral
-- Project Name:   CHIP8
-- Target Devices: Zybo Z7-20
-- Tool Versions: 0.0.1
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity core is
    Port (
        clk : in std_logic;
        clear_screen: inout std_logic
    );

end core;

architecture Behavioral of core is
    component cache 
        port (
            clk: in std_logic;
            memory_addr: in std_logic_vector(15 downto 0); 
            memory_write: inout std_logic;
            memory_data_in: in std_logic_vector(7 downto 0); 
            memory_data_out_lsb: out std_logic_vector(7 downto 0);
            memory_data_out_msb: out std_logic_vector(7 downto 0);
            stack_addr: in std_logic_vector(15 downto 0); 
            stack_write: inout std_logic; 
            stack_data_in: in std_logic_vector(7 downto 0);
            stack_data_out: out std_logic_vector(7 downto 0)
        );
    end component;
    
    component registers
        port (
            clk: in std_logic;
            RA_write: inout std_logic;
            RA_data_in: in std_logic_vector (7 downto 0); 
            RA_data_out: out std_logic_vector (7 downto 0); 
            RA_addr: in std_logic_vector(7 downto 0);
            RB_write: inout std_logic;
            RB_data_in: in std_logic_vector (7 downto 0);
            RB_data_out: out std_logic_vector(7 downto 0);
            RB_addr: in std_logic_vector (3 downto 0)
        );
    end component;
    
    component flag 
        port (
            clk: in std_logic;
            flag_write: inout std_logic;
            flag_status_in: in std_logic;
            flag_status_out: out std_logic
        );
     end component;

    -- Control FSM stages
    type mode is (FETCH, DECODE, EXECUTE, WRITE);
    signal stage : mode := FETCH;

    -- CHIP-8 instruction types
    type instruction is (
        OP_CLS, OP_RET, OP_SYS, OP_JP, OP_CALL,
        OP_SNE, OP_SE, OP_AND, OP_LD, OP_OR, 
        OP_XOR, OP_ADD, OP_SUB, OP_SHR, OP_SUBN, OP_SHL,
        OP_RND, OP_DRW, OP_SKP, OP_SKNP
    );
    signal state : instruction := OP_CLS;
    --- Instruction fields 
    signal opcode : std_logic_vector(15 downto 0) := X"0000";
    signal PC     : std_logic_vector(15 downto 0) := X"0000"; 
    signal SP     : std_logic_vector(15 downto 0) := X"0000";
    signal X      : std_logic_vector(3 downto 0) := X"0";
    signal I      : std_logic_vector(15 downto 0) := x"0000";
    signal Y      : std_logic_vector(3 downto 0) := X"0"; 
    signal NNN    : std_logic_vector(11 downto 0) := X"000";
    signal KK     : std_logic_vector(7 downto 0) := X"00";
    --- data path signal
    signal data_path_msb : std_logic_vector(4 downto 0);
    signal data_path_lsb : std_logic_vector(4 downto 0);
    --- Register control 
    signal RA_write: std_logic;
    signal RA_data_in: std_logic_vector (7 downto 0);
    signal RA_data_out: std_logic_vector (7 downto 0);
    signal RA_addr: std_logic_vector(7 downto 0);
    signal RB_write: std_logic;
    signal RB_data_in: std_logic_vector(7 downto 0);
    signal RB_data_out: std_logic_vector(7 downto 0);
    signal RB_addr: std_logic_vector(3 downto 0);
    -- Flag control
    signal flag_write: std_logic; 
    signal flag_status_in: std_logic;
    signal flag_status_out: std_logic;
    --- Timers
    signal delay_timer: std_logic_vector(7 downto 0);
    signal sound_timer: std_logic_vector(7 downto 0);
    --- Cache
    signal memory_addr: std_logic_vector(15 downto 0);
    signal memory_write: std_logic;
    signal memory_data_in: std_logic_vector(7 downto 0);
    signal memory_data_out_lsb: std_logic_vector(7 downto 0);
    signal memory_data_out_msb: std_logic_vector(7 downto 0); 
    signal stack_addr: std_logic_vector(15 downto 0); 
    signal stack_write: std_logic; 
    signal stack_data_in: std_logic_vector(7 downto 0); 
    signal stack_data_out: std_logic_vector(7 downto 0);
begin

    processor : process(clk)
    begin
        if rising_edge(clk) then
            case stage is
                when FETCH => 
                    --- Fetch OP Instruction --- 
                    memory_addr <= PC;
                    if rising_edge(clk) then
                        opcode <= std_logic_vector(shift_left(unsigned(memory_data_out_msb), 8) or unsigned(memory_data_out_lsb));
                    end if;
                when DECODE =>
                    
                    X <= opcode(11 downto 8);
                    RA_addr <= X;
                    Y   <= opcode(7 downto 4);
                    RB_addr <= Y;
                    NNN <= opcode(11 downto 0);
                    KK  <= opcode(7 downto 0);
                    data_path_msb <= opcode(15 downto 11);
                    data_path_lsb <= opcode(4 downto 0);
                    
                    case opcode(15 downto 12) is
                    
                        when X"0" =>
                            case opcode(3 downto 0) is
                                when X"0" => state <= OP_CLS;
                                when X"E" => state <= OP_RET;
                                when others => state <= OP_SYS;
                            end case;

                        when X"1" => state <= OP_JP;
                        when X"2" => state <= OP_CALL;
                        when X"3" => state <= OP_SE;
                        when X"4" => state <= OP_SNE;
                        when X"5" => state <= OP_SE;
                        when X"6" => state <= OP_SNE;
                        when X"7" => state <= OP_ADD;

                        when X"8" =>
                            case opcode(3 downto 0) is
                                when X"0" => state <= OP_LD;
                                when X"1" => state <= OP_OR;
                                when X"2" => state <= OP_AND;
                                when X"3" => state <= OP_XOR;
                                when X"4" => state <= OP_ADD;
                                when X"5" => state <= OP_SUB;
                                when X"6" => state <= OP_SHR;
                                when X"7" => state <= OP_SUBN;
                                when X"E" => state <= OP_SHL;
                                when others => null;
                            end case;

                        when X"A" => state <= OP_LD;
                        when X"B" => state <= OP_JP;
                        when X"C" => state <= OP_RND;
                        when X"D" => state <= OP_DRW;
                        when others => null;
                    end case;

                    stage <= EXECUTE;

                when EXECUTE =>
                --- CLS [-] --- IMPLEMENTED
                --- RET [-] --- NOT IMPLEMENTED
                --- SYS [-] --- NOT IMPLEMENTED
                --- JP addr [1nnn] --- IMPLEMENTED (via data_path_msb = X"1")
                --- CALL addr [2nnn] --- NOT IMPLEMENTED
                --- SE Vx, byte [3xkk] --- IMPLEMENTED (data_path_msb = X"3")
                --- SNE Vx, byte [4xkk] --- IMPLEMENTED (data_path_msb = X"4")
                --- SE Vx, Vy [5xy0] --- IMPLEMENTED (data_path_msb = X"5")
                --- LD Vx, byte [6xkk] --- IMPLEMENTED (data_path_msb = X"6")
                --- ADD Vx, byte [7xkk] --- IMPLEMENTED (data_path_msb = X"7")
                --- LD Vx, Vy [8xy0] --- IMPLEMENTED (data_path_msb = X"8", lsb = X"0")
                --- OR Vx, Vy [8xy1] --- IMPLEMENTED (data_path_msb = X"8", lsb = X"1")
                --- AND Vx, Vy [8xy2] --- IMPLEMENTED (data_path_msb = X"8", lsb = X"2")
                --- XOR Vx, Vy [8xy3] --- IMPLEMENTED (data_path_msb = X"8", lsb = X"3")
                --- ADD Vx, Vy [8xy4] --- IMPLEMENTED (data_path_msb = X"8", lsb = X"4")
                --- SUB Vx, Vy [8xy5] --- IMPLEMENTED (data_path_msb = X"8", lsb = X"5")
                --- SHR Vx {, Vy} [8xy6] --- IMPLEMENTED
                --- SUBN Vx, Vy [8xy7] --- IMPLEMENTED (data_path_msb = X"8", lsb = X"7")
                --- SHL Vx {, Vy} [8xyE] --- IMPLEMENTED
                --- LD I, addr [Annn] --- IMPLEMENTED (data_path_msb = X"A")
                --- JP V0, addr [Bnnn] --- IMPLEMENTED (data_path_msb = X"B")
                --- RND Vx, byte [Cxkk] --- NOT IMPLEMENTED
                --- DRW Vx, Vy, nibble [Dxyn] --- NOT IMPLEMENTED
                --- SKP Vx [Ex9E] --- NOT IMPLEMENTED
                --- SKNP Vx [ExA1] --- NOT IMPLEMENTED
                --- LD Vx, DT [Fx07] --- IMPLEMENTED (data_path_msb = X"F", lsb = X"07")
                --- LD Vx, K [Fx0A] --- NOT IMPLEMENTED
                --- LD DT, Vx [Fx15] --- IMPLEMENTED (data_path_msb = X"F", lsb = X"15")
                --- LD ST, Vx [Fx18] --- IMPLEMENTED (data_path_msb = X"F", lsb = X"18")
                --- ADD I, Vx [Fx1E] --- IMPLEMENTED (data_path_msb = X"F", lsb = X"1E")
                --- LD F, Vx [Fx29] --- NOT IMPLEMENTED
                --- LD B, Vx [Fx33] --- NOT IMPLEMENTED
                --- LD [I], Vx [Fx55] --- IMPLEMENTED
                --- LD Vx, [I] [Fx65] --- NOT IMPLEMENTED
                    case state is
                        when OP_CLS => 
                            clear_screen <= '1';
                        when OP_SE =>
                            if RA_data_out = RB_data_out then
                                PC <= std_logic_vector(unsigned(PC) + 2);
                            end if;
                        when OP_SNE =>  
                            if RA_data_out /= RB_data_out then 
                                PC <= std_logic_vector(unsigned(PC) + 2);
                            end if;  
                        when OP_AND =>
                            RA_data_in <= RA_data_out and RB_data_out;  -- ⚠ FIX THIS: should be values of Vx and Vy, not indices
                            RA_addr  <= X;
                            RA_write <= '1';
                        when OP_OR =>
                            RA_data_in <= RA_data_out or RB_data_out;
                            RA_addr <= X;
                            RA_write <= '1';
                        when OP_XOR => 
                            RA_data_in <= RA_data_out xor RB_data_out;
                            RA_addr <= X;
                            RA_write <= '1';
                        when OP_ADD =>
                            case data_path_msb is 
                                when X"7" =>
                                    RA_data_in <= std_logic_vector(unsigned(RA_data_out) + unsigned(KK));
                                    RA_write <= '1';
                                when X"8" => 
                                    if unsigned(RA_data_out) + unsigned(RB_data_out) > 254 then 
                                        flag_write <= '1';
                                        flag_status_in <= '1';
                                    else
                                        flag_write <= '1';
                                        flag_status_in <= '0';
                                    end if; 
                                    RA_data_in <= std_logic_vector(unsigned(RA_data_out) + unsigned(RB_data_out));
                                    RA_addr <= X;
                                    RA_write <= '1';
                                 when x"F" => 
                                    I <= std_logic_vector(unsigned(I) + unsigned(RA_data_out));   
                            end case;
                        when OP_LD => 
                            case data_path_msb is 
                                when X"6" => 
                                    RA_data_in <= KK;
                                    RA_write <= '1';
                                when X"8" => 
                                    RA_data_in <= RB_data_in;
                                    RA_write <= '1';
                                when x"A" => 
                                    I <= NNN;
                                when x"F" => 
                                    case data_path_lsb is 
                                        when X"07" => 
                                            RA_data_in <= delay_timer;
                                            RA_write <= '1';
                                        when X"0A" => null;
                                        when x"55" => 
                                            if rising_edge(clk) then
                                                memory_addr  <= I;
                                                memory_data_in <= RA_data_in;
                                                memory_write <= '1';
                                            end if;
                                            if rising_edge(clk) then
                                                memory_addr  <= std_logic_vector(unsigned(I));
                                                memory_data_in <= std_logic_vector(unsigned(RA_data_in) mod 10);
                                                memory_write <= '1';
                                            end if;
                                            if rising_edge(clk) then
                                                memory_addr  <= std_logic_vector(unsigned(I) + 1);
                                                memory_data_in <= std_logic_vector((unsigned(RA_data_in) mod 100) / 10);
                                                memory_write <= '1';
                                            end if;
                                            if rising_edge(clk) then
                                                memory_addr  <= std_logic_vector(unsigned(I) + 2);
                                                memory_data_in <= std_logic_vector((unsigned(RA_data_in) mod 1000) / 100);
                                                memory_write <= '1';
                                            end if;
                                        when X"15" => 
                                            delay_timer <= RA_data_out;
                                        when X"18" => 
                                            sound_timer <= RA_data_out;
                                        when X"9" => null; 
                                        
                                    end case;
                            end case;
                        when OP_SHL => 
                            if (RA_data_in(7) = '1') then
                                flag_status_in <= '1';
                            else
                                flag_status_in <= '0';
                            end if;
                            flag_write <= '1';
                            RA_data_in <= std_logic_vector(shift_left(unsigned(RA_data_out), 1));
                        when OP_SHR => 
                            if (RA_data_in(0) = '1') then
                                flag_status_in <= '1';
                            else
                                flag_status_in <= '0';
                            end if;
                            flag_write <= '1';
                             RA_data_in <= std_logic_vector(shift_right(unsigned(RA_data_out), 1));
                        when OP_JP => 
                            case data_path_msb is 
                                when X"1" => PC <= NNN;
                                when X"B" => PC <= std_logic_vector(unsigned(RA_data_out) + unsigned(NNN)); 
                            end case;                       
                        when OP_SUB => 
                            case data_path_lsb is
                               when X"5" =>   
                                    if unsigned(RA_data_out) > unsigned(RB_data_out) then
                                        flag_write <= '1';
                                        flag_status_in <= '1';
                                    else 
                                        flag_write <= '1';
                                        flag_status_in <= '0';
                                    end if;
                                    RA_data_in <= std_logic_vector(unsigned(RA_data_out) + unsigned(RB_data_out));
                                    RA_addr <= x;
                                    RA_write <= '1';
                              when X"7" => 
                                    if unsigned(RB_data_out) > unsigned(RA_data_out) then
                                        flag_write <= '1';
                                        flag_status_in <= '1';
                                    else 
                                        flag_write <= '1';
                                        flag_status_in <= '0';
                                    end if;
                                    RA_data_in <= std_logic_vector(unsigned(RB_data_out) + unsigned(RA_data_out));
                                    RA_addr <= x;
                                    RA_write <= '1';
                              
                            end case;
                        when others => null;
                    end case;
                    stage <= WRITE;
                 when WRITE => null;
            end case;
           
        end if;
    end process;
    
    
    registers_access: registers 
        port map(
            clk => clk,
            RA_write => RA_write,
            RA_data_in => RA_data_in,
            RA_data_out => RA_data_out,
            RA_addr => RA_addr,
            RB_write => RB_write,
            RB_data_in => RB_data_in,
            RB_data_out => RB_data_out,
            RB_addr => RB_addr
        ); 
    cache_access: cache 
        port map (
            clk => clk,
            memory_addr => memory_addr,
            memory_write => memory_write,
            memory_data_in => memory_data_in,
            memory_data_out_lsb => memory_data_out_lsb, 
            memory_data_out_msb => memory_data_out_msb,
            stack_addr => stack_addr,
            stack_write => stack_write,
            stack_data_in => stack_data_in,
            stack_data_out => stack_data_out
        );
    flag_access: flag 
        port map (
            clk => clk,
            flag_write => flag_write,
            flag_status_in => flag_status_in,
            flag_status_out => flag_status_out
        );
     
end Behavioral;
