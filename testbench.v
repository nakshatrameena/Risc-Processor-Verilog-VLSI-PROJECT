module testbench;

reg clk;
initial clk = 0;
TopModule uut(clk);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);

    $monitor("Time=%0t PC=%h Instr=%h rs1=%d rs2=%d rd=%d A=%d B=%d Result=%d",
          $time,
          uut.PC.pc,
          uut.IM.instruction,
          uut.rs1,
          uut.rs2,
          uut.rd,
          uut.alu.A,
          uut.alu.B,
          uut.alu.result);
end

always #5 clk = ~clk;

initial begin
    #200 $finish;   // run longer
end

endmodule