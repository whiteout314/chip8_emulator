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
        clk: in std_logic;
        input : in std_logic;
        PC: inout std_logic_vector(3 downto 0)
    );

end core;

architecture Behavioral of core is
    type register_arr is array (0 to 14) of std_logic_vector (7 downto 0);
    signal VX: register_arr := (6 => x"22", others => (others => '0'));
    type mem_cell is array (0 to 1000) of std_logic_vector(7 downto 0);
    signal memory: mem_cell := (
    --- Load V0, V6
    0 => x"80", 1 => x"60",


    4 => x"70", 5 => x"22",
    
    -- Jump to wait loop (address 0x212)
    6 => x"10", 7 => x"00",
    others => (others => '0')  -- Fill rest with zeros; 
    );
    

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
    signal SP     : std_logic_vector(15 downto 0) := X"0000";
    signal X      : std_logic_vector(3 downto 0) := X"0";
    signal I      : std_logic_vector(15 downto 0) := x"0000";
    signal Y      : std_logic_vector(3 downto 0) := X"0"; 
    signal NNN    : std_logic_vector(11 downto 0) := X"000";
    signal KK     : std_logic_vector(7 downto 0) := X"00";
    signal N      : std_logic_vector(3 downto 0):= X"0";
    --- data path signal
    signal data_path_msb : std_logic_vector(3 downto 0) := x"0";
    signal data_path_lsb : std_logic_vector(3 downto 0) := x"0";
    --- Register control 
    signal RA_write: std_logic := '0';
    signal RA_data_in: std_logic_vector (7 downto 0) := x"00";
    signal RA_addr: std_logic_vector(3 downto 0) := x"0";
    signal RB_write: std_logic := '0';
    signal RB_data_in: std_logic_vector(7 downto 0) := x"00";
    signal RB_addr: std_logic_vector(3 downto 0) := x"0";
    -- Flag control
    signal flag_write: std_logic := '0'; 
    signal flag_status_in: std_logic := '0';
    signal flag_status_out: std_logic := '0';
    --- Timers
    signal delay_timer: std_logic_vector(7 downto 0);
    signal sound_timer: std_logic_vector(7 downto 0);
    signal pce : std_logic_vector(15 downto 0) := x"0000";
    
    --- Memory
    signal memory_addr: std_logic_vector(15 downto 0) := x"0000";
    signal memory_write: std_logic := '0';
    signal memory_data_in: std_logic_vector(7 downto 0) := x"00"; 
    signal memory_data_out_lsb: std_logic_vector(7 downto 0) := x"00";
    signal memory_data_out_msb: std_logic_vector(7 downto 0) := x"00";
    signal stack_addr: std_logic_vector(15 downto 0) := x"0000";
    signal stack_write: std_logic := '0';
    signal stack_data_in: std_logic_vector(7 downto 0) := x"00";
    signal stack_data_out: std_logic_vector(7 downto 0) := x"00";
    signal opcode : std_logic_vector(15 downto 0) := x"0000";
    constant TARGET_CYCLES : integer := 10_000_000;  -- 1 second at 100 MHz
    signal counter : integer range 0 to TARGET_CYCLES := 0;
    signal clk_en : std_logic := '0';
begin
    processor : process(clk)
    begin
        if rising_edge(clk) then 
            
            
                
            
            
            case stage is
                when FETCH => 
                    --- Fetch OP Instruction --- 
                    
                    opcode <= std_logic_vector(shift_left(resize(unsigned(memory(to_integer(unsigned(pce)))), 16), 8) or resize(unsigned(memory(to_integer(unsigned(pce) + 1))), 16));                   
                    PC <= pce(3 downto 0);
                    stage <= DECODE;
                    
                
                    
                 when DECODE => 
                    X <= opcode(11 downto 8);
                    RA_addr <= X;
                    Y   <= opcode(7 downto 4);
                    RB_addr <= Y;
                    NNN <= opcode(11 downto 0);
                    KK  <= opcode(7 downto 0);
                    N <= opcode(3 downto 0);
                    data_path_msb <= opcode(15 downto 12);
                    data_path_lsb <= opcode(3 downto 0);
                    
                    
               
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
                --- JP V0, addr [Bnnn] --- VX(to_integer(unsigned(RA_addr)))IMPLEMENTED (data_path_msb = X"B")
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
                        when OP_CLS => null;
                        when OP_SE =>
                            if VX(to_integer(unsigned(X))) = VX(to_integer(unsigned(Y))) then
                                PC <= std_logic_vector(unsigned(PC) + 2);
                            end if;
                        when OP_SNE =>  
                            if VX(to_integer(unsigned(X))) /= VX(to_integer(unsigned(Y))) then 
                                PC <= std_logic_vector(unsigned(PC) + 2);
                            end if;  
                        when OP_AND =>
                            VX(to_integer(unsigned(X))) <= VX(to_integer(unsigned(X))) and VX(to_integer(unsigned(Y)));  -- ⚠ FIX THIS: should be values of Vx and Vy, not indices
                            
                          
                        when OP_OR =>
                            VX(to_integer(unsigned(X))) <= VX(to_integer(unsigned(X))) or VX(to_integer(unsigned(Y)));
                            
                        when OP_XOR => 
                            VX(to_integer(unsigned(X))) <= VX(to_integer(unsigned(X))) xor VX(to_integer(unsigned(Y)));
                            
                        when OP_ADD =>
                            case data_path_msb is 
                                when X"7" =>
                                    VX(to_integer(unsigned(X))) <= std_logic_vector(unsigned(VX(to_integer(unsigned(X)))) + unsigned(KK));
                                    
                                when X"8" => 
                                    if unsigned(VX(to_integer(unsigned(X)))) + unsigned(VX(to_integer(unsigned(Y)))) > 254 then 
                                        flag_write <= '1';
                                        flag_status_in <= '1';
                                    else
                                        flag_write <= '1';
                                        flag_status_in <= '0';
                                    end if; 
                                    VX(to_integer(unsigned(X))) <= std_logic_vector(unsigned(VX(to_integer(unsigned(X)))) + unsigned(VX(to_integer(unsigned(Y)))));
                                  
                                    
                                 when x"F" => 
                                    I <= std_logic_vector(unsigned(I) + unsigned(VX(to_integer(unsigned(X))))); 
                                 when others => null;  
                            end case;
                        when OP_LD => 
                            case data_path_msb is 
                                when X"6" => 
                                    VX(to_integer(unsigned(X))) <= KK;
                                   
                                when X"8" => 
                                    VX(to_integer(unsigned(X))) <= VX(to_integer(unsigned(Y)));
                                    
                                when x"A" => 
                                    I <= std_logic_vector(resize(unsigned(NNN), 16));
                                when x"F" => 
                                    case data_path_lsb is 
                                        when X"7" => 
                                            VX(to_integer(unsigned(X))) <= delay_timer;
                                        when X"A" => null;
                                        when X"5" => 
                                            delay_timer <= VX(to_integer(unsigned(X)));
                                        when X"8" => 
                                            sound_timer <= VX(to_integer(unsigned(X)));
                                        when X"9" => null; 
                                        when others => null;
                                        
                                    end case;
                                 when others => null;
                            end case;
                        when OP_SHL => 
                            if (RA_data_in(7) = '1') then
                                flag_status_in <= '1';
                            else
                                flag_status_in <= '0';
                            end if;
                            flag_write <= '1';
                            VX(to_integer(unsigned(X))) <= std_logic_vector(shift_left(unsigned(VX(to_integer(unsigned(X)))), 1));
                        when OP_SHR => 
                            if (VX(to_integer(unsigned(X)))(0) = '1') then
                                flag_status_in <= '1';
                            else
                                flag_status_in <= '0';
                            end if;
                            flag_write <= '1';
                             VX(to_integer(unsigned(X))) <= std_logic_vector(shift_right(unsigned(VX(to_integer(unsigned(X)))), 1));
                        when OP_JP => 
                            case data_path_msb is 
                                when X"1" => pce <= std_logic_vector(resize(unsigned(NNN), 16));
                                when X"B" => pce <= std_logic_vector(unsigned(VX(to_integer(unsigned(X)))) + resize(unsigned(NNN), 16)); 
                                when others => null;
                            end case;  
                        when OP_DRW => NULL;              
                        when OP_SUB => 
                            case data_path_lsb is
                               when X"5" =>   
                                    if unsigned(VX(to_integer(unsigned(X)))) > unsigned(VX(to_integer(unsigned(Y)))) then
                                        flag_status_in <= '1';
                                    else 
                                        flag_status_in <= '0';
                                    end if;
                                    VX(to_integer(unsigned(X))) <= std_logic_vector(unsigned(VX(to_integer(unsigned(X)))) + unsigned(VX(to_integer(unsigned(Y)))));
                                    
                                   
                              when X"7" => 
                                    if unsigned(VX(to_integer(unsigned(Y)))) > unsigned(VX(to_integer(unsigned(X)))) then  
                                        flag_status_in <= '1';
                                    else 
                                        flag_status_in <= '0';
                                    end if;
                                   
                                    
                             when others => null;
                            end case;
                        when others => null;
                    end case;
                    stage <= WRITE;
                 when WRITE =>
                    pce <= std_logic_vector(unsigned(pce) + 2);
                   
                    stage <= FETCH;
            end case;
            
           end if;
    end process;
    
    
    
     
end Behavioral;