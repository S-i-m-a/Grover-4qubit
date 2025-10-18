// Grover's algorithm (2 qubits), target = |10>, 1 iteration
OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg c[2];

// --- Step 1: Initialize superposition ---
h q[0];
h q[1];

// --- Step 2: Oracle for target |10>
// For target bit = 0, apply X gate (here q[1] = 0)
h q[1];
x q[0];
cx q[0], q[1];  // Controlled-Z implemented using H + CX + H
h q[1];
// --- Step 3: Diffusion (Inversion about mean) ---
h q[0];
x q[0];
x q[1];
h q[1];
x q[1];
h q[1];
cx q[0], q[1];
h q[1];
x q[0];
x q[1];
h q[0];
h q[1];

// --- Step 4: Measurement ---
measure q[0] -> c[0];
measure q[1] -> c[1];
