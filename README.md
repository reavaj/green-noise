# Green Noise Generator (Golden Ratio LFO v1.2)

An Audacity Nyquist plugin that generates green noise with dynamic harmonic movement using golden ratio-based modulation.

## Overview

This plugin generates green noise (a perceptually balanced noise between pink and brown noise) with sophisticated amplitude and frequency modulation driven by the golden ratio (φ ≈ 1.618). The result is an evolving, organic soundscape that avoids the static quality of traditional noise generators.

## Features

- **Customizable Noise Base**: Choose between pink noise (-3dB/octave) or brown noise (-6dB/octave)
- **Golden Ratio LFOs**: Two independent low-frequency oscillators modulate the signal using:
  - **AM LFO**: Amplitude modulation at frequency `speed × 1/φ` for smooth rhythmic swells
  - **Filter LFO**: Resonant filter modulation at frequency `speed × φ` for dynamic tonal movement
- **Resonant Bandpass Filter**: Adds warmth and presence to the generated noise
- **Automatic Normalization**: Output normalized to -1.0 dB for consistent levels

## Parameters

| Parameter | Range | Default | Description |
|-----------|-------|---------|-------------|
| **Duration (Minutes)** | 0.1–60 | 1.0 | Length of generated audio |
| **Base Slope** | Pink (-3dB), Brown (-6dB) | Pink | Frequency response of noise floor |
| **Lower Frequency (Hz)** | 100–1000 | 100 | Bandpass filter lower cutoff |
| **Upper Frequency (Hz)** | 200–2000 | 1000 | Bandpass filter upper cutoff |
| **Modulation Speed (Hz)** | 0.01–2.0 | 0.1 | LFO frequency scale factor |
| **Modulation Depth** | 0.0–0.5 | 0.2 | LFO amplitude (0 = no modulation) |
| **Filter Resonance (Q)** | 0.1–5.0 | 0.7 | Bandpass filter sharpness |

## Usage

1. Open Audacity
2. Generate → Green Noise Gen (Golden ratio LFO v1.2)
3. Configure parameters to taste
4. Click **Generate**

## Technical Notes

- Uses the golden ratio (φ = 1.618...) and its reciprocal (1/φ ≈ 0.618) to create mathematically harmonious modulation patterns
- The inverse golden ratio for AM creates slower, gentler swells
- The golden ratio for filter modulation creates faster, more energetic tonal shifts
- Ideal for meditation, focus, sleep, and ambient sound design
