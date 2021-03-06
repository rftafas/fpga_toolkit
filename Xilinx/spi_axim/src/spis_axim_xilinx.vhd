----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 29.08.2020 16:18:27
-- Design Name:
-- Module Name: spis_axim_xilinx - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
library expert;
  use expert.std_string.all;
library stdblocks;
  use stdblocks.sync_lib.all;
library stdcores;
    use stdcores.spi_axim_pkg.all;

entity spis_axim_xilinx is
  generic (
    CPOL          : std_logic_vector(0 to 0)  := "0";
    CPHA          : std_logic_vector(0 to 0)  := "0";
    ID_WIDTH      : integer    := 1;
    ID_VALUE      : integer    := 0;
    ADDR_BYTE_NUM : integer    := 4;
    DATA_BYTE_NUM : integer    := 4;
    serial_num_rw : boolean      := true;
    native_clock_mode : boolean  := true
    );
  port (
    --general
    rst_i         : in  std_logic;
    mclk_i        : in  std_logic;
    --spi
    mosi_i        : in  std_logic;
    miso_o        : out std_logic;
    spck_i        : in  std_logic;
    spcs_i        : in  std_logic;
    --
    RSTIO_o       : out std_logic;
    DID_i         : in  std_logic_vector(DATA_BYTE_NUM*8-1 downto 0);
    UID_i         : in  std_logic_vector(DATA_BYTE_NUM*8-1 downto 0);
    serial_num_i  : in  std_logic_vector(DATA_BYTE_NUM*8-1 downto 0);
    irq_i         : in  std_logic_vector(7 downto 0);
    irq_o         : out std_logic;
    --AXI-MM
    M_AXI_AWID    : out std_logic_vector(ID_WIDTH-1 downto 0);
    M_AXI_AWVALID : out std_logic;
    M_AXI_AWREADY : in  std_logic;
    M_AXI_AWADDR  : out std_logic_vector(8*ADDR_BYTE_NUM-1 downto 0);
    M_AXI_AWPROT  : out std_logic_vector(2 downto 0);
    --write data channel
    M_AXI_WVALID  : out std_logic;
    M_AXI_WREADY  : in  std_logic;
    M_AXI_WDATA   : out std_logic_vector(8*DATA_BYTE_NUM-1 downto 0);
    M_AXI_WSTRB   : out std_logic_vector(DATA_BYTE_NUM-1 downto 0);
    M_AXI_WLAST   : out std_logic;
    --Write Response channel
    M_AXI_BVALID  : in  std_logic;
    M_AXI_BREADY  : out std_logic;
    M_AXI_BRESP   : in  std_logic_vector(1 downto 0);
    M_AXI_BID     : in  std_logic_vector(ID_WIDTH-1 downto 0);
    -- Read Address channel
    M_AXI_ARVALID : out std_logic;
    M_AXI_ARREADY : in  std_logic;
    M_AXI_ARADDR  : out std_logic_vector(8*ADDR_BYTE_NUM-1 downto 0);
    M_AXI_ARPROT  : out std_logic_vector(2 downto 0);
    M_AXI_ARID    : out std_logic_vector(ID_WIDTH-1 downto 0);
    --Read data channel
    M_AXI_RVALID  : in  std_logic;
    M_AXI_RREADY  : out std_logic;
    M_AXI_RDATA   : in  std_logic_vector(8*DATA_BYTE_NUM-1 downto 0);
    M_AXI_RRESP   : in  std_logic_vector(1 downto 0);
    M_AXI_RID     : in  std_logic_vector(ID_WIDTH-1 downto 0);
    M_AXI_RLAST   : in  std_logic
  );
end spis_axim_xilinx;

architecture Behavioral of spis_axim_xilinx is

	function string_conv ( input : boolean ) return spi_clock_t is
	begin
		if input then
			return native;
		else
			return oversampled;
		end if;
	end string_conv;	

begin

wrapper_u : spi_axi_top
  generic map (
    CPOL          => CPOL(0),
    CPHA          => CPHA(0),
    ID_WIDTH      => ID_WIDTH,
    ID_VALUE      => ID_VALUE,
    ADDR_BYTE_NUM => ADDR_BYTE_NUM,
    DATA_BYTE_NUM => DATA_BYTE_NUM,
    serial_num_rw => serial_num_rw,
    clock_mode    => string_conv(native_clock_mode)
  )
  port map (
    --general
    rst_i         => rst_i,
    mclk_i        => mclk_i,
    --spi
    mosi_i        => mosi_i,
    miso_o        => miso_o,
    spck_i        => spck_i,
    spcs_i        => spcs_i,
    --
    RSTIO_o       => RSTIO_o,
    DID_i         => DID_i,
    UID_i         => UID_i,
    serial_num_i  => serial_num_i,
    irq_i         => irq_i,
    irq_o         => irq_o,
    --AXI-MM
    M_AXI_AWID    => M_AXI_AWID,
    M_AXI_AWVALID => M_AXI_AWVALID,
    M_AXI_AWREADY => M_AXI_AWREADY,
    M_AXI_AWADDR  => M_AXI_AWADDR,
    M_AXI_AWPROT  => M_AXI_AWPROT,
    --write data channel
    M_AXI_WVALID  => M_AXI_WVALID,
    M_AXI_WREADY  => M_AXI_WREADY,
    M_AXI_WDATA   => M_AXI_WDATA,
    M_AXI_WSTRB   => M_AXI_WSTRB,
    M_AXI_WLAST   => M_AXI_WLAST,
    --Write Response channel
    M_AXI_BVALID  => M_AXI_BVALID,
    M_AXI_BREADY  => M_AXI_BREADY,
    M_AXI_BRESP   => M_AXI_BRESP,
    M_AXI_BID     => M_AXI_BID,
    -- Read Address channel
    M_AXI_ARVALID => M_AXI_ARVALID,
    M_AXI_ARREADY => M_AXI_ARREADY,
    M_AXI_ARADDR  => M_AXI_ARADDR,
    M_AXI_ARPROT  => M_AXI_ARPROT,
    M_AXI_ARID    => M_AXI_ARID,
    --Read data channel
    M_AXI_RVALID  => M_AXI_RVALID,
    M_AXI_RREADY  => M_AXI_RREADY,
    M_AXI_RDATA   => M_AXI_RDATA,
    M_AXI_RRESP   => M_AXI_RRESP,
    M_AXI_RID     => M_AXI_RID,
    M_AXI_RLAST   => M_AXI_RLAST
  );

end Behavioral;
