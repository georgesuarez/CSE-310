module seven_segment_led ( output a, b, c, d, e, f, g, input A, B, C, D );
    assign a = (!B && !D) || C || (B && D) || A;
    assign b = !B || (!C && !D) || (C && D);
    assign c = !C || D || B;
    assign d = (!B && !D) || (!B && C) || (B && !C && D) || (C && !D) || A;
    assign e = (!B && !D) || (C && !D);
    assign f = (!C && !D) || (B && !C) || (B && !D) || A;
    assign g = (!B && C) || (B && !C) || A || (B && !D);
endmodule