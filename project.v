`default_nettype none

module chip (
    output     [2:0] led,
    output           uart_tx,
    input            uart_rx,
    output           spi_miso,
    input            spi_mosi,
    input            spi_sck,
    input            spi_cs,
    input            ram_data1,
    output           ram_data0,
    output           ram_data2,
    output           ram_data3,
    output           ram_sck,
    output           ram_cs
);

// PSRAM passthrough
assign spi_miso = ram_data1;
assign ram_data0 = spi_mosi;
assign ram_cs = spi_cs;
assign ram_sck = spi_sck;
assign ram_data2 = 1;
assign ram_data3 = 1;

// UART loopback
assign uart_tx = uart_rx;

// LED
assign led[0] = ram_cs;
assign led[1] = 1; // Off
assign led[2] = 1; // Off

endmodule
