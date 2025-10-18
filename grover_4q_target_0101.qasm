// Grover's algorithm (4 qubits), target = |0101>, 1 iteration
OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg c[4];

// --- Step 1: Initialize superposition ---
h q[0];
h q[1];
h q[2];
h q[3];

// --- Step 2: Oracle for target |0101>
// target bits = 0 1 0 1
// apply X on qubits where target bit = 0  → q[0], q[2]
x q[0];
x q[2];

// Controlled phase flip for |1111>  (H + multi-controlled Toffoli + H)
h q[3];
ccx q[0], q[1], q[2];  // 1st Toffoli helper (if simulator supports more controls, replace with mct)
cx q[2], q[3];         // 2nd control to target
ccx q[0], q[1], q[2];  // uncompute helper
h q[3];

// undo the X gates
x q[0];
x q[2];

// --- Step 3: Diffusion (Inversion about mean) ---
h q[0];
h q[1];
h q[2];
h q[3];
x q[0];
x q[1];
x q[2];
x q[3];

// Controlled-Z for |1111>
h q[3];
ccx q[0], q[1], q[2];
cx q[2], q[3];
ccx q[0], q[1], q[2];
h q[3];

// undo the X gates
x q[0];
x q[1];
x q[2];
x q[3];
h q[0];
h q[1];
h q[2];
h q[3];

// --- Step 4: Measurement ---
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
