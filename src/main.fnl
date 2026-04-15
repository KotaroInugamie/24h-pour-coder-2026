;; title:  Dodge
;; author: QBitStudio
;; desc:   A dodge game designed by QBitSoft.
;; script: fennel

(global state 0) ;; 0: start, 2: playing, 3: game over.
(global best-score 0)

(global score 0)

(var couleur-texte 0)  ; 6 = vert. Essaie 11 (bleu clair)
(var background-color-menu 12)  ; 12 = Blanc. Essaie 0 (Noir)
(var background-color-game 6)

;; Variable pour l'animation
(var t 0)

(fn switch-state [btn next-state]
  (if (= true btn)
    (set state next-state)))

(fn render-start-menu []
  (cls background-color-menu)

  (var decalage-y (* (math.sin t) 5))
  
  ;; Start menu title and sub.
  (print (.. "Best Score: " 0) 2 2 couleur-texte true 1 true)

  (print "Dodge!" 45 (+ 50 decalage-y) couleur-texte)
  (print "press up arrow button to continue" 45 (+ 60 decalage-y) couleur-texte false 1 true)

  (print "By QBitSoft!" 200 130 couleur-texte true 1 true))

(fn manage-start-menu [] ;; State 0. Start menu.
  (render-start-menu)

  (switch-state (btn 0) 1))

(fn render-game []
  (cls background-color-game)
  (print (.. "Score: " score) 2 2 couleur-texte true 1 true))

(fn manage-main-game []
  (render-game))

;; Boucle principale exécutée à 60 FPS
(fn _G.TIC []
  (trace (.. "State " state)) ;; Debug
  
  (if (= state 0)
    (manage-start-menu))
  
  (if (= state 1)
    (manage-main-game))
  
  ;; 4. Fait avancer le temps
  (set t (+ t 0.1)))