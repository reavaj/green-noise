;nyquist plug-in
;type generate
;name “Green Noise Gen (Golden ratio LFO v1.2)”
;release 1.2

;control dur-min “Duration (Minutes)” float “” 30.0 0.1 60.0
;control slope “Base Slope” choice “Pink (-3dB),Brown (-6dB)” 1
;control low-cut “Lower Frequency (Hz)” int “” 100 100 1000
;control high-cut “Upper Frequency (Hz)” int “” 600 200 2000
;control mod-speed “Modulation Speed (Hz)” float “” 0.001 0.001 2.0
;control mod-depth “Modulation Depth” float “” 0.1 0.0 0.5
;control resonance “Filter Resonance (Q)” float “” 0.5 0.1 5.0

;; Define Golden Mean Constants
(setf phi 1.6180339887)
(setf phi-inv (/ 1.0 phi))

;; 1. Setup Duration and Base Signal
(setf dur-sec (* dur-min 60.0))

(defun generate-base (type)
  (if (= type 0)
      (pink-noise)        
      (lp (noise) 6.0)))

;; 2. The Golden LFOs
;; AM LFO: Uses the inverse golden ratio for the frequency
(defun am-lfo ()
  (let ((freq (* mod-speed phi-inv))) 
    (sum (- 1.0 (* 0.5 mod-depth)) (mult (* 0.5 mod-depth) (hzosc freq)))))

;; FM/Filter LFO: Uses the golden ratio for the frequency
(defun filter-lfo ()
  (let ((freq (* mod-speed phi))) 
    (sum 1.0 (mult mod-depth (hzosc freq)))))

;; 3. Processing with Resonant Filters
(setf signal 
  (stretch-abs dur-sec
    (let* ((source (generate-base slope))
           ;; Apply Amplitude Modulation
           (modulated-amp (mult source (am-lfo)))
           ;; Calculate dynamic frequency centers
           (f-low (mult low-cut (filter-lfo)))
           (f-high (mult high-cut (filter-lfo))))
      ;; Using high-order resonant filters for movement
      (bandpass2 (lp modulated-amp f-high) 
                 (/ (+ low-cut high-cut) 2.0) 
                 resonance))))

;; 4. Internal Normalization to -1.0 dB
(let ((pk (peak signal ny:all)))
  (if (> pk 0)
      (mult (/ 0.89125 pk) signal)
      signal))