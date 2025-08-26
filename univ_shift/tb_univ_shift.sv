
module tb_univ_shift;

  parameter N = 8;

  // Testbench signals
  logic clk;
  logic rst;
  logic [1:0] ctrl;
  logic [N-1:0] d;
  logic [N-1:0] q;

  // DUT instantiation
  univ_shift #(N) uut (
    .clk(clk),
    .rst(rst),
    .ctrl(ctrl),
    .d(d),
    .q(q)
  );

  // Clock generation: 10ns period
  always #5 clk = ~clk;

  // Test procedure
  initial begin
    $display("===== Universal Shift Register Testbench =====");
    clk = 0;
    rst = 1; ctrl = 2'b00; d = 8'h00;

    // Reset pulse
    #10 rst = 0;
    $display("[%0t] Reset Deasserted. q = %b", $time, q);

    // Load data (ctrl=11)
    d = 8'b10101010; ctrl = 2'b11;
    #10;
    $display("[%0t] Load d=%b -> q=%b", $time, d, q);

    // Hold (ctrl=00)
    ctrl = 2'b00; 
    #10;
    $display("[%0t] Hold -> q=%b", $time, q);

    // Shift left (ctrl=01)
    d = 8'b10101010;
    ctrl = 2'b01;
    repeat(3) begin
      #10;
      $display("[%0t] Shift Left with d[0]=%b -> q=%b", $time, d[0], q);
    end

    // Shift right (ctrl=10)
    d = 8'b10101010;
    ctrl = 2'b10;
    repeat(3) begin
      #10;
      $display("[%0t] Shift Right with d[N-1]=%b -> q=%b", $time, d[N-1], q);
    end

    // End simulation
    #20;
    $display("===== Simulation Completed =====");
    $stop;
  end

endmodule
