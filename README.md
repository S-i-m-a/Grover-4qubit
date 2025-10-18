# 🌀 Grover's Algorithm (4 Qubits) — Target |0101⟩

This repository contains the **OpenQASM 2.0** implementation of **Grover's Algorithm** using **4 qubits** and **1 iteration**.  
The marked (target) state is `|0101⟩`.

---

## 🧩 File Description
- **grover_4q_target_0101.qasm** — The OpenQASM 2.0 quantum circuit implementing Grover’s algorithm for the target `|0101⟩`.
- **image1.png** — Screenshot of the circuit.

---

## 📸 Circuit Screenshot
![Grover 4-Qubit Circui<img width="1908" height="879" alt="image1" src="https://github.com/user-attachments/assets/87400403-7e3e-4906-83fc-a0cd59835ad4" />

---

## 🧠 How to Run (using Qiskit)

### 1️⃣ Install Qiskit
```bash
pip install qiskit
2️⃣ Load and Simulate
python
Copy code
from qiskit import QuantumCircuit, Aer, transpile

# Load the QASM file
qc = QuantumCircuit.from_qasm_file('grover_4q_target_0101.qasm')
print(qc)

# Simulate the circuit
sim = Aer.get_backend('aer_simulator')
tqc = transpile(qc, sim)
result = sim.run(tqc, shots=1024).result()

# Show output counts
print("Measurement results:")
print(result.get_counts())
