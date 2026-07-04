# 📡 Morse Code Decoder in Verilog

A modular **Verilog HDL** implementation of a complete **International Morse Code Decoder**. The design accepts a single key input, distinguishes between dots and dashes using timing analysis, reconstructs Morse code sequences, and converts them into their corresponding **ASCII characters**.

The project integrates a **2-state Mealy Finite State Machine (FSM)**, dedicated timing counters, a dot/dash detector, a symbol (shift) register, and a combinational Morse-to-ASCII decoder into a complete RTL design. The decoder supports the **English alphabet (A–Z)**, **digits (0–9)**, and selected punctuation symbols such as **`?`**.

---

## 🌟 Project Highlights

* ✅ Complete International Morse Code decoder
* ✅ Supports **A–Z**, **0–9**, and selected punctuation (`?`)
* ✅ Compact **2-state Mealy FSM** for system control
* ✅ Dedicated **press** and **gap** counters for timing measurement
* ✅ Timing-based **dot/dash detection**
* ✅ **Shift register (symbol register)** for storing variable-length Morse sequences
* ✅ Combinational **Morse-to-ASCII decoder**
* ✅ Fully modular RTL architecture
* ✅ Functionally verified using **Icarus Verilog** and **GTKWave**

---

## 🏗️ System Architecture

```text
                           +------------------+
                           |    Key Input     |
                           +--------+---------+
                                    |
                                    v
                         +----------------------+
                         |   Morse FSM (2-State)|
                         |    PRESS / GAP       |
                         +----+-----------+-----+
                              |           |
                press_en/clr  |           |  gap_en/clr
                              |           |
                              v           v
                    +---------------+   +---------------+
                    | Press Counter |   |  Gap Counter  |
                    +-------+-------+   +-------+-------+
                            |                   |
                            | press_duration    | gap_duration
                            |                   |
                            v                   |
                  +-------------------+         |
                  | Dot/Dash Detector |         |
                  +---------+---------+         |
                            |                  |
                      symbol, valid            |
                            |                  |
                            +--------+---------+
                                     |
                                     v
                          +---------------------+
                          |   Symbol Register   |
                          | (Pattern & Length)  |
                          +----------+----------+
                                     |
                                     v
                          +---------------------+
                          |   Morse Decoder     |
                          |    (ASCII Output)   |
                          +----------+----------+
                                     |
                                     v
                             +---------------+
                             | ASCII Output  |
                             +---------------+
```

---

## 📂 Project Structure

```text
morse_top_module.v
├── morse_fsm.v
├── press_counter.v
├── gap_counter.v
├── dot_dash_detector.v
├── symbol_register.v
├── morse_decoder.v
└── morse_top_module_tb.v
```

---

## ⚙️ Module Description

| Module                  | Description                                                                                          |
| ----------------------- | ---------------------------------------------------------------------------------------------------- |
| **morse_top_module**    | Integrates all modules and generates the final ASCII output.                                         |
| **morse_fsm**           | Implements a 2-state Mealy FSM to control timing, counters, and decoding flow.                       |
| **press_counter**       | Measures the duration of each key press.                                                             |
| **gap_counter**         | Measures the duration between consecutive key presses to detect symbol, letter, and word boundaries. |
| **dot_dash_detector**   | Classifies each completed key press as a dot or a dash.                                              |
| **symbol_register**     | Stores the Morse code sequence (shift register) for a single character.                              |
| **morse_decoder**       | Converts the stored Morse pattern into its corresponding ASCII character.                            |
| **morse_top_module_tb** | Testbench used for functional verification.                                                          |

---

## ⏱️ Timing Parameters

| Event      | Threshold                            |
| ---------- | ------------------------------------ |
| Dot        | Press duration < **10** clock cycles |
| Dash       | Press duration ≥ **10** clock cycles |
| Symbol Gap | Gap duration < **30** clock cycles   |
| Letter Gap | Gap duration ≥ **30** clock cycles   |
| Word Gap   | Gap duration ≥ **70** clock cycles   |

---

## 🧪 Functional Verification

The complete design was simulated and verified using **Icarus Verilog**, with waveform analysis performed in **GTKWave**.

### Successfully Verified

| Morse Code | Output |
| ---------- | ------ |
| `.`        | E      |
| `.-`       | A      |
| `-`        | T      |
| `...`      | S      |
| `....`     | H      |
| `..`       | I      |
| `.....`    | 5      |
| `..--..`   | ?      |
| `.... ..`  | HI     |

---

## 🛠️ Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Visual Studio Code

---

## 📚 Concepts Demonstrated

* Register Transfer Level (RTL) Design
* Finite State Machines (FSM)
* Modular Digital Design
* Timing-Based Signal Processing
* Shift Registers
* Counters
* Combinational Logic
* Functional Verification

---

## 🚀 Future Enhancements

* FPGA implementation
* Push-button debouncing
* PS/2 keyboard input
* UART interface
* LCD/Seven-segment display output
* Morse code encoder mode

---

## 👩‍💻 Author

**Komalpreet Kaur**

